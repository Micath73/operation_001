import 'package:flutter/material.dart';
import 'package:operation_001/novena_combo.dart';
import 'package:operation_001/novena_data.dart';
import 'package:operation_001/novena_detail_screen.dart';

class NovenaSection extends StatefulWidget {
  final VoidCallback? onNovenaChanged;

  const NovenaSection({super.key, this.onNovenaChanged});

  @override
  State<NovenaSection> createState() => _NovenaSectionState();
}

class _NovenaSectionState extends State<NovenaSection> {
  String selectedCategory = 'All';

  static const List<String> categories = [
    'All',
    'Catechism',
    'Dogma',
    'Saints',
    'Liturgical',
    'Devotions',
  ];

  static const List<NovenaCombo> spiritualLessons = [
    // Module 1: Basic Catechism
    NovenaCombo(text: 'The Trinity: One God in Three Persons', imagePath: 'assets/Holy Trinity.jpg', category: 'Catechism'),
    NovenaCombo(text: 'The Incarnation and Redemption', imagePath: 'assets/Jesus And Mary.jpg', category: 'Catechism'),
    NovenaCombo(text: 'The Four Last Things', imagePath: 'assets/The End Is Near.jpg', category: 'Catechism'),
    NovenaCombo(text: 'The Ten Commandments', imagePath: 'assets/My Daily Journal.jpg', category: 'Catechism'),

    // Module 2: Essential Dogmas
    NovenaCombo(text: 'The Divinity of Christ', imagePath: 'assets/Adoration.jpg', category: 'Dogma'),
    NovenaCombo(text: 'The Real Presence in the Eucharist', imagePath: 'assets/Holy Mass.jpg', category: 'Dogma'),
    NovenaCombo(text: 'The Immaculate Conception', imagePath: 'assets/The Ascencion Of Mary.jpg', category: 'Dogma'),
    NovenaCombo(text: 'The Sorrows of Mary', imagePath: 'assets/The Sorrows Of Mary.jpg', category: 'Dogma'),

    // Module 3: Saint Writings
    NovenaCombo(text: 'St. Augustine: Restless Hearts', imagePath: 'assets/Saint Dominic.jpg', category: 'Saints'),
    NovenaCombo(text: 'St. Thomas Aquinas: Faith & Reason', imagePath: 'assets/Priestlyhood.jpg', category: 'Saints'),

    // Module 4: Liturgical Year
    NovenaCombo(text: 'Lent: Conversion & Fasting', imagePath: 'assets/Lent.jpg', category: 'Liturgical'),
    NovenaCombo(text: 'Ash Wednesday', imagePath: 'assets/Ash Wednesday.jpg', category: 'Liturgical'),
    NovenaCombo(text: 'Palm Sunday', imagePath: 'assets/Pakm Sunday 2.jpg', category: 'Liturgical'),
    NovenaCombo(text: 'Good Friday', imagePath: 'assets/Good Friday (2).jpg', category: 'Liturgical'),
    NovenaCombo(text: 'He Is Risen', imagePath: 'assets/He is Risen.jpg', category: 'Liturgical'),

    // Module 5: Practicing Devotions
    NovenaCombo(text: 'The Holy Mass', imagePath: 'assets/Holy Mass.jpg', category: 'Devotions'),
    NovenaCombo(text: 'Sacrament of Reconciliation', imagePath: 'assets/My Day I blessed.jpg', category: 'Devotions'),
    NovenaCombo(text: 'Sacrament of Marriage', imagePath: 'assets/The Sacrament Of Marriage.jpg', category: 'Devotions'),
  ];

  static const List<NovenaCombo> novenaTitles = [
    NovenaCombo(text: 'Divine Mercy Chaplet', imagePath: 'assets/img_3.png'),
    NovenaCombo(text: 'Sacred Heart', imagePath: 'assets/SacredHeart.jpg'),
    NovenaCombo(text: 'Arch Angel Michael', imagePath: 'assets/Michael.jpg'),
    NovenaCombo(text: 'Holy Trinity', imagePath: 'assets/Trinity.jpg'),
    NovenaCombo(text: 'Pentecost', imagePath: 'assets/Pentecost.jpg'),
    NovenaCombo(text: 'Pope Leo', imagePath: 'assets/Leo.jpg'),
  ];

  List<NovenaCombo> get filteredLessons {
    if (selectedCategory == 'All') return spiritualLessons;
    return spiritualLessons.where((item) => item.category == selectedCategory).toList();
  }

  Future<void> _openNovenaDetail(BuildContext context, String title) async {
    final novenaMatch = novenaTitles.where((n) => n.text == title);
    final lessonMatch = spiritualLessons.where((p) => p.text == title);

    String imagePath = 'assets/img_3.png';

    if (novenaMatch.isNotEmpty) {
      imagePath = novenaMatch.first.imagePath;
    } else if (lessonMatch.isNotEmpty) {
      imagePath = lessonMatch.first.imagePath;
    }

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NovenaDetailScreen(
          title: title,
          novenaImage: imagePath,
          storyText: getNovenaStoryForTitle(title),
          days: getNovenaDaysForTitle(title),
        ),
      ),
    );

    widget.onNovenaChanged?.call();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final displayedLessons = filteredLessons;
    final previewNovenas = novenaTitles.take(4).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SPIRITUAL LESSONS SECTION
        Container(
          width: double.infinity,
          color: theme.colorScheme.surface,
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Spiritual Lessons',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SeeAllGridPage(
                              title: 'Spiritual Lessons',
                              items: filteredLessons,
                              cardHeight: 220,
                              onItemTap: (item) => _openNovenaDetail(context, item.text),
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 14,
                        color: theme.colorScheme.primary,
                      ),
                      label: Text(
                        'See All',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // CATEGORY FILTER CHIPS
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final cat = categories[index];
                    final isSelected = selectedCategory == cat;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(cat),
                        selected: isSelected,
                        selectedColor: theme.colorScheme.primaryContainer,
                        backgroundColor: theme.colorScheme.surfaceContainerLow,
                        side: BorderSide(
                          color: isSelected
                              ? theme.colorScheme.primary
                              : theme.colorScheme.outlineVariant,
                        ),
                        labelStyle: TextStyle(
                          color: isSelected
                              ? theme.colorScheme.onPrimaryContainer
                              : theme.colorScheme.onSurfaceVariant,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                        onSelected: (selected) {
                          if (selected) {
                            setState(() {
                              selectedCategory = cat;
                            });
                          }
                        },
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 15),

              // LESSONS HORIZONTAL LIST
              SizedBox(
                height: 280,
                child: displayedLessons.isEmpty
                    ? Center(
                  child: Text(
                    'No lessons in this category yet.',
                    style: TextStyle(color: theme.colorScheme.outline),
                  ),
                )
                    : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: displayedLessons.length,
                  itemBuilder: (context, index) {
                    final pray = displayedLessons[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () => _openNovenaDetail(context, pray.text),
                        child: Column(
                          children: [
                            Container(
                              width: 180,
                              height: 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: theme.colorScheme.shadow.withValues(alpha: 0.12),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  pray.imagePath,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) => Container(
                                    color: theme.colorScheme.surfaceContainerHighest,
                                    child: Icon(
                                      Icons.image_not_supported_rounded,
                                      color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 180,
                              child: Text(
                                pray.text,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: theme.colorScheme.onSurface,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 25),

        // NOVENA SECTION
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Novena',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SeeAllGridPage(
                        title: 'Catholic Novenas',
                        items: novenaTitles,
                        cardHeight: 140,
                        onItemTap: (item) => _openNovenaDetail(context, item.text),
                      ),
                    ),
                  );
                },
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 14,
                  color: theme.colorScheme.primary,
                ),
                label: Text(
                  'See All',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            itemCount: previewNovenas.length,
            itemBuilder: (context, index) {
              final item = previewNovenas[index];
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () => _openNovenaDetail(context, item.text),
                  child: Column(
                    children: [
                      Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            item.imagePath,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              color: theme.colorScheme.surfaceContainerHighest,
                              child: Icon(
                                Icons.image_not_supported_rounded,
                                color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: 110,
                        child: Text(
                          item.text,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: theme.colorScheme.onSurface,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

// SHARED "SEE ALL" EXPANDED PAGE
class SeeAllGridPage extends StatelessWidget {
  final String title;
  final List<NovenaCombo> items;
  final double cardHeight;
  final Function(NovenaCombo) onItemTap;

  const SeeAllGridPage({
    super.key,
    required this.title,
    required this.items,
    required this.cardHeight,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: theme.colorScheme.surface,
        foregroundColor: theme.colorScheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 2,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () => onItemTap(item),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.shadow.withValues(alpha: 0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        item.imagePath,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: theme.colorScheme.surfaceContainerHighest,
                          child: Icon(
                            Icons.image_not_supported_rounded,
                            color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item.text,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}