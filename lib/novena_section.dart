import 'package:flutter/material.dart';
import 'package:operation_001/novena_combo.dart';

class NovenaSection extends StatefulWidget {
  const NovenaSection({super.key});

  @override
  State<NovenaSection> createState() => _NovenaSectionState();
}

class _NovenaSectionState extends State<NovenaSection> {


  List<NovenaCombo> prayers=[

    NovenaCombo(text: 'Adoration', imagePath: 'assets/Adoration.jpg'),
    NovenaCombo(text: 'Arch Angel Rafael', imagePath: 'assets/Arch Angel Rafael.jpg'),
    NovenaCombo(text: 'Ash Wednesday', imagePath: 'assets/Ash Wednesday.jpg'),
    NovenaCombo(text: 'Baptism', imagePath: 'assets/Baptism.jpg'),
    NovenaCombo(text: 'Christ iS Born', imagePath: 'assets/Christ Is Born.jpg'),
    NovenaCombo(text: 'Good Deed Thursday', imagePath: 'assets/Good Deed Thursday.jpg'),
    NovenaCombo(text: 'Good Friday', imagePath: 'assets/Good Friday (2).jpg'),
    NovenaCombo(text: 'He Is Risen', imagePath: 'assets/He is Risen.jpg'),
    NovenaCombo(text: 'Holy Mass', imagePath: 'assets/Holy Mass.jpg'),
    NovenaCombo(text: 'Holy Trinity', imagePath: 'assets/Holy Trinity.jpg'),
    NovenaCombo(text: 'Jesus And Mary', imagePath: 'assets/Jesus And Mary.jpg'),
    NovenaCombo(text: 'Lent', imagePath: 'assets/Lent.jpg'),
    NovenaCombo(text: 'My Daily Journal', imagePath: 'assets/My Daily Journal.jpg'),
    NovenaCombo(text: 'My Day Is Blessed', imagePath: 'assets/My Day I blessed.jpg'),
    NovenaCombo(text: 'Palm Sunday', imagePath: 'assets/Pakm Sunday 2.jpg'),
    NovenaCombo(text: 'Priesthood', imagePath: 'assets/Priestlyhood.jpg'),
    NovenaCombo(text: 'Saint Dominic', imagePath: 'assets/Saint Dominic.jpg'),
    NovenaCombo(text: 'The Ascension Of Mary', imagePath: 'assets/The Ascencion Of Mary.jpg'),
    NovenaCombo(text: 'The End Is Near', imagePath: 'assets/The End Is Near.jpg'),
    NovenaCombo(text: 'The Sacrament Of Marriage', imagePath: 'assets/The Sacrament Of Marriage.jpg'),
    NovenaCombo(text: 'The Sorrows Of Mary', imagePath: 'assets/The Sorrows Of Mary.jpg'),

  ];

  List<NovenaCombo> novenaTitles = [
    NovenaCombo(text: 'Mary Mother Of God', imagePath: 'assets/Mary.jpg'),
    NovenaCombo(text: 'Sacred Heart', imagePath: 'assets/SacredHeart.jpg'),
    NovenaCombo(text: 'Arch Angel Michael', imagePath: 'assets/Michael.jpg'),
    NovenaCombo(text: 'Holy Trinity', imagePath: 'assets/Trinity.jpg'),
    NovenaCombo(text: 'Pentecost', imagePath: 'assets/Pentecost.jpg'),
    NovenaCombo(text: 'Pope Leo', imagePath: 'assets/Leo.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Spiritual Lessons',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 440,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: prayers.length,
                  itemBuilder: (context, index) {
                    final pray = prayers[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Column(
                        children: [
                          Container(
                            width: 280,
                            height: 380,
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
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: 280,
                            child: Text(
                              pray.text,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Novena',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            itemCount: novenaTitles.length,
            itemBuilder: (context, index) {
              final item = novenaTitles[index];
              return Padding(
                padding: const EdgeInsets.only(right: 12),
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
              );
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
  }