import 'package:flutter/material.dart';
import 'package:operation_001/models/saint_model.dart';
import 'package:operation_001/repositories/saints_repository.dart';
import 'package:operation_001/screens/saint_detail_screen.dart';

class SaintsDirectoryScreen extends StatefulWidget {
  const SaintsDirectoryScreen({super.key});

  @override
  State<SaintsDirectoryScreen> createState() => _SaintsDirectoryScreenState();
}

class _SaintsDirectoryScreenState extends State<SaintsDirectoryScreen> {
  final TextEditingController _searchController = TextEditingController();
  final SaintsRepository _repository = SaintsRepository.instance;
  List<SaintModel> _displayedSaints = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSaints();
  }

  Future<void> _loadSaints() async {
    await _repository.ensureLoaded();
    if (mounted) {
      setState(() {
        _displayedSaints = _repository.getAllSaints();
        _isLoading = false;
      });
    }
  }

  void _onSearchChanged(String query) {
    setState(() {
      _displayedSaints = _repository.searchSaints(query);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Saints Directory'),
        backgroundColor: theme.colorScheme.surface,
        foregroundColor: theme.colorScheme.onSurface,
        elevation: 0,
      ),
      body: Column(
        children: [
          // SEARCH BAR
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: 'Search by name, title, or patronage...',
                prefixIcon: const Icon(Icons.search_rounded),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                  icon: const Icon(Icons.clear_rounded),
                  onPressed: () {
                    _searchController.clear();
                    _onSearchChanged('');
                  },
                )
                    : null,
                filled: true,
                fillColor: theme.colorScheme.surfaceContainerLow,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // LIST OF SAINTS
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _displayedSaints.isEmpty
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search_off_rounded,
                    size: 64,
                    color: theme.colorScheme.outline,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'No saints found',
                    style: TextStyle(
                      fontSize: 16,
                      color: theme.colorScheme.outline,
                    ),
                  ),
                ],
              ),
            )
                : ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: _displayedSaints.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final saint = _displayedSaints[index];
                final imagePath = saint.imagePath.isNotEmpty
                    ? saint.imagePath
                    : 'assets/saints/placeholder.jpg';

                return Card(
                  elevation: 0,
                  color: theme.colorScheme.surfaceContainerLow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        imagePath,
                        width: 56,
                        height: 56,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: 56,
                          height: 56,
                          color: theme.colorScheme.surfaceContainerHighest,
                          child: Icon(
                            Icons.person_rounded,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      saint.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (saint.liturgicalRank.isNotEmpty) ...[
                          const SizedBox(height: 2),
                          Text(
                            'Feast: ${saint.feastDate} • ${saint.liturgicalRank.toUpperCase()}',
                            style: TextStyle(
                              fontSize: 12,
                              color: theme.colorScheme.outline,
                            ),
                          ),
                        ],
                        if (saint.patronage.isNotEmpty) ...[
                          const SizedBox(height: 2),
                          Text(
                            'Patron of: ${saint.patronage.join(", ")}',
                            style: TextStyle(
                              fontSize: 12,
                              color: theme.colorScheme.primary,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SaintDetailScreen(saint: saint),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}