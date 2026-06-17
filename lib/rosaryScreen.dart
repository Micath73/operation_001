import 'package:flutter/material.dart';
import 'package:operation_001/joyful.dart';
import 'package:operation_001/sorrowful.dart';
import 'package:operation_001/glorious.dart';
import 'package:operation_001/luminous.dart';


class rosary extends StatefulWidget {
  const rosary({super.key});

  @override
  State<rosary> createState() => _rosaryState();
}

class _rosaryState extends State<rosary> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Rosary',
            style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(child: Text('English')),
              Tab(child: Text('Amharic')),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildMysteryList(),
            _buildMysteryList(),
          ],
        ),
      ),
    );
  }

  Widget _buildMysteryList() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
        child: Column(
          children: [
            _buildMysteryCard(
              'Joyful Mysteries',
              'Mon, Sat',
              '"In the joyful mysteries we see, the joy of family, motherhood..."',
              '— Saint John Paul II',
              'assets/morning rosary.jpg',
                  () => Navigator.push(context, MaterialPageRoute(builder: (context) => const joyfulScreen())),
            ),
            const SizedBox(height: 10),
            _buildMysteryCard(
              'Sorrowful Mysteries',
              'Tue, Fri',
              '"The Rosary is the book of the blind, where souls see and there enact the greatest drama of love..."',
              '— Venerable Fulton Sheen',
              'assets/img_20.png',
                  () => Navigator.push(context, MaterialPageRoute(builder: (context) => const sorrowfulScreen())),
            ),
            const SizedBox(height: 10),

            _buildMysteryCard(
              'Glorious Mysteries',
              'Wed, Sun',
              'In the glorious mysteries the hopes of eternal life are revived.',
              '— Saint John Paul II',
              'assets/He is Risen.jpg',
                  () => Navigator.push(context, MaterialPageRoute(builder: (context) => const gloriousScreen())),
            ),

            const SizedBox(height: 10),
            _buildMysteryCard(
              'Luminous Mysteries',
              'Thur',
              'These mysteries make it possible to reach the threshold of contemplation...',
              '— Saint John Paul II',
              'assets/holy communion.jpg',
                  () => Navigator.push(context, MaterialPageRoute(builder: (context) => const luminousScreen())),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMysteryCard(String title, String days, String quote, String author, String imagePath, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.white,
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        splashColor: Colors.grey.withValues(alpha: 50),
        onTap: onTap,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: 100,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        days,
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: Colors.deepPurple),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        quote,
                        style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        author,
                        style: const TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}