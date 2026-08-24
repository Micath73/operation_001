import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:operation_001/bible_db_helper.dart';
import 'package:operation_001/bible_model.dart';

class BibleVersion {
  final String id;
  final String name;
  final String description;
  final String downloadUrl;
  final String size;
  final bool isModern;
  bool isDownloaded;

  BibleVersion({
    required this.id,
    required this.name,
    required this.description,
    required this.downloadUrl,
    required this.size,
    this.isModern = true,
    this.isDownloaded = false,
  });
}

class UserBible extends StatefulWidget {
  final bool isAmharic;
  const UserBible({super.key, this.isAmharic = false});

  @override
  State<UserBible> createState() => _UserBibleState();
}

class _UserBibleState extends State<UserBible> {
  List<Map<String, dynamic>> _allBooks = [];
  Map<String, dynamic>? _selectedBook;
  int _selectedChapter = 1;
  bool _isLoading = true;
  List<BibleVerse> _verses = [];

  String _currentTranslation = 'Douay-Rheims';

  final List<BibleVersion> _availableVersions = [
    BibleVersion(
      id: 'dr',
      name: 'Douay-Rheims (1899)',
      description: 'Traditional Catholic translation from Latin Vulgate',
      downloadUrl: '',
      size: '4.97 MB',
      isModern: false,
      isDownloaded: true,
    ),
    BibleVersion(
      id: 'african_bible',
      name: 'The African Bible (NAB)',
      description: 'Modern Catholic edition with contextual African commentaries',
      downloadUrl: 'https://github.com/Micath73/operation_001/releases/download/v1.0.0/african_bible.db',
      size: '5.2 MB',
      isModern: true,
    ),
    BibleVersion(
      id: 'nabre',
      name: 'NABRE (New American Bible)',
      description: 'Modern Catholic standard translation for mass and readings',
      downloadUrl: 'https://github.com/Micath73/operation_001/releases/download/v1.0.0/nabre.db',
      size: '5.1 MB',
      isModern: true,
    ),
    BibleVersion(
      id: 'rsvce',
      name: 'RSV-CE (Revised Standard)',
      description: 'Classic modern formal equivalence Catholic edition',
      downloadUrl: 'https://github.com/Micath73/operation_001/releases/download/v1.0.0/rsvce.db',
      size: '4.8 MB',
      isModern: true,
    ),
    BibleVersion(
      id: 'njb',
      name: 'New Jerusalem Bible (NJB)',
      description: 'Modern dynamic Catholic translation with rich literary quality',
      downloadUrl: 'https://github.com/Micath73/operation_001/releases/download/v1.0.0/njb.db',
      size: '5.4 MB',
      isModern: true,
    ),
  ];

  final Map<String, double> _downloadProgress = {};

  @override
  void initState() {
    super.initState();
    _checkDownloadedFiles();
    _loadInitialData();
  }

  Future<void> _checkDownloadedFiles() async {
    final dir = await getApplicationDocumentsDirectory();
    for (var ver in _availableVersions) {
      if (ver.id != 'dr') {
        final filePath = p.join(dir.path, '${ver.id}.db');
        if (File(filePath).existsSync()) {
          ver.isDownloaded = true;
        }
      }
    }
    if (mounted) setState(() {});
  }

  Future<void> _loadInitialData() async {
    setState(() => _isLoading = true);
    try {
      final books = await BibleDatabaseHelper.instance.getBooks();
      if (books.isNotEmpty) {
        _allBooks = books;
        _selectedBook = books.first;
        await _loadChapterFromDatabase();
      } else {
        setState(() => _isLoading = false);
      }
    } catch (e) {
      debugPrint("❌ Database Book Load Error: $e");
      setState(() => _isLoading = false);
    }
  }

  Future<void> _loadChapterFromDatabase() async {
    if (_selectedBook == null) return;
    setState(() => _isLoading = true);

    try {
      final versesFromDb = await BibleDatabaseHelper.instance.getChapterVerses(
        _selectedBook!['id'],
        _selectedChapter,
      );

      setState(() {
        _verses = versesFromDb;
        _isLoading = false;
      });

      debugPrint("✨ Loaded ${_verses.length} verses for ${_selectedBook!['name']} Ch. $_selectedChapter!");
    } catch (e) {
      debugPrint("❌ Database Verse Load Error: $e");
      setState(() => _isLoading = false);
    }
  }

  Future<void> _switchVersion(BibleVersion version) async {
    setState(() => _isLoading = true);
    if (version.id == 'dr') {
      await BibleDatabaseHelper.instance.resetToDefaultDatabase();
    } else {
      final dir = await getApplicationDocumentsDirectory();
      final filePath = p.join(dir.path, '${version.id}.db');
      await BibleDatabaseHelper.instance.openDownloadedDatabase(filePath);
    }
    setState(() => _currentTranslation = version.name);
    await _loadInitialData();
  }

  Future<void> _downloadAndSwitchBible(BibleVersion version, StateSetter setModalState) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final savePath = p.join(dir.path, '${version.id}.db');

      final dio = Dio();
      await dio.download(
        version.downloadUrl,
        savePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            setState(() {
              _downloadProgress[version.id] = received / total;
            });
            setModalState(() {});
          }
        },
      );

      setState(() {
        version.isDownloaded = true;
        _downloadProgress.remove(version.id);
      });
      setModalState(() {});

      await _switchVersion(version);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${version.name} ready & activated!')),
        );
      }
    } catch (e) {
      setState(() => _downloadProgress.remove(version.id));
      setModalState(() {});
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to download ${version.name}: $e')),
        );
      }
    }
  }

  void _showVersionDownloadPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: const EdgeInsets.all(20.0),
              height: MediaQuery.of(context).size.height * 0.65,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Catholic Bible Versions',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1D1B20),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const Divider(),
                  Expanded(
                    child: ListView.separated(
                      itemCount: _availableVersions.length,
                      separatorBuilder: (context, index) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final ver = _availableVersions[index];
                        final isDownloading = _downloadProgress.containsKey(ver.id);
                        final progress = _downloadProgress[ver.id] ?? 0.0;
                        final isSelected = _currentTranslation == ver.name;

                        return ListTile(
                          contentPadding: const EdgeInsets.symmetric(vertical: 6.0),
                          title: Row(
                            children: [
                              Flexible(
                                child: Text(
                                  ver.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: isSelected ? const Color(0xFF6750A4) : Colors.black87,
                                  ),
                                ),
                              ),
                              if (ver.isModern) ...[
                                const SizedBox(width: 6),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.green.shade50,
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: Colors.green.shade200),
                                  ),
                                  child: const Text(
                                    'Modern',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(ver.description, style: const TextStyle(fontSize: 12)),
                              const SizedBox(height: 4),
                              Text(
                                ver.isDownloaded ? 'Ready for Offline Use' : 'Download Size: ${ver.size}',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: ver.isDownloaded ? const Color(0xFF6750A4) : Colors.grey,
                                  fontWeight: ver.isDownloaded ? FontWeight.bold : FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          trailing: isDownloading
                              ? SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              value: progress,
                              strokeWidth: 3,
                              color: const Color(0xFF6750A4),
                            ),
                          )
                              : ver.isDownloaded
                              ? Icon(
                            isSelected ? Icons.check_circle_rounded : Icons.radio_button_unchecked,
                            color: const Color(0xFF6750A4),
                          )
                              : IconButton(
                            icon: const Icon(Icons.download_for_offline_outlined, color: Colors.grey),
                            onPressed: () => _downloadAndSwitchBible(ver, setModalState),
                          ),
                          onTap: () async {
                            if (ver.isDownloaded) {
                              Navigator.pop(context);
                              await _switchVersion(ver);
                            } else {
                              await _downloadAndSwitchBible(ver, setModalState);
                              if (mounted) Navigator.pop(context);
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showBookAndChapterPicker() {
    final otBooks = _allBooks.where((b) => b['id'] <= 46).toList();
    final ntBooks = _allBooks.where((b) => b['id'] >= 47).toList();

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DefaultTabController(
          length: 2,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.75,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                TabBar(
                  indicatorColor: const Color(0xFF6750A4),
                  labelColor: const Color(0xFF6750A4),
                  unselectedLabelColor: Colors.black54,
                  tabs: [
                    Tab(text: widget.isAmharic ? 'ብሉይ ኪዳን' : 'Old Testament'),
                    Tab(text: widget.isAmharic ? 'ሐዲስ ኪዳን' : 'New Testament'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      _buildBookList(otBooks),
                      _buildBookList(ntBooks),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBookList(List<Map<String, dynamic>> books) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        final isSelected = _selectedBook?['id'] == book['id'];

        return ListTile(
          title: Text(
            book['name'] ?? book['en'] ?? 'Book ${book['id']}',
            style: TextStyle(
              color: isSelected ? const Color(0xFF6750A4) : Colors.black87,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          trailing: Icon(Icons.chevron_right, color: Colors.grey.shade400),
          onTap: () async {
            final chapters = await BibleDatabaseHelper.instance
                .getChaptersForBook(book['id']);
            if (!mounted) return;
            Navigator.pop(context);
            _showChapterGrid(book, chapters);
          },
        );
      },
    );
  }

  void _showChapterGrid(Map<String, dynamic> book, List<int> chapters) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${book['name']} - Select Chapter',
                style: const TextStyle(
                  color: Color(0xFF6750A4),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: chapters.length,
                  itemBuilder: (context, index) {
                    final ch = chapters[index];
                    final isCurrent = _selectedBook?['id'] == book['id'] &&
                        _selectedChapter == ch;

                    return InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        setState(() {
                          _selectedBook = book;
                          _selectedChapter = ch;
                        });
                        _loadChapterFromDatabase();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isCurrent
                              ? const Color(0xFF6750A4)
                              : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            '$ch',
                            style: TextStyle(
                              color: isCurrent ? Colors.white : Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            // Header Bar
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0, vertical: 12.0),
              child: Row(
                children: [
                  const Icon(Icons.menu_book_rounded,
                      color: Color(0xFF6750A4), size: 28),
                  const SizedBox(width: 12),
                  Text(
                    widget.isAmharic ? 'መጽሐፍ ቅዱስ' : 'HOLY BIBLE',
                    style: const TextStyle(
                      fontFamily: 'Georgia',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1D1B20),
                      letterSpacing: 1.2,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: _showVersionDownloadPicker,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      constraints: const BoxConstraints(maxWidth: 160), // Prevents header overflow
                      decoration: BoxDecoration(
                        color: const Color(0xFF6750A4).withOpacity(0.08),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFF6750A4).withOpacity(0.2),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.auto_awesome, color: Color(0xFF6750A4), size: 14),
                          const SizedBox(width: 6),
                          Flexible(
                            child: Text(
                              _currentTranslation,
                              overflow: TextOverflow.ellipsis, // Truncates long names neatly with "..."
                              maxLines: 1,
                              style: const TextStyle(
                                color: Color(0xFF6750A4),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 2),
                          const Icon(Icons.arrow_drop_down, color: Color(0xFF6750A4), size: 16),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            // Selection Header (Book & Chapter Picker)
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0, vertical: 4.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: _showBookAndChapterPicker,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.03),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Text(
                              _selectedBook?['name'] ??
                                  _selectedBook?['en'] ??
                                  'Select Book',
                              style: const TextStyle(
                                color: Color(0xFF1D1B20),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            const Icon(Icons.arrow_drop_down,
                                color: Color(0xFF6750A4)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      if (_selectedBook != null) {
                        BibleDatabaseHelper.instance
                            .getChaptersForBook(_selectedBook!['id'])
                            .then((chapters) =>
                            _showChapterGrid(_selectedBook!, chapters));
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        'Ch. $_selectedChapter',
                        style: const TextStyle(
                          color: Color(0xFF6750A4),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Scripture Reader
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade200),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: _isLoading
                      ? const Center(
                    child: CircularProgressIndicator(
                        color: Color(0xFF6750A4)),
                  )
                      : _verses.isEmpty
                      ? Center(
                    child: Text(
                      widget.isAmharic
                          ? 'ምንም ጥቅስ አልተገኘም።'
                          : 'No verses found in database.',
                      style: const TextStyle(
                          color: Colors.grey),
                    ),
                  )
                      : ListView.separated(
                    padding: const EdgeInsets.all(20),
                    physics: const BouncingScrollPhysics(),
                    itemCount: _verses.length,
                    separatorBuilder: (context, index) =>
                        Divider(
                          color: Colors.grey.shade100,
                          height: 24,
                        ),
                    itemBuilder: (context, index) {
                      final verse = _verses[index];
                      return SelectableText.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '${verse.verse}  ',
                              style: const TextStyle(
                                fontFamily: 'Georgia',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFB58300),
                              ),
                            ),
                            TextSpan(
                              text: verse.getText(widget.isAmharic),
                              style: const TextStyle(
                                fontFamily: 'Georgia',
                                fontSize: 17,
                                height: 1.6,
                                color: Color(0xFF2B2B2B),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}