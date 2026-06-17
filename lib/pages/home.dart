import 'package:flutter/material.dart';
import 'package:operation_001/DailyPrayer.dart';
import 'package:operation_001/Quote.dart';
import 'package:operation_001/dashboard_section.dart';
import 'package:operation_001/novena_section.dart';


class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  List<Quote> quotes = [
    Quote(
        text: 'O lord for your mercy never abandons me, for your immaculate mercy embraces me. I shall not fear my fear, i shall not falter. For tou are by my side my Lord, I shall not Fall! My heart rejoices in your love, trembles in your presence. When all looks dim and dark, your name illuminates my path. I take pride in being your son, for nothing else makes me happy in this world.Amen',
        author: 'Bible')
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Builder( // This Builder creates the correct 'context'
          builder: (context) {
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  leading: const Icon(Icons.menu, color: Colors.white),
                  expandedHeight: MediaQuery.of(context).size.height * 0.4,
                  backgroundColor: Colors.deepPurple,
                  pinned: true,
                  stretch: true,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(60),
                    child: TabBar(
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white70,
                      indicatorColor: Colors.white,
                      tabs: const [
                        Tab(icon: Icon(Icons.church)),
                        Tab(icon: Icon(Icons.wb_sunny)),
                      ],
                    ),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: const EdgeInsets.only(bottom: 70),
                    centerTitle: true,
                    title: const Text(
                      'The Word of God',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    background: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.deepPurple, Color(0xFF673AB7)],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 40, 25, 100),
                        child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: quotes.map((quote) => Text(
                                '"${quote.text}"',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  height: 1.5,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.0,
                                  color: Colors.white70,
                                  fontStyle: FontStyle.italic,
                                ),
                              )).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: AnimatedBuilder(
                    animation: DefaultTabController.of(context),
                    builder: (context, child) {
                      final index = DefaultTabController.of(context).index;

                      return Column(
                        children: [
                          const SizedBox(height: 25),

                          // Collection-If Logic
                          if (index == 0) ...[
                            const NovenaSection(),
                            const SizedBox(height: 25),
                            MyUniversalCard(
                              title: "Gospel Of The Day",
                              description: "Reflect your day with this Gospel verse",
                              buttonColor: Colors.deepPurple,
                              onPressed: () {},
                            ),
                          ] else ...[
                            const SizedBox(height: 50),
                             Dailyprayer(),
                            const SizedBox(height: 50),
                          ],

                          const SizedBox(height: 20),
                          const DashboardSection(),
                          const SizedBox(height: 100),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          }
      ),
    );
  }
}

class MyUniversalCard extends StatelessWidget {
  final String title;
  final String description;
  final Color buttonColor;
  final VoidCallback onPressed;

  const MyUniversalCard({
    super.key,
    required this.title,
    required this.description,
    required this.buttonColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: onPressed,
                child: const Text('Read', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}