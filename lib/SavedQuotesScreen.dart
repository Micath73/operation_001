import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:operation_001/db_helper.dart'; // Adjust path based on project structure

class SavedQuotesScreen extends StatefulWidget {
  const SavedQuotesScreen({super.key});

  @override
  State<SavedQuotesScreen> createState() => _SavedQuotesScreenState();
}

class _SavedQuotesScreenState extends State<SavedQuotesScreen> {
  List<Map<String, dynamic>> _savedQuotes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSavedQuotes();
  }

  Future<void> _loadSavedQuotes() async {
    setState(() => _isLoading = true);
    final quotes = await DatabaseHelper.instance.getFavoriteQuotes();
    setState(() {
      _savedQuotes = quotes;
      _isLoading = false;
    });
  }

  Future<void> _deleteQuote(String text) async {
    await DatabaseHelper.instance.removeFavoriteQuote(text);
    _loadSavedQuotes();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Quote removed from favorites'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> _clearAllQuotes() async {
    final bool? confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear All Quotes'),
        content: const Text('Are you sure you want to remove all saved quotes?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Clear All'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      for (var quote in _savedQuotes) {
        await DatabaseHelper.instance.removeFavoriteQuote(quote['text']);
      }
      _loadSavedQuotes();
    }
  }

  void _copyToClipboard(String text, String author) {
    Clipboard.setData(ClipboardData(text: '"$text" — $author'));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Quote copied to clipboard!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Quotes'),
        actions: [
          if (_savedQuotes.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep_rounded),
              tooltip: 'Clear All',
              onPressed: _clearAllQuotes,
            ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _savedQuotes.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bookmark_outline_rounded,
              size: 72,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: 16),
            Text(
              'No saved quotes yet',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Bookmarked quotes will show up here.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
        itemCount: _savedQuotes.length,
        itemBuilder: (context, index) {
          final quote = _savedQuotes[index];
          final String text = quote['text'] ?? '';
          final String author = quote['author'] ?? 'Unknown';

          return Dismissible(
            key: Key(text),
            direction: DismissDirection.endToStart,
            background: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20.0),
              margin: const EdgeInsets.only(bottom: 12.0),
              decoration: BoxDecoration(
                color: theme.colorScheme.error,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                Icons.delete_outline_rounded,
                color: theme.colorScheme.onError,
                size: 28,
              ),
            ),
            onDismissed: (_) => _deleteQuote(text),
            child: Card(
              elevation: 0,
              color: theme.colorScheme.surfaceContainerLow,
              margin: const EdgeInsets.only(bottom: 12.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  color: theme.colorScheme.outlineVariant
                      .withValues(alpha: 0.5),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '"$text"',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontStyle: FontStyle.italic,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            '— $author',
                            style:
                            theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.copy_rounded),
                              iconSize: 20,
                              tooltip: 'Copy',
                              onPressed: () =>
                                  _copyToClipboard(text, author),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.bookmark_remove_rounded,
                              ),
                              iconSize: 22,
                              color: theme.colorScheme.error,
                              tooltip: 'Remove',
                              onPressed: () => _deleteQuote(text),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}