import 'package:flutter/material.dart';
import 'package:operation_001/PsalmModel.dart';

class MorningPsalmPage extends StatefulWidget {
  const MorningPsalmPage({super.key});


  @override
  State<MorningPsalmPage> createState() => _MorningPsalmPageState();
}

class _MorningPsalmPageState extends State<MorningPsalmPage> {

  final List<PsalmModel> morningPsalms=[

    PsalmModel(
        title: 'Psalm 95',
        fullText: """1 Come, let us ring out our joy to the LORD;
        hail the rock who saves us.
    2 Let us come into his presence, giving thanks;
    let us hail him with a song of praise.

        3 A mighty God is the LORD,
        a great king above all gods.
    4 In his hands are the depths of the earth;
    the heights of the mountains are his.
    5 To him belongs the sea, for he made it,
    and the dry land that he shaped by his hand.

    6 O come; let us bow and bend low.
    Let us kneel before the Lord who made us,
    7 for he is our God, and we the people,
    the people of his pasture, the flock of his hand.

    O that today you would listen to his voice!
    8 “Harden not your hearts as at Meribah,
    as on that day at Massah in the desert
    9 when your forebears put me to the test;
    when they tried me, though they saw my work.

        10 For forty years I abhorred that generation,
        and I said, ‘Their heart goes astray;
    this people does not know my ways.’
    11 Then I took an oath in my anger,
    ‘Never shall they enter my rest.""",
    AmTitle: 'መዝሙረ ዳዊት 95',
    AmFullText: """ኑ፥በእግዚአብሔር ደስ ይበለን፤ ለአምላክ ለመድኃኒታችን እልል እንበል።
        2 በምስጋና ወደ ፊቱ እንድረስ፥ በዝማሬም ለእርሱ እልል እንበል፤
    3 እግዚአብሔር ታላቅ አምላክ ነውና፥ በአማልክትም ሁሉ ላይ ታላቅ ንጉሥ ነውና።
    4 እግዚአብሔር ሕዝቡን አይጥላቸውም፤ የምድር ዳርቻዎችም በእጁ ውስጥ ናቸው፥ የተራሮች ከፍታዎች የእርሱ ናቸው።
    5 ባሕር የእርሱ ናት እርሱም አደረጋት፥ የብስንም እጆቹ ሠሩአት።
    6 ኑ፥ እንስገድ ለእርሱም እንገዛ፤ በእርሱ ባደረገን በእግዚአብሔር ፊት እንበርከክ፤
    7 እርሱ አምላካችን ነውና፥ እኛ የማሰማርያው ሕዝብ የእጁም በጎች ነንና።
    8 በምድረ በዳ እንደ ተፈታተኑት እንዳስቈጡት ጊዜ፥ ዛሬ ድምፁን ብትሰሙ ልባችሁን አታጽኑ።
    9 የተፈታተኑኝ አባቶቻችሁ ፈተኑኝ ሥራዬንም አዩ።
    10 ያችን ትውልድ አርባ ዓመት ተቈጥቻት ነበር። ሁልጊዜ ልባቸው ይስታል፥ እነርሱም መንገዴን አላወቁም አልሁ።
    11 ወደ ዕረፍቴም እንዳይገቡ በቁጣዬ ማልሁ።"""),

    PsalmModel(
        title: 'Psalm 63:2-9',
        fullText: """2 O God, you are my God; at dawn I seek you;
        for you my soul is thirsting.
    For you my flesh is pining,
        like a dry, weary land without water.
    3 I have come before you in the sanctuary,
        to behold your strength and your glory.

    4 Your loving mercy is better than life;
    my lips will speak your praise.
    5 I will bless you all my life;
    in your name I will lift up my hands.
    6 My soul shall be filled as with a banquet;
        with joyful lips, my mouth shall praise you.

    7 When I remember you upon my bed,
        I muse on you through the watches of the night.
    8 For you have been my strength;
    in the shadow of your wings I rejoice.
    9 My soul clings fast to you;
    your right hand upholds me.""",
    AmTitle: 'መዝሙረ ዳዊት 63:2-9',
    AmFullText: """2 ኃይልህንና ክብርህን አይ ዘንድ እንዲሁ በመቅደስ ውስጥ ተመለከትሁህ።
        3 ምሕረትህ ከሕይወት ይሻላልና ከንፈሮቼ ያመሰግኑሃል።
    4 እንዲህ በሕይወቴ ዘመን አመሰግንሃለሁ፥ በአንተም ስም እጆቼን አነሣለሁ።
    5 ነፍሴ በቅቤና በስብ እንደሚጠግቡ ትጠግባለች፥ ከንፈሮቼም ስምህን በደስታ ያመሰግናሉ።
    6 በመኝታዬም አስብሃለሁ፥ በማለዳም እናገርልሃለሁ፤
    7 ረዳቴ ሆነኸኛልና፥ በክንፎችህም ጥላ ደስ ይለኛልና።
    8 ነፍሴ በኋላህ ተከታተለች፥ እኔንም ቀኝህ ተቀበለችኝ።
    9 እነርሱ ግን ነፍሴን ለከንቱ ፈለጓት፤ ወደ ምድር ጥልቅ ይገባሉ።"""),

    PsalmModel(
        title: 'Psalm 67:2-8',
        fullText: """2 May God be gracious and bless us
        and let his face shed its light upon us.
    3 So will your ways be known upon earth
    and all nations learn your salvation.

    4 Let the peoples praise you, O God;
    let all the peoples praise you.

    5 Let the nations be glad and shout for joy;
    with uprightness you rule the peoples,
        you guide the nations on earth.

    6 Let the peoples praise you, O God;
    let all the peoples praise you.

    7 The earth has yielded its fruit
        for God, our God, has blessed us.
    8 May God still give us his blessing
        that all the ends of the earth may revere him.""",
    AmTitle: 'መዝሙረ ዳዊት 67:1-7',
    AmFullText: """እግዚአብሔር ይማረን ይባርከንም፥ ፊቱንም በላያችን ያብራ፤
        2 በአሕዛብ ሁሉ መካከል ማዳንህን፥ መንገድህንም በምድር እናውቅ ዘንድ።
    3 አቤቱ፥ አሕዛብ ያመስግኑህ፥ አሕዛብ ሁሉ ያመስግኑህ።
    4 ለአሕዛብ በቅን ትፈርድላቸዋለህና፥ አሕዛብንም በምድር ላይ ትመራለህና አሕዛብ ደስ ይበላቸው ሐሤትም ያድርጉ።
    5 አቤቱ፥ አሕዛብ ያመስግኑህ፥ አሕዛብ ሁሉ ያመስግኑህ።
    6 ምድር ፍሬዋን ሰጠች፤ እግዚአብሔር አምላካችንም ይባርከናል።
    7 እግዚአብሔር ይባርከናል፥ የምድርም ዳርቻ ሁሉ ይፈሩታል።"""),

    PsalmModel(
        title: 'Psalm 51',
        fullText: """3 Have mercy on me, O God,
        according to your merciful love;
    according to your great compassion,
        blot out my transgressions.
    4 Wash me completely from my iniquity,
        and cleanse me from my sin.

        5 My transgressions, truly I know them;
    my sin is always before me.
        6 Against you, you alone, have I sinned;
    what is evil in your sight I have done.
        So you are just in your sentence,
        without reproach in your judgment.

        7 Behold, in guilt I was born,
    a sinner when my mother conceived me.
    8 Behold, you delight in sincerity of heart;
    in secret you teach me wisdom.
    9 Cleanse me with hyssop, and I shall be pure;
    wash me, and I shall be whiter than snow.

    10 Let me hear rejoicing and gladness,
    that the bones you have crushed may exult.
    11 Turn away your face from my sins,
    and blot out all my guilt.

    12 Create a pure heart for me, O God;
    renew a steadfast spirit within me.
    13 Do not cast me away from your presence;
    take not your holy spirit from me.

    14 Restore in me the joy of your salvation;
    sustain in me a willing spirit.
    15 I will teach transgressors your ways,
    that sinners may return to you.

    16 Rescue me from bloodshed, O God,
    O God of my salvation,
    and then my tongue shall ring out your justice.
    17 O Lord, open my lips
    and my mouth shall proclaim your praise.

    18 For in sacrifice you take no delight;
    burnt offering from me would not please you.
    19 My sacrifice to God, a broken spirit:
    a broken and humbled heart,
    you will not spurn, O God.

    20 In your good pleasure, show favor to Zion;
    rebuild the walls of Jerusalem.
    21 Then you will delight in right sacrifice,
    burnt offerings wholly consumed.
    Then you will be offered young bulls on your altar.""",
    AmTitle: 'መዝሙረ ዳዊት 51',
    AmFullText: """አቤቱ፥ እንደ ቸርነትህ መጠን ማረኝ፤ እንደ ምሕረትህም ብዛት መተላለፌን ደምስስ።
        2 ከበደሌ ፈጽሞ እጠበኝ፥ ከኃጢአቴም አንጻኝ፤
    3 እኔ መተላለፌን አውቃለሁና፥ ኃጢአቴም ሁልጊዜ በፊቴ ነውና።
    4 አንተን ብቻ በደልሁ፥ በፊትህም ክፋትን አደረግሁ፥ በነገርህም ትጸድቅ ዘንድ በፍርድህም ንጹሕ ትሆን ዘንድ።
    5 እነሆ፥ በዓመፃ ተፀነስሁ፥ እናቴም በኃጢአት ወለደችኝ።
    6 እነሆ፥ እውነትን ወደድህ፤ የማይታይ ስውር ጥበብን አስታወቅኸኝ።
    7 በሂሶጵ እርጨኝ፥ እነጻማለሁ፤ እጠበኝ፥ ከበረዶም ይልቅ ነጭ እሆናለሁ።
    8 ሐሤትንና ደስታን አሰማኝ፥ የሰበርሃቸውም አጥንቶቼ ደስ ይላቸዋል።
    9 ከኃጢአቴ ፊትህን መልስ፥ በደሌንም ሁሉ ደምስስልኝ።
    10 አቤቱ፥ ንጹሕ ልብን ፍጠርልኝ፥ የቀናውንም መንፈስ በውስጤ አድስ።
    11 ከፊትህ አትጣለኝ፥ ቅዱስ መንፈስህንም ከእኔ ላይ አትውሰድብኝ።
    12 የማዳንህን ደስታ ስጠኝ፥ በእሽታ መንፈስም ደግፈኝ።
    13 ለሕግ ተላላፎች መንገድህን አስተምራለሁ፥ ኃጢአተኞችም ወደ አንተ ይመለሳሉ።
    14 የመድኃኒቴ አምላክ እግዚአብሔር ሆይ፥ ከደም አድነኝ፥ አንደበቴም በአንተ ጽድቅ ትደሰታለች።
    15 አቤቱ፥ ከንፈሮቼን ክፈት፥ አፌም ምስጋናህን ያወራል።
    16 መሥዋዕትን ብትወድድስ በሰጠሁህ ነበር፤ የሚቃጠለውም መሥዋዕት ደስ አያሰኝህም።
    17 የእግዚአብሔር መሥዋዕት የተሰበረ መንፈስ ነው፥ የተሰበርውንና የተዋረደውን ልብ እግዚአብሔር አይንቅም።
    18 አቤቱ፥ በውዴታህ ጽዮንን አሰማምራት፤ የኢየሩሳሌምንም ቅጽሮች ሥራ።
        19 የጽድቁን መሥዋዕት መባውንም የሚቃጠለውንም መሥዋዕት በወደድህ ጊዜ፥ ያን ጊዜ በመሠዊያህ ላይ ፍሪዳዎችን ይሠዋሉ።"""),

    PsalmModel(
        title: 'Psalm 149',
        fullText: """1 Alleluia!

        Sing a new song to the LORD,
        his praise in the assembly of the faithful.
    2 Let Israel rejoice in its Maker;
    let Zion’s children exult in their king.
    3 Let them praise his name with dancing,
        and make music with timbrel and harp.

    4 For the LORD takes delight in his people;
    he adorns the poor with salvation.
    5 Let the faithful exult in glory,
        and rejoice as they take their rest.
    6 Let the praise of God be in their mouths
    and a two-edged sword in their hand,

        7 to deal out vengeance to the nations
    and punishment upon the peoples;
    8 to bind their kings in chains
    and their nobles in fetters of iron;
    9 to carry out the judgment decreed.
    This is an honor for all his faithful.

    Alleluia!""",
    AmTitle: 'መዝሙረ ዳዊት 149',
    AmFullText: """ሃሌ ሉያ። ለእግዚአብሔር አዲሱን ቅኔ ተቀኙለት፤ ምስጋናው በቅዱሳኑ ጉባኤ ነው።
        2 እስራኤል በፈጣሪው ደስ ይበለው፥ የጽዮንም ልጆች በንጉሣቸው ሐሤትን ያድርጉ።
    3 ስሙን በዘፈን ያመስግኑ፥ በከበሮና በመሰንቆም ይዘምሩለት።
    4 እግዚአብሔር በሕዝቡ ተደስቶአልና፥ የዋሃንንም በማዳኑ ከፍ ከፍ ያደርጋልና።
    5 ቅዱሳን በክብር ይመካሉ፤ በምንጣፋቸውም ላይ ሐሤትን ያደርጋሉ።
    6 የእግዚአብሔር ምስጋና በጕሮሮአቸው ነው፤ ሁለት አፍ ያለውም ሰይፍ በእጃቸው ነው፥
    7 በአሕዛብ ላይ በቀልን በሰዎችም መካከል ቅጣትን ያደርጉ ዘንድ፤
    8 ንጉሦቻቸውን በሰንሰለት፥ አለቆቻቸውንም በእግር ብረት ያስሩ ዘንድ፤
    9 የተጻፈውን ፍርድ ያደርጉባቸው ዘንድ። ለቅዱሳን ሁሉ ይህች ክብር ናት። ሃሌ ሉያ።"""),

    PsalmModel(
        title: 'Psalm 91',
        fullText: """1 He who dwells in the shelter of the Most High,
        and abides in the shade of the Almighty,
  2 says to the LORD, “My refuge,
  my stronghold, my God in whom I trust!”

  3 He will free you from the snare of the fowler,
  from the destructive plague;
  4 he will conceal you with his pinions,
  and under his wings you will find refuge.
  His faithfulness is buckler and shield.

  5 You will not fear the terror of the night,
  nor the arrow that flies by day,
  6 nor the plague that prowls in the darkness,
  nor the scourge that lays waste at noon.

  7 A thousand may fall at your side,
  ten thousand fall at your right:
  you it will never approach.

  8 Your eyes have only to look
  to see how the wicked are repaid.
  9 For you, O LORD, are my refuge.
  You have made the Most High your dwelling.

  10 Upon you no evil shall fall,
  no plague approach your tent.
  11 For you has he commanded his angels
  to keep you in all your ways.

  12 They shall bear you upon their hands,
  lest you strike your foot against a stone.
  13 On the lion and the viper you will tread,
  and trample the young lion and the serpent.

  14 Since he clings to me in love, I will free him,
  protect him, for he knows my name.
  15 When he calls on me, I will answer him;
  I will be with him in distress;
  I will deliver him, and give him glory.

  16 With length of days I will content him;
  I will show him my saving power.""",
    AmTitle: 'መዝሙረ ዳዊት 91',
    AmFullText: """በልዑል መጠጊያ የሚኖር ሁሉን በሚችል አምላክ ጥላ ውስጥ ያድራል።
  2 እግዚአብሔርን። አንተ መታመኛዬ ነህ እለዋለሁ፤ አምላኬና መሸሸጊያዬ ነው፥ በእርሱም እታመናለሁ።
  3 እርሱ ከአዳኝ ወጥመድ ከሚያስደነግጥም ነገር ያድንሃልና።
  4 በላባዎቹ ይጋርድሃል፥ በክንፎቹም በታች ትተማመናለህ፤ እውነት እንደ ጋሻ ይከብብሃል።
  5 ከሌሊት ግርማ፥ በቀን ከሚበርር ፍላጻ፥
  6 በጨለማ ከሚሄድ ክፉ ነገር፥ ከአደጋና ከቀትር ጋኔን አትፈራም።
  7 በአጠገብህ ሺህ በቀኝህም አሥር ሺህ ይወድቃሉ፤ ወደ አንተ ግን አይቀርብም።
  8 በዓይኖችህ ብቻ ትመለከታለህ፥ የኃጥኣንንም ብድራት ታያለህ።
  9 አቤቱ፥ አንተ ተስፋዬ ነህና፤ ልዑልን መጠጊያህ አደረግህ።
  10 ክፉ ነገር ወደ አንተ አይቀርብም፥ መቅሠፍትም ወደ ቤትህ አይገባም።
  11 በመንገድህ ሁሉ ይጠብቁህ ዘንድ መላእክቱን ስለ አንተ ያዝዛቸዋልና፤
  12 እግርህም በድንጋይ እንዳትሰናከል በእጆቻቸው ያነሡሃል።
  13 በተኵላና በእባብ ላይ ትጫማለህ፤ አንበሳውንና ዘንዶውን ትረግጣለህ።
  14 በእኔ ተማምኖአልና አስጥለዋለሁ፤ ስሜንም አውቆአልና እጋርደዋለሁ።
  15 ይጠራኛል እመልስለትማለሁ፥ በመከራውም ጊዜ ከእርሱ ጋራ እሆናለሁ፤ አድነዋለሁ አከብረውማለሁ።
  16 ረጅምን ዕድሜ አጠግበዋለሁ፥ ማዳኔንም አሳየዋለሁ።"""),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Morning Psalm Prayers',style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back),color: Colors.white)
        ),
        body: Stack(
          children: [

            Positioned.fill(
                child: Image.asset('assets/morning rosary.jpg',fit: BoxFit.cover)),
            Positioned.fill(child: Container(
              color: Colors.black.withOpacity(0.4),
            )),
            SafeArea(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [

                ...morningPsalms.map((prayer){

                  return Card(
                  color: Colors.white.withOpacity(0.05),
                  margin: EdgeInsets.only(bottom: 16),
                  child: ExpansionTile(title: Text(prayer.title,style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        prayer.fullText, // Injects your massive multi-line verse string
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          height: 1.6,
                        ),
                      ),
                    ),
                ]));
                }).toList(),

              ],
            ),
          )]
        )
    );

  }
}

