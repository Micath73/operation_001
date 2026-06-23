import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:operation_001/angelusScreen.dart';
import 'package:operation_001/chapelScreen.dart';
import 'package:operation_001/novena_combo.dart';
import 'package:operation_001/container.dart';
import 'package:operation_001/rosaryScreen.dart';
import 'package:operation_001/NewPrayerTemplatePage.dart';
import 'package:operation_001/expansionTile.dart';

class Dailyprayer extends StatelessWidget {
  Dailyprayer({super.key});

  final List<NovenaCombo> morningPrayers = [
    NovenaCombo(text: 'The Morning Offering', imagePath: 'assets/morning offering.jpg'),
    NovenaCombo(text: 'Prayer of St. Francis', imagePath: 'assets/francis.jpg'),
    NovenaCombo(text: 'The Guardian Angel Prayer', imagePath: 'assets/guardian angel.jpg'),
    NovenaCombo(text: 'Morning Psalm Prayers', imagePath: 'assets/morning rosary.jpg'),
    NovenaCombo(text: 'The Benedictus', imagePath: 'assets/My Daily Journal.jpg'),
  ];

  final List<NovenaCombo> midDayPrayers = [
    NovenaCombo(text: 'Angelus', imagePath: 'assets/img_1.png'),
    NovenaCombo(text: 'Act Of Contrition', imagePath: 'assets/img_2.png'),
    NovenaCombo(text: 'Prayer for the Hour of Mercy', imagePath: 'assets/img_5.png'),
    NovenaCombo(text: 'Prayer to St. Michael the Archangel', imagePath: 'assets/img_4.png'),
    NovenaCombo(text: 'Divine Mercy Chaplet', imagePath: 'assets/img_3.png'),
  ];

  final List<NovenaCombo> eveningPrayers = [
    NovenaCombo(text: 'Rosary', imagePath: 'assets/img_6.png'),
    NovenaCombo(text: 'Vespers (Evening Prayer)', imagePath: 'assets/img_7.png'),
    NovenaCombo(text: 'The Magnificat', imagePath: 'assets/img_8.png'),
    NovenaCombo(text: 'Prayer of St. Augustine', imagePath: 'assets/img_9.png'),
    NovenaCombo(text: 'Compline (Night Prayer)', imagePath: 'assets/img_10.png'),
  ];

  final List<NovenaCombo> intercessionPrayers = [
    NovenaCombo(text: 'The Memorare', imagePath: 'assets/img_11.png'),
    NovenaCombo(text: 'Prayer to Saint Joseph', imagePath: 'assets/img_12.png'),
    NovenaCombo(text: 'Prayer to St. Michael the Archangel', imagePath: 'assets/img_13.png'),
    NovenaCombo(text: 'Prayer to St. Francis of Assisi', imagePath: 'assets/img_14.png'),
    NovenaCombo(text: 'The Litany of the Saints', imagePath: 'assets/img_15.png'),
  ];

  final List<NovenaCombo> otherPrayers = [
    NovenaCombo(text: 'Prayer of Abandonment', imagePath: 'assets/father.jpg'),
    NovenaCombo(text: 'Anima Christi', imagePath: 'assets/anima christi vip.jpg'),
    NovenaCombo(text: 'Litany of the Holy Name of Jesus', imagePath: 'assets/img_16.png'),
    NovenaCombo(text: 'Come, Holy Spirit', imagePath: 'assets/img_17.png'),
    NovenaCombo(text: 'Hail Holy Queen', imagePath: 'assets/img_18.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => angelus()));

                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/angeelus.svg',
                              height: 80,
                              width: 80,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 8),
                            const Text('Angelus'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> rosary()));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/Rosariia.svg',
                              height: 80,
                              width: 80,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 8),
                            const Text('Rosary'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GestureDetector(
                        onTap: (){

                          Navigator.push(context, MaterialPageRoute(builder: (context) => chaplet()));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/Sacred-Heart-of-Jesus.svg',
                              height: 80,
                              width: 80,
                              fit: BoxFit.contain,
                            ),
                            const Text('Chaplet'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 50),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Newprayertemplatepage(
              prayerTitle: 'The Morning Prayer',
              prayerImage: 'assets/sunrise',
            )

            ));
    },
          child: Contain(
            title: 'Morning Prayers',
            prayers: morningPrayers,
          ),
        ),
        const SizedBox(height: 50),
        Contain(
          title: 'Mid-Day Prayers',
          prayers: midDayPrayers,
        ),
        const SizedBox(height: 50),
        Contain(
          title: 'Evening Prayers',
          prayers: eveningPrayers,
        ),
        const SizedBox(height: 50),
        Contain(
          title: 'Intercession Prayers',
          prayers: intercessionPrayers,
        ),
        const SizedBox(height: 50),
        Contain(
          title: 'Other Prayers',
          prayers: otherPrayers,
        ),
      ],
    );
  }
}