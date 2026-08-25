import 'package:flutter/material.dart';
import 'package:operation_001/novena_combo.dart';
import 'package:operation_001/novena_data.dart';
import 'package:operation_001/novena_detail_screen.dart';

class NovenaSection extends StatefulWidget {
  const NovenaSection({super.key});

  @override
  State<NovenaSection> createState() => _NovenaSectionState();
}

class _NovenaSectionState extends State<NovenaSection> {
  final List<NovenaCombo> prayers = [
    NovenaCombo(text: 'Adoration', imagePath: 'assets/Adoration.jpg'),
    NovenaCombo(
      text: 'Arch Angel Rafael',
      imagePath: 'assets/Arch Angel Rafael.jpg',
    ),
    NovenaCombo(text: 'Ash Wednesday', imagePath: 'assets/Ash Wednesday.jpg'),
    NovenaCombo(text: 'Baptism', imagePath: 'assets/Baptism.jpg'),
    NovenaCombo(text: 'Christ iS Born', imagePath: 'assets/Christ Is Born.jpg'),
    NovenaCombo(
      text: 'Good Deed Thursday',
      imagePath: 'assets/Good Deed Thursday.jpg',
    ),
    NovenaCombo(text: 'Good Friday', imagePath: 'assets/Good Friday (2).jpg'),
    NovenaCombo(text: 'He Is Risen', imagePath: 'assets/He is Risen.jpg'),
    NovenaCombo(text: 'Holy Mass', imagePath: 'assets/Holy Mass.jpg'),
    NovenaCombo(text: 'Holy Trinity', imagePath: 'assets/Holy Trinity.jpg'),
    NovenaCombo(text: 'Jesus And Mary', imagePath: 'assets/Jesus And Mary.jpg'),
    NovenaCombo(text: 'Lent', imagePath: 'assets/Lent.jpg'),
    NovenaCombo(
      text: 'My Daily Journal',
      imagePath: 'assets/My Daily Journal.jpg',
    ),
    NovenaCombo(
      text: 'My Day Is Blessed',
      imagePath: 'assets/My Day I blessed.jpg',
    ),
    NovenaCombo(text: 'Palm Sunday', imagePath: 'assets/Pakm Sunday 2.jpg'),
    NovenaCombo(text: 'Priesthood', imagePath: 'assets/Priestlyhood.jpg'),
    NovenaCombo(text: 'Saint Dominic', imagePath: 'assets/Saint Dominic.jpg'),
    NovenaCombo(
      text: 'The Ascension Of Mary',
      imagePath: 'assets/The Ascencion Of Mary.jpg',
    ),
    NovenaCombo(
      text: 'The End Is Near',
      imagePath: 'assets/The End Is Near.jpg',
    ),
    NovenaCombo(
      text: 'The Sacrament Of Marriage',
      imagePath: 'assets/The Sacrament Of Marriage.jpg',
    ),
    NovenaCombo(
      text: 'The Sorrows Of Mary',
      imagePath: 'assets/The Sorrows Of Mary.jpg',
    ),
  ];

  final List<NovenaCombo> novenaTitles = [
    NovenaCombo(text: 'Divine Mercy Chaplet', imagePath: 'assets/img_3.png'),
    NovenaCombo(text: 'Sacred Heart', imagePath: 'assets/SacredHeart.jpg'),
    NovenaCombo(text: 'Arch Angel Michael', imagePath: 'assets/Michael.jpg'),
    NovenaCombo(text: 'Holy Trinity', imagePath: 'assets/Trinity.jpg'),
    NovenaCombo(text: 'Pentecost', imagePath: 'assets/Pentecost.jpg'),
    NovenaCombo(text: 'Pope Leo', imagePath: 'assets/Leo.jpg'),
  ];

  void _openNovenaDetail(BuildContext context, String title) {
    final dataset =
        novenaData[title] ??
        List.generate(
          9,
          (i) => NovenaDayContent(
            dayNumber: i + 1,
            theme: "Day ${i + 1}: $title Prayer",
            prayer:
                "Opening prayer for Day ${i + 1} of $title...\n\nLord, hear our prayers and bless our intentions. Amen.",
          ),
        );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NovenaDetailScreen(title: title, days: dataset),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final previewLessons = prayers.take(4).toList();
    final previewNovenas = novenaTitles.take(4).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SPIRITUAL LESSONS SECTION
        Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Spiritual Lessons',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SeeAllGridPage(
                              title: 'Spiritual Lessons',
                              items: prayers,
                              cardHeight: 220,
                              onItemTap: (item) =>
                                  _openNovenaDetail(context, item.text),
                            ),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                        color: Colors.deepPurple,
                      ),
                      label: const Text(
                        'See All',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 280,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: previewLessons.length,
                  itemBuilder: (context, index) {
                    final pray = previewLessons[index];
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
                                image: DecorationImage(
                                  image: AssetImage(pray.imagePath),
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.08),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
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
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
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
              const Text(
                'Novena',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
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
                        onItemTap: (item) =>
                            _openNovenaDetail(context, item.text),
                      ),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Colors.deepPurple,
                ),
                label: const Text(
                  'See All',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
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
                          image: DecorationImage(
                            image: AssetImage(item.imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: 110,
                        child: Text(
                          item.text,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
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
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
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
                      image: DecorationImage(
                        image: AssetImage(item.imagePath),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item.text,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
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
