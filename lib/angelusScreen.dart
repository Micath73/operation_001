import 'package:flutter/material.dart';

class angelus extends StatefulWidget {
  const angelus({super.key});

  @override
  State<angelus> createState() => _angelusState();
}

List<String> angelusPrayer=[
  """V. The Angel of the Lord declared unto Mary.
R. And she conceived of the Holy Spirit.

Hail Mary, full of grace,
    the Lord is with you!
Blessed are you among women,
and blessed is the fruit of your
womb, Jesus.

Holy Mary, Mother of God,
    pray for us sinners,
    now and at the hour of our death.

V. Behold the handmaid of the Lord.
R. Be it done unto me according to your word.

Hail Mary . . .

V. And the Word was made Flesh.
R. And dwelt among us.

Hail Mary . . .

V. Pray for us, O holy Mother of God.
R. That we may be made worthy of the promises of Christ.

Let us pray:

Pour forth we beseech you, O Lord, your grace into our hearts, that we, to whom the incarnation of Christ your Son was made known by the message of an angel, may by his passion and cross be brought to the glory of his resurrection.

Through the same Christ Our Lord.

Amen."""
];

List<String> angelusAmharic=[
  """V. የእግዚአብሔር መልአክ ማርያምን አበሠራት፡፡
R. እርሷም በመንፈስ ቅዱስ ፀነሰች፡፡

 ጸጋ የመላሽ ማርያም ሆይ …
 ቅድስት ማርያም …

V. እነሆኝ የእግዚአብሔር አገልጋይ፡፡
R. እንዳልከኝ ይሁንልኝ፡፡

 ጸጋ የመላሽ ማርያም ሆይ …
 ቅድስት ማርያም …

V. ቃል ሥጋ ሆነ፡፡
R. በኛም አደረ፡፡

 ጸጋ የመላሽ ማርያም ሆይ …
 ቅድስት ማርያም …

V.ቅድስት የአምላክ እናት ሆይ ለምኝልን፡፡
R.ክርስቶስ ለሰጠን ተስፋ የተገባን እንድንሆን፡፡

 እንጸልይ

 እግዚአብሔር ሆይ በመልአኩ ምስራች የልጅህን የኢየሱስ ክርስቶስን ሰው መሆኑን እንዳወቅን:
 በህማሙና በመስቀሉ ወደ ትንሣኤ ክብር እንድንደርስ ጸጋህን ስጠን፡፡
 በጌታችን ኢየሱስ ክርስቶስ ስም እንለምንሃለን፡፡ አሜን፡፡"""


];

class _angelusState extends State<angelus> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Angelus', style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),),
          centerTitle: true,
          bottom: TabBar(
              tabs: [
                Tab(child: Text("English")),
                Tab(child: Text("Amharic")),
              ]),
        ),
        body: TabBarView(
            children: [
              Stack(
                children: [

                  SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: Image.asset('assets/img_19.png', scale: 3,),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              padding: EdgeInsets.symmetric(vertical: 20),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(angelusPrayer[0], style: TextStyle(fontSize: 20),)
                               ],
                             ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 120),

                    ],
                  ),
                ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: double.infinity,
                      child: Container(
                        color: Colors.white70,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(80, 10, 80, 20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            onPressed: (){},
                            child: const Text('Amen', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                  ),
              ]),

              Stack(
                children: [SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: Image.asset('assets/img_19.png', scale: 3,),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(angelusAmharic[0], style: TextStyle(fontSize: 20),)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 120),
                    ],
                  ),
                ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: double.infinity,
                      child: Container(
                        color: Colors.white70,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(80, 10, 80, 20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            onPressed: (){},
                            child: const Text('Amen', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                  ),
              ])

            ])
      ),
    );
  }
}
