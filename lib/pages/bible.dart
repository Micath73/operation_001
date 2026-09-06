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
      description:
      'Modern Catholic edition with contextual African commentaries',
      downloadUrl:
      'https://github.com/Micath73/operation_001/releases/download/v1.0.0/african_bible.db',
      size: '5.2 MB',
      isModern: true,
    ),
    BibleVersion(
      id: 'nabre',
      name: 'NABRE (New American Bible)',
      description: 'Modern Catholic standard translation for mass and readings',
      downloadUrl:
      'https://github.com/Micath73/operation_001/releases/download/v1.0.0/nabre.db',
      size: '5.1 MB',
      isModern: true,
    ),
    BibleVersion(
      id: 'rsvce',
      name: 'RSV-CE (Revised Standard)',
      description: 'Classic modern formal equivalence Catholic edition',
      downloadUrl:
      'https://github.com/Micath73/operation_001/releases/download/v1.0.0/rsvce.db',
      size: '4.8 MB',
      isModern: true,
    ),
    BibleVersion(
      id: 'njb',
      name: 'New Jerusalem Bible (NJB)',
      description:
      'Modern dynamic Catholic translation with rich literary quality',
      downloadUrl:
      'https://github.com/Micath73/operation_001/releases/download/v1.0.0/njb.db',
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

      debugPrint(
        "✨ Loaded ${_verses.length} verses for ${_selectedBook!['name']} Ch. $_selectedChapter!",
      );
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

  Future<void> _downloadAndSwitchBible(
      BibleVersion version,
      StateSetter setModalState,
      ) async {
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
    final theme = Theme.of(context);

    showModalBottomSheet(
      context: context,
      backgroundColor: theme.colorScheme.surface,
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
                      Text(
                        'Catholic Bible Versions',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.close,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  Divider(color: theme.colorScheme.outlineVariant),
                  Expanded(
                    child: ListView.separated(
                      itemCount: _availableVersions.length,
                      separatorBuilder: (context, index) =>
                          Divider(height: 1, color: theme.colorScheme.outlineVariant),
                      itemBuilder: (context, index) {
                        final ver = _availableVersions[index];
                        final isDownloading = _downloadProgress.containsKey(
                          ver.id,
                        );
                        final progress = _downloadProgress[ver.id] ?? 0.0;
                        final isSelected = _currentTranslation == ver.name;

                        return ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 6.0,
                          ),
                          title: Row(
                            children: [
                              Flexible(
                                child: Text(
                                  ver.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: isSelected
                                        ? theme.colorScheme.primary
                                        : theme.colorScheme.onSurface,
                                  ),
                                ),
                              ),
                              if (ver.isModern) ...[
                                const SizedBox(width: 6),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.tertiaryContainer,
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: theme.colorScheme.tertiary
                                          .withAlpha(76),
                                    ),
                                  ),
                                  child: Text(
                                    'Modern',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: theme.colorScheme.onTertiaryContainer,
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
                              Text(
                                ver.description,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                ver.isDownloaded
                                    ? 'Ready for Offline Use'
                                    : 'Download Size: ${ver.size}',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: ver.isDownloaded
                                      ? theme.colorScheme.primary
                                      : theme.colorScheme.outline,
                                  fontWeight: ver.isDownloaded
                                      ? FontWeight.bold
                                      : FontWeight.normal,
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
                              color: theme.colorScheme.primary,
                            ),
                          )
                              : ver.isDownloaded
                              ? Icon(
                            isSelected
                                ? Icons.check_circle_rounded
                                : Icons.radio_button_unchecked,
                            color: theme.colorScheme.primary,
                          )
                              : IconButton(
                            icon: Icon(
                              Icons.download_for_offline_outlined,
                              color: theme.colorScheme.outline,
                            ),
                            onPressed: () => _downloadAndSwitchBible(
                              ver,
                              setModalState,
                            ),
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
    final theme = Theme.of(context);
    final otBooks = _allBooks.where((b) => b['id'] <= 46).toList();
    final ntBooks = _allBooks.where((b) => b['id'] >= 47).toList();

    showModalBottomSheet(
      context: context,
      backgroundColor: theme.colorScheme.surface,
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
                    color: theme.colorScheme.outlineVariant,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                TabBar(
                  indicatorColor: theme.colorScheme.primary,
                  labelColor: theme.colorScheme.primary,
                  unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
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
    final theme = Theme.of(context);

    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        final isSelected = _selectedBook?['id'] == book['id'];

        return ListTile(
          title: Text(
            book['name'] ?? book['en'] ?? 'Book ${book['id']}',
            style: TextStyle(
              color: isSelected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurface,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          trailing: Icon(
            Icons.chevron_right,
            color: theme.colorScheme.outline,
          ),
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
    final theme = Theme.of(context);

    showModalBottomSheet(
      context: context,
      backgroundColor: theme.colorScheme.surface,
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
                style: TextStyle(
                  color: theme.colorScheme.primary,
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
                    final isCurrent =
                        _selectedBook?['id'] == book['id'] &&
                            _selectedChapter == ch;

                    return InkWell(
                      borderRadius: BorderRadius.circular(8),
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
                              ? theme.colorScheme.primary
                              : theme.colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            '$ch',
                            style: TextStyle(
                              color: isCurrent
                                  ? theme.colorScheme.onPrimary
                                  : theme.colorScheme.onSurface,
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
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            // Header Bar
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 12.0,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.menu_book_rounded,
                    color: theme.colorScheme.primary,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    widget.isAmharic ? 'መጽሐፍ ቅዱስ' : 'HOLY BIBLE',
                    style: TextStyle(
                      fontFamily: 'Georgia',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: _showVersionDownloadPicker,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      constraints: const BoxConstraints(
                        maxWidth: 160,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withAlpha(20),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: theme.colorScheme.primary.withAlpha(51),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.auto_awesome,
                            color: theme.colorScheme.primary,
                            size: 14,
                          ),
                          const SizedBox(width: 6),
                          Flexible(
                            child: Text(
                              _currentTranslation,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                color: theme.colorScheme.primary,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 2),
                          Icon(
                            Icons.arrow_drop_down,
                            color: theme.colorScheme.primary,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Selection Header (Book & Chapter Picker)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 4.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: _showBookAndChapterPicker,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surfaceContainerHigh,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: theme.colorScheme.outlineVariant,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(8),
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
                              style: TextStyle(
                                color: theme.colorScheme.onSurface,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.arrow_drop_down,
                              color: theme.colorScheme.primary,
                            ),
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
                            .then(
                              (chapters) =>
                              _showChapterGrid(_selectedBook!, chapters),
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceContainerHigh,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: theme.colorScheme.outlineVariant,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(8),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        'Ch. $_selectedChapter',
                        style: TextStyle(
                          color: theme.colorScheme.primary,
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
                    color: theme.colorScheme.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: theme.colorScheme.outlineVariant,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(8),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: _isLoading
                      ? Center(
                    child: CircularProgressIndicator(
                      color: theme.colorScheme.primary,
                    ),
                  )
                      : _verses.isEmpty
                      ? Center(
                    child: Text(
                      widget.isAmharic
                          ? 'ምንም ጥቅስ አልተገኘም።'
                          : 'No verses found in database.',
                      style: TextStyle(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  )
                      : ListView.separated(
                    padding: const EdgeInsets.all(20),
                    physics: const BouncingScrollPhysics(),
                    itemCount: _verses.length,
                    separatorBuilder: (context, index) => Divider(
                      color: theme.colorScheme.outlineVariant.withAlpha(128),
                      height: 24,
                    ),
                    itemBuilder: (context, index) {
                      final verse = _verses[index];
                      return SelectableText.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '${verse.verse}  ',
                              style: TextStyle(
                                fontFamily: 'Georgia',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                            TextSpan(
                              text: verse.getText(widget.isAmharic),
                              style: TextStyle(
                                fontFamily: 'Georgia',
                                fontSize: 17,
                                height: 1.6,
                                color: theme.colorScheme.onSurface,
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