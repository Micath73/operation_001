import 'package:flutter/material.dart';
import 'package:operation_001/NewPrayerTemplatePage.dart';
import 'package:operation_001/expansionTile.dart';
import 'package:operation_001/novena_combo.dart';

class Contain extends StatefulWidget {
  final String title;
  final List<NovenaCombo> prayers;
  const Contain({super.key, required this.title, required this.prayers});

  @override
  State<Contain> createState() => _ContainState();
}

class _ContainState extends State<Contain> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          // This ensures everything starts from the LEFT
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 20),
            ...widget.prayers.map((prayer) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: GestureDetector(
                  onTap: (){
                    if(prayer.text=='Morning Psalm Prayers') {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => MorningPsalmPage()));
                    }
                    else {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>
                              Newprayertemplatepage(
                                  prayerTitle: prayer.text,
                                  prayerImage: prayer.imagePath)));
                    }
                  },
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          prayer.imagePath,
                          height: 45,
                          width: 45,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => const Icon(
                            Icons.image_not_supported,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          prayer.text,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}