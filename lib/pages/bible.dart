import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserBible extends StatefulWidget {
  final bool isAmharic;
  const UserBible({super.key, this.isAmharic = false});

  @override
  State<UserBible> createState() => _UserBibleState();
}

class _UserBibleState extends State<UserBible> {
  String _selectedBook = 'Gospel of John';
  int _selectedChapter = 1;
  bool _isDownloaded = false;
  bool _isDownloading = false;
  double _downloadProgress = 0.0;
  List<dynamic> _verses = [];
  String _searchQuery = "";

  final List<String> _books = [
    'Genesis', 'Exodus', 'Psalms', 'Proverbs',
    'Matthew', 'Mark', 'Luke', 'Gospel of John', 'Acts', 'Revelation'
  ];

  @override
  void initState() {
    super.initState();
    _loadSampleVerses();
  }

  Future<void> _loadSampleVerses() async {
    // Simulated Bible scripture payload for clean offline display
    setState(() {
      _verses = [
        {"verse": 1, "text": "In the beginning was the Word, and the Word was with God, and the Word was God."},
        {"verse": 2, "text": "The same was in the beginning with God."},
        {"verse": 3, "text": "All things were made by him; and without him was not any thing made that was made."},
        {"verse": 4, "text": "In him was life; and the life was the light of men."},
        {"verse": 5, "text": "And the light shineth in darkness; and the darkness comprehended it not."},
      ];
    });
  }

  void _downloadBiblePackage() async {
    setState(() {
      _isDownloading = true;
      _downloadProgress = 0.0;
    });

    // Simulate progressive download stream
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(const Duration(milliseconds: 250));
      if (mounted) {
        setState(() {
          _downloadProgress = i / 10;
        });
      }
    }

    if (mounted) {
      setState(() {
        _isDownloading = false;
        _isDownloaded = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color(0xFF1A0F2E),
          content: Text(
            'Holy Bible offline package downloaded successfully! ✨',
            style: TextStyle(color: Color(0xFFE8B84B)),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredVerses = _verses
        .where((v) => v['text'].toString().toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFF0D0814),
      body: Stack(
        children: [
          // Background Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(0, -0.4),
                  radius: 1.2,
                  colors: [
                    Color(0xFF2A1545),
                    Color(0xFF0D0814),
                  ],
                ),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                // Top Custom Header / App Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  child: Row(
                    children: [
                      const Icon(Icons.menu_book_rounded, color: Color(0xFFE8B84B), size: 28),
                      const SizedBox(width: 12),
                      Text(
                        widget.isAmharic ? 'መጽሐፍ ቅዱስ' : 'HOLY BIBLE',
                        style: const TextStyle(
                          fontFamily: 'Georgia',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const Spacer(),

                      // Download Button with State Handler
                      _isDownloading
                          ? SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          value: _downloadProgress,
                          color: const Color(0xFFE8B84B),
                          strokeWidth: 2.5,
                        ),
                      )
                          : IconButton(
                        icon: Icon(
                          _isDownloaded
                              ? Icons.cloud_done_rounded
                              : Icons.cloud_download_outlined,
                          color: _isDownloaded ? const Color(0xFFE8B84B) : Colors.white70,
                        ),
                        tooltip: 'Download Offline Scripture Database',
                        onPressed: _isDownloaded ? null : _downloadBiblePackage,
                      ),
                    ],
                  ),
                ),

                // Glassmorphic Book & Chapter Selector Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white.withOpacity(0.12)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Book Selector
                        DropdownButton<String>(
                          dropdownColor: const Color(0xFF1A0F2E),
                          value: _selectedBook,
                          underline: Container(),
                          icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFFE8B84B)),
                          style: const TextStyle(
                            fontFamily: 'Georgia',
                            color: Color(0xFFE8B84B),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          items: _books.map((String book) {
                            return DropdownMenuItem<String>(
                              value: book,
                              child: Text(book),
                            );
                          }).toList(),
                          onChanged: (val) {
                            if (val != null) setState(() => _selectedBook = val);
                          },
                        ),

                        // Chapter Controls
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.chevron_left_rounded, color: Colors.white70),
                              onPressed: _selectedChapter > 1
                                  ? () => setState(() => _selectedChapter--)
                                  : null,
                            ),
                            Text(
                              'Ch. $_selectedChapter',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.chevron_right_rounded, color: Colors.white70),
                              onPressed: () => setState(() => _selectedChapter++),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Scripture Reader Box
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.35),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: const Color(0xFFE8B84B).withOpacity(0.2)),
                          ),
                          child: ListView.separated(
                            padding: const EdgeInsets.all(20),
                            physics: const BouncingScrollPhysics(),
                            itemCount: filteredVerses.length,
                            separatorBuilder: (context, index) => Divider(
                              color: Colors.white.withOpacity(0.05),
                              height: 24,
                            ),
                            itemBuilder: (context, index) {
                              final verse = filteredVerses[index];
                              return SelectableText.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '${verse['verse']}  ',
                                      style: const TextStyle(
                                        fontFamily: 'Georgia',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFE8B84B),
                                      ),
                                    ),
                                    TextSpan(
                                      text: verse['text'],
                                      style: const TextStyle(
                                        fontFamily: 'Georgia',
                                        fontSize: 17,
                                        height: 1.6,
                                        color: Colors.white,
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
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}