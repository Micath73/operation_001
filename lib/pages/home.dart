import 'package:flutter/material.dart';
import 'package:operation_001/Quote.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {

  List<Quote> quotes = [

    Quote(text: 'May the glory of the Father be with you all!', author: 'bible')

  ];


  List<String> novenaTitles = [
    "Mother of Perpetual Help",
    "St. Jude",
    "Sacred Heart",
    "Holy Spirit",
    "St. Anthony",
  ];

  String selectedDay = 'Mon';
  List<String> days = ['Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun'];

  Widget _buildDailyButton(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => print(label),
          child: Text(label),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [Container(

        decoration: BoxDecoration(

          color: Colors.deepPurpleAccent,
          image: DecorationImage(image: NetworkImage(
              'https://plus.unsplash.com/premium_photo-1670148434660-fb082fee36b6?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withValues(alpha: 0.3), BlendMode.darken)

          ),
        ),

        height: 300,

        child: Padding(
          padding: EdgeInsets.fromLTRB(5.0, 120.0, 5.0, 5.0),
          child: Column(
            children: quotes.map((quote) =>
                Text('${quote.text} - ${quote.author}', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white),)).toList(),
          ),
        ),
      ),
        MyUniversalCard(
          title: "Gospel Of The Day",
          description: "Reflect your day with this Gospel verse",
          buttonColor: Colors.blueAccent,
          onPressed: () {
            print("Read pressed!");
          },
        ),
        SizedBox(height: 55.0),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),

                  SizedBox(width: 10),
                  Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.handshake,
                            size: 40.0,
                          ),
                        ),
                      )
                  ),
                  SizedBox(width: 10),
                  Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(15),
                        ),

                      )
                  ),
                ]
            )
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Container(

                  color: Colors.white70,
                  height: 230,

                  child: Column(

                      children: [
                        SizedBox(height: 30.0,),

                        Padding(
                          padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Novena')),
                        ),
                        SizedBox(height: 25.0,),
                        Expanded(
                          child: Row(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,),

                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(8, 0, 0, 8),
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: novenaTitles.map((title) {
                                        return Padding(
                                          padding: EdgeInsets.only(right: 6.0),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  width: 100,
                                                  height: 100,
                                                  color: Colors.deepPurple,

                                                ),
                                                SizedBox(height: 6,),
                                                SizedBox(
                                                  width: 100,
                                                  child: Align(
                                                    alignment: Alignment
                                                        .bottomCenter,
                                                    child: Text(
                                                      title,
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                )

                              ]),
                        ),
                      ]),
                ),
              ),
            ]),

        MyUniversalCard(
          title: "Devine Mercy Reflection",
          description: "Reflect your day with the Devine Mercy!",
          buttonColor: Colors.blueAccent,
          onPressed: () {
            print("Read pressed!");
          },
        ),
        SizedBox(height: 10,),

        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Daily Progress Dashboard',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: days.map((day) {
                          bool isSelected = selectedDay == day;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedDay = day;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: isSelected ? Colors.deepPurple : Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                day,
                                style: TextStyle(
                                  color: isSelected ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      "Selected: $selectedDay",
                      style: const TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    _buildDailyButton("Read today's Gospel"),
                    _buildDailyButton("Pray today's Angelus"),
                    if (selectedDay != 'Sun')
                      _buildDailyButton("Pray today's Rosary"),
                    if (selectedDay == 'Fri')
                      _buildDailyButton("Special Friday Divine Mercy"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
class MyUniversalCard extends StatelessWidget {


  final String title;
  final String description;
  final Color buttonColor;
  final VoidCallback onPressed;

  MyUniversalCard({super.key,
    required this.title,
    required this.description,
    required this.buttonColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        children: [
          Text(title, style: TextStyle(fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.black),),
          Text(description,
              style: TextStyle(fontSize: 15.0, color: Colors.black)),

          SizedBox(height: 9.0,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                  ),
                  onPressed: () {},
                  child: Center(
                    child: Text('Read', style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold,),),
                  )
              ),
            ),
          ),
          SizedBox(height: 9.0),

        ],
      ),

    );
  }
}
