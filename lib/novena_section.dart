import 'package:flutter/material.dart';
import 'package:operation_001/controllers/saint_of_the_day_controller.dart';
import 'package:operation_001/novena_combo.dart';
import 'package:operation_001/novena_data.dart';
import 'package:operation_001/novena_detail_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:operation_001/screens/lesson_detail_screen.dart';
import 'package:operation_001/screens/saints_directory_screen.dart';
import 'package:operation_001/widgets/saint_of_the_day_card.dart';

class NovenaSection extends StatefulWidget {
  final VoidCallback? onNovenaChanged;

  const NovenaSection({super.key, this.onNovenaChanged});

  @override
  State<NovenaSection> createState() => _NovenaSectionState();
}

class _NovenaSectionState extends State<NovenaSection> {
  String selectedCategory = 'All';
  @override
  void initState() {
    super.initState();
    SaintOfTheDayController.instance.initialize(); //[cite: 9]
  }

  static const List<String> categories = [
    'All',
    'Catechism',
    'Dogma',
    'Saints',
    'Apparitions',
    'Liturgical',
    'Devotions',
    'Online Resources',
  ];

  static const List<NovenaCombo> spiritualLessons = [
    // ==========================================
    // Category 1: Catechism (CCC Pillar Order)
    // ==========================================
    NovenaCombo(
      text: 'The Trinity: One God in Three Persons',
      imagePath: 'assets/Holy Trinity.jpg',
      category: 'Catechism',
      tags: ['Trinity', 'God', 'Creed'],
      jsonAsset: 'assets/json/lessons/trinity_one_god_three_persons.json',
    ),
    NovenaCombo(
      text: 'The Incarnation and Redemption',
      imagePath: 'assets/Catechism/The Incarnation and Redemption.jpg',
      category: 'Catechism',
      tags: ['Jesus', 'Salvation', 'Incarnation'],
      jsonAsset: 'assets/json/lessons/incarnation_and_redemption.json',
    ),
    NovenaCombo(
      text: 'The Apostles’ Creed: Summary of Faith',
      imagePath: 'assets/Catechism/the apostles creed.jpg',
      category: 'Catechism',
      tags: ['Creed', 'Faith', 'Doctrine'],
      jsonAsset: 'assets/json/lessons/apostles_creed_summary_of_faith.json',
    ),
    NovenaCombo(
      text: 'The Ten Commandments: God’s Moral Law',
      imagePath: 'assets/Catechism/the ten commandments.jpg',
      category: 'Catechism',
      tags: ['Commandments', 'Morality', 'Law'],
      jsonAsset: 'assets/json/lessons/ten_commandments_gods_moral_law.json',
    ),
    NovenaCombo(
      text: 'The Beatitudes: Path to True Happiness',
      imagePath: 'assets/Catechism/the beatitudes.jpg',
      category: 'Catechism',
      tags: ['Beatitudes', 'Jesus', 'Virtue'],
      jsonAsset: 'assets/json/lessons/beatitudes_path_to_true_happiness.json',
    ),
    NovenaCombo(
      text: 'Moral Conscience & Free Will',
      imagePath: 'assets/Catechism/Moral Conscience & Free Will.jpg',
      category: 'Catechism',
      tags: ['Conscience', 'Morality', 'Truth'],
      jsonAsset: 'assets/json/lessons/moral_conscience_and_free_will.json',
    ),
    NovenaCombo(
      text: 'The Four Last Things: Death & Judgment',
      imagePath: 'assets/Catechism/the four last things org.jpeg', // or '' if no image
      category: 'Catechism',
      jsonAsset: 'assets/json/lessons/four_last_things_death_and_judgment.json',
      tags: ['Eschatology', 'Heaven', 'Hell'],
    ),
    NovenaCombo(
      text: 'The Virtues: Theological & Cardinal',
      imagePath: 'assets/Catechism/The Virtues Theological  Cardinal.jpg', // or '' if no image
      category: 'Catechism',
      jsonAsset: 'assets/json/lessons/virtues_theological_and_cardinal.json',
      tags: ['Virtues', 'Faith', 'Hope', 'Charity'],
    ),
    NovenaCombo(
      text: 'The Precepts of the Church',
      imagePath: 'assets/Catechism/The Precepts of the Church.jpg', // or '' if no image
      category: 'Catechism',
      jsonAsset: 'assets/json/lessons/precepts_of_the_church.json',
      tags: ['Church', 'Laws', 'Duty'],
    ),
    NovenaCombo(
      text: 'Prayer & The Our Father Breakdown',
      imagePath: 'assets/Catechism/Prayer and The our father breakdown.jpg', // or '' if no image
      category: 'Catechism',
      jsonAsset: 'assets/json/lessons/prayer_and_our_father_breakdown.json',
      tags: ['Prayer', 'Lord\'s Prayer', 'Gospel'],
    ),

    // ==========================================
    // Category 2: Dogma (Doctrines & Marian Dogmas)
    // ==========================================
    NovenaCombo(
      text: 'The Divinity of Christ',
      imagePath: 'assets/Dogma/The Divinity of Christ.webp',
      category: 'Dogma',
      tags: ['Jesus', 'Divinity', 'Christology'],
      jsonAsset: 'assets/json/lessons/divinity_of_christ.json',
    ),
    NovenaCombo(
      text: 'The Real Presence in the Eucharist',
      imagePath: 'assets/Dogma/The Real Presence in the Eucharist.jpg',
      category: 'Dogma',
      tags: ['Eucharist', 'Real Presence', 'Sacrament'],
      jsonAsset: 'assets/json/lessons/real_presence_in_the_eucharist.json',
    ),
    NovenaCombo(
      text: 'Divine Motherhood of Mary (Theotokos)',
      imagePath: 'assets/Dogma/Theotokos.jpg',
      category: 'Dogma',
      tags: ['Mary', 'Theotokos', 'Marian Dogma'],
      jsonAsset: 'assets/json/lessons/divine_motherhood_of_mary.json',
    ),
    NovenaCombo(
      text: 'The Perpetual Virginity of Mary',
      imagePath: 'assets/Dogma/Perpetual Virginity of Mary.jpg',
      category: 'Dogma',
      tags: ['Mary', 'Virginity', 'Marian Dogma'],
      jsonAsset: 'assets/json/lessons/perpetual_virginity_of_mary.json',
    ),
    NovenaCombo(
      text: 'The Immaculate Conception of Mary',
      imagePath: 'assets/Dogma/The Immaculate Conception of Mary.jpg',
      category: 'Dogma',
      tags: ['Mary', 'Immaculate Conception', 'Grace'],
      jsonAsset: 'assets/json/lessons/immaculate_conception_of_mary.json',
    ),
    NovenaCombo(
      text: 'The Assumption of Mary into Heaven',
      imagePath: 'assets/Dogma/The Assumption of Mary into Heaven.jpg',
      category: 'Dogma',
      tags: ['Mary', 'Assumption', 'Heaven'],
      jsonAsset: 'assets/json/lessons/assumption_of_mary.json',
    ),
    NovenaCombo(
      text: 'Papal Infallibility & Church Authority',
      imagePath: 'assets/Dogma/Papal Infallibility & Church Authority.jpg',
      category: 'Dogma',
      tags: ['Pope', 'Magisterium', 'Authority'],
      jsonAsset: 'assets/json/lessons/papal_infallibility_and_church_authority.json',
    ),
    NovenaCombo(
      text: 'Original Sin and Human Nature',
      imagePath: 'assets/Dogma/Original Sin and Human Nature.jpg',
      category: 'Dogma',
      tags: ['Sin', 'Grace', 'Humanity'],
      jsonAsset: 'assets/json/lessons/original_sin_and_human_nature.json',
    ),
    NovenaCombo(
      text: 'Salvation through Jesus Christ',
      imagePath: 'assets/Dogma/Salvation through Jesus Christ.jpg',
      category: 'Dogma',
      tags: ['Salvation', 'Cross', 'Grace'],
      jsonAsset: 'assets/json/lessons/salvation_through_jesus_christ.json',
    ),
    NovenaCombo(
      text: 'The Resurrection of the Body',
      imagePath: 'assets/He is Risen.jpg',
      category: 'Dogma',
      tags: ['Resurrection', 'Eschatology', 'Hope'],
      jsonAsset: 'assets/json/lessons/resurrection_of_the_body.json',
    ),

    // ==========================================
    // Category 3: Saints & Church Fathers
    // Handled dynamically — see SaintOfDayCard / SaintsDirectoryScreen,
    // backed by SaintsRepository and assets/data/saints_365.json.
    // ==========================================

    // ==========================================
    // Category 4: Marian & Sacred Apparitions
    // ==========================================
    NovenaCombo(
      text: 'Sacred Heart Apparition to St. Margaret Mary',
      imagePath: 'assets/Marian & Sacred Apparitions/Sacred Heart Apparition to St. Margaret Mary.jpg',
      category: 'Apparitions',
      tags: ['Sacred Heart', 'Jesus', 'Revelation'],
      jsonAsset: 'assets/json/lessons/sacred_heart_apparition_to_st_margaret_mary.json',
    ),
    NovenaCombo(
      text: 'Our Lady of Guadalupe (Mexico, 1531)',
      imagePath: 'assets/Marian & Sacred Apparitions/Our Lady of Guadalupe.jpg',
      category: 'Apparitions',
      tags: ['Guadalupe', 'Mary', 'Apparition'],
      jsonAsset: 'assets/json/lessons/our_lady_of_guadalupe_mexico_1531.json',
    ),
    NovenaCombo(
      text: 'Our Lady of the Miraculous Medal (France, 1830)',
      imagePath: 'assets/Marian & Sacred Apparitions/our lady of miracles medal.jpg',
      category: 'Apparitions',
      tags: ['Miraculous Medal', 'Mary', 'Medal'],
      jsonAsset: 'assets/json/lessons/our_lady_of_the_miraculous_medal_france_1830.json',
    ),
    NovenaCombo(
      text: 'Our Lady of Lourdes (France, 1858)',
      imagePath: 'assets/Marian & Sacred Apparitions/Our Lady of Lourdes.jpg',
      category: 'Apparitions',
      tags: ['Lourdes', 'Mary', 'Healing'],
      jsonAsset: 'assets/json/lessons/our_lady_of_lourdes_france_1858.json',
    ),
    NovenaCombo(
      text: 'Our Lady, Undoer of Knots (Germany, 1700)',
      imagePath: 'assets/Marian & Sacred Apparitions/Our Lady, Undoer of Knots.jpg',
      category: 'Apparitions',
      tags: ['Undoer of Knots', 'Mary', 'Devotion'],
      jsonAsset: 'assets/json/lessons/our_lady_undoer_of_knots_germany_1700.json',
    ),
    NovenaCombo(
      text: 'Our Lady of Fátima (Portugal, 1917)',
      imagePath: 'assets/Marian & Sacred Apparitions/our lady of fatima.jpg',
      category: 'Apparitions',
      tags: ['Fatima', 'Rosary', 'Apparition'],
      jsonAsset: 'assets/json/lessons/our_lady_of_fatima_portugal_1917.json',
    ),
    NovenaCombo(
      text: 'Divine Mercy Apparition to St. Faustina',
      imagePath: 'assets/Marian & Sacred Apparitions/Divine Mercy Apparition to St. Faustina.jpg',
      category: 'Apparitions',
      tags: ['Divine Mercy', 'Jesus', 'St Faustina'],
      jsonAsset: 'assets/json/lessons/divine_mercy_apparition_to_st_faustina.json',
    ),
    NovenaCombo(
      text: 'Our Lady of Loreto (Italy, Holy House)',
      imagePath: 'assets/Marian & Sacred Apparitions/our lady of loreto.jpg',
      category: 'Apparitions',
      tags: ['Loreto', 'Mary', 'Holy House'],
      jsonAsset: 'assets/json/lessons/our_lady_of_loreto_holy_house_italy.json',
    ),
    NovenaCombo(
      text: 'Our Lady of Mount Carmel & the Scapular (England, 1251)',
      imagePath: 'assets/Marian & Sacred Apparitions/our lady of scapular.jpg',
      category: 'Apparitions',
      tags: ['Mount Carmel', 'Scapular', 'Mary', 'Apparition'],
      jsonAsset: 'assets/json/lessons/our_lady_of_mount_carmel_scapular_england_1251.json',
    ),
    NovenaCombo(
      text: 'Our Lady of the Rosary (Pompei & Lepanto)',
      imagePath: 'assets/Marian & Sacred Apparitions/our lady of rosary.jpg',
      category: 'Apparitions',
      tags: ['Rosary', 'Mary', 'Victories'],
      jsonAsset: 'assets/json/lessons/our_lady_of_the_rosary_pompeii_and_lepanto.json',
    ),
    NovenaCombo(
      text: 'Our Lady, Help of Christians (Don Bosco Devotion)',
      imagePath: 'assets/Marian & Sacred Apparitions/our lady of help.jpg',
      category: 'Apparitions',
      tags: ['Help of Christians', 'Mary', 'Protection'],
      jsonAsset: 'assets/json/lessons/our_lady_help_of_christians.json',
    ),

    // ==========================================
    // Category 5: Liturgical Year (Full Cycle)
    // ==========================================
    NovenaCombo(
      text: 'Advent: Preparation & Hope',
      imagePath: 'assets/Liturgical Year/advent.jpg',
      category: 'Liturgical',
      jsonAsset: 'assets/json/lessons/advent_preparation_and_hope.json',
      tags: ['Advent', 'Season', 'Hope'],
    ),
    NovenaCombo(
      text: 'Christmas: The Word Made Flesh',
      imagePath: 'assets/Liturgical Year/christmas.jpg',
      category: 'Liturgical',
      jsonAsset: 'assets/json/lessons/christmas_the_word_made_flesh.json',
      tags: ['Christmas', 'Incarnation', 'Nativity'],
    ),
    NovenaCombo(
      text: 'Epiphany & Baptism of the Lord',
      imagePath: 'assets/Liturgical Year/Baptism.jpg',
      category: 'Liturgical',
      jsonAsset: 'assets/json/lessons/epiphany_and_baptism_of_the_lord.json',
      tags: ['Epiphany', 'Magi', 'Baptism'],
    ),
    NovenaCombo(
      text: 'Lent: Conversion & Fasting',
      imagePath: 'assets/Liturgical Year/Lent.jpg',
      category: 'Liturgical',
      jsonAsset: 'assets/json/lessons/lent_conversion_and_fasting.json',
      tags: ['Lent', 'Fasting', 'Penance'],
    ),
    NovenaCombo(
      text: 'Ash Wednesday',
      imagePath: 'assets/Liturgical Year/Ash Wednesday.jpg',
      category: 'Liturgical',
      jsonAsset: 'assets/json/lessons/ash_wednesday.json',
      tags: ['Ash Wednesday', 'Lent', 'Repentance'],
    ),
    NovenaCombo(
      text: 'Holy Thursday & Good Friday: Lord\'s Passion',
      imagePath: 'assets/Liturgical Year/Good Friday.jpg',
      category: 'Liturgical',
      jsonAsset: 'assets/json/lessons/holy_thursday_and_good_friday.json',
      tags: ['Holy Week', 'Passion', 'Cross'],
    ),
    NovenaCombo(
      text: 'Easter Season: He Is Risen!',
      imagePath: 'assets/Liturgical Year/He is Risen.jpg',
      category: 'Liturgical',
      jsonAsset: 'assets/json/lessons/easter_season_he_is_risen.json',
      tags: ['Easter', 'Resurrection', 'Victory'],
    ),
    NovenaCombo(
      text: 'Pentecost: Descent of the Holy Spirit',
      imagePath: 'assets/Liturgical Year/Pentecost Descent of the Holy Spirit.jpg',
      category: 'Liturgical',
      jsonAsset: 'assets/json/lessons/pentecost_descent_of_the_holy_spirit.json',
      tags: ['Pentecost', 'Holy Spirit', 'Church'],
    ),
    NovenaCombo(
      text: 'Ordinary Time: Daily Discipleship',
      imagePath: 'assets/Liturgical Year/discipleship.jpg',
      category: 'Liturgical',
      jsonAsset: 'assets/json/lessons/ordinary_time_daily_discipleship.json',
      tags: ['Ordinary Time', 'Growth', 'Discipleship'],
    ),
    NovenaCombo(
      text: 'Solemnity of Christ the King',
      imagePath: 'assets/Liturgical Year/christ the king.jpg',
      category: 'Liturgical',
      jsonAsset: 'assets/json/lessons/solemnity_of_christ_the_king.json',
      tags: ['Christ the King', 'Solemnity', 'Kingdom'],
    ),

    // ==========================================
    // Category 6: Devotions & Sacraments
    // ==========================================
    NovenaCombo(
      text: 'The Holy Mass Explained',
      imagePath: 'assets/Devotions & Sacraments/holy mass.jpg',
      category: 'Devotions',
      jsonAsset: 'assets/json/lessons/holy_mass_explained.json',
      tags: ['Mass', 'Eucharist', 'Liturgy'],
    ),
    NovenaCombo(
      text: 'Sacrament of Reconciliation',
      imagePath: 'assets/Devotions & Sacraments/reconcillation.jpg',
      category: 'Devotions',
      jsonAsset: 'assets/json/lessons/sacrament_of_reconciliation.json',
      tags: ['Confession', 'Sacrament', 'Forgiveness'],
    ),
    NovenaCombo(
      text: 'Sacrament of Marriage',
      imagePath: 'assets/Devotions & Sacraments/The Sacrament Of Marriage.jpg',
      category: 'Devotions',
      jsonAsset: 'assets/json/lessons/sacrament_of_marriage.json',
      tags: ['Marriage', 'Family', 'Sacrament'],
    ),
    NovenaCombo(
      text: 'Sacraments of Baptism & Confirmation',
      imagePath: 'assets/Devotions & Sacraments/baptism and confirmation.jpg',
      category: 'Devotions',
      jsonAsset: 'assets/json/lessons/baptism_and_confirmation.json',
      tags: ['Baptism', 'Confirmation', 'Sacrament'],
    ),
    NovenaCombo(
      text: 'Anointing of the Sick & Holy Orders',
      imagePath: 'assets/Devotions & Sacraments/holy order.jpg',
      category: 'Devotions',
      jsonAsset: 'assets/json/lessons/anointing_and_holy_orders.json',
      tags: ['Anointing', 'Priesthood', 'Sacrament'],
    ),
    NovenaCombo(
      text: 'Eucharistic Adoration & Holy Hour',
      imagePath: 'assets/Devotions & Sacraments/Adoration.jpg',
      category: 'Devotions',
      jsonAsset: 'assets/json/lessons/eucharistic_adoration.json',
      tags: ['Adoration', 'Monstrance', 'Prayer'],
    ),
    NovenaCombo(
      text: 'Stations of the Cross',
      imagePath: 'assets/Devotions & Sacraments/stations o the cross.jpg',
      category: 'Devotions',
      jsonAsset: 'assets/json/lessons/stations_of_the_cross.json',
      tags: ['Stations', 'Passion', 'Lent'],
    ),
    NovenaCombo(
      text: 'Scapulars',
      imagePath: 'assets/Devotions & Sacraments/scapular.jpg',
      category: 'Devotions',
      jsonAsset: 'assets/json/lessons/scapulars.json',
      tags: ['Sacramentals', 'Scapular', 'Devotion'],
    ),

    // ==========================================
    // Category 7: Online Web Resources
    // ==========================================
    NovenaCombo(
      text: 'Catechism of the Catholic Church (Vatican Archive)',
      imagePath: 'assets/vatican png.jpg',
      category: 'Online Resources',
      isOnline: true,
      webUrl: 'https://www.vatican.va/archive/ENG0015/_INDEX.HTM',
      tags: ['Vatican', 'Catechism', 'CCC'],
    ),
    NovenaCombo(
      text: 'Papal Encyclicals & Vatican Documents',
      imagePath: 'assets/Apostles Creed.jpg',
      category: 'Online Resources',
      isOnline: true,
      webUrl: 'https://www.vatican.va/content/vatican/en.html',
      tags: ['Vatican', 'Pope', 'Documents'],
    ),
    NovenaCombo(
      text: 'USCCB Daily Mass Readings & Bible',
      imagePath: 'assets/United_States_Conference_of_Catholic_Bishops.svg (1).webp',
      category: 'Online Resources',
      isOnline: true,
      webUrl: 'https://www.usccb.org/bible/readings',
      tags: ['USCCB', 'Readings', 'Bible'],
    ),
    NovenaCombo(
      text: 'Catholic Answers Q&A Library',
      imagePath: 'assets/CA.png',
      category: 'Online Resources',
      isOnline: true,
      webUrl: 'https://www.catholic.com',
      tags: ['Apologetics', 'Questions', 'Catholic Answers'],
    ),
    NovenaCombo(
      text: 'EWTN Catholic Library & Saints Wisdom',
      imagePath: 'assets/EWTN.jpeg',
      category: 'Online Resources',
      isOnline: true,
      webUrl: 'https://www.ewtn.com/catholicism/library',
      tags: ['EWTN', 'Library', 'Saints'],
    ),
    NovenaCombo(
      text: 'Word on Fire Daily Articles & Reflections',
      imagePath: 'assets/Word Fire.jpg',
      category: 'Online Resources',
      isOnline: true,
      webUrl: 'https://www.wordonfire.org',
      tags: ['Word on Fire', 'Articles', 'Theology'],
    ),
    NovenaCombo(
      text: 'New Advent Patristics & Catholic Encyclopedia',
      imagePath: 'assets/New Advent.jpg',
      category: 'Online Resources',
      isOnline: true,
      webUrl: 'https://www.newadvent.org',
      tags: ['New Advent', 'Encyclopedia', 'Fathers'],
    ),
    NovenaCombo(
      text: 'Catholic Social Teaching Guidelines (USCCB)',
      imagePath: 'assets/Social Teaching.jpg',
      category: 'Online Resources',
      isOnline: true,
      webUrl:
      'https://www.usccb.org/beliefs-and-teachings/what-we-believe/catholic-social-teaching',
      tags: ['Social Teaching', 'Justice', 'USCCB'],
    ),
    NovenaCombo(
      text: 'Liturgy of the Hours (Universalis / Divine Office)',
      imagePath: 'assets/Divine Office.jpg',
      category: 'Online Resources',
      isOnline: true,
      webUrl: 'https://universalis.com',
      tags: ['Liturgy of Hours', 'Breviary', 'Prayer'],
    ),
    NovenaCombo(
      text: 'Vatican News & Global Catholic Updates',
      imagePath: 'assets/Vatican News.jpg',
      category: 'Online Resources',
      isOnline: true,
      webUrl: 'https://www.vaticannews.va/en.html',
      tags: ['News', 'Vatican', 'Global'],
    ),
  ];

  static const List<NovenaCombo> novenaTitles = [
    NovenaCombo(
      text: 'Divine Mercy Chaplet',
      imagePath: 'assets/img_3.png',
      category: 'Novena',
    ),
    NovenaCombo(
      text: 'Sacred Heart',
      imagePath: 'assets/SacredHeart.jpg',
      category: 'Novena',
    ),
    NovenaCombo(
      text: 'Arch Angel Michael',
      imagePath: 'assets/Michael.jpg',
      category: 'Novena',
    ),
    NovenaCombo(
      text: 'Holy Trinity',
      imagePath: 'assets/Trinity.jpg',
      category: 'Novena',
    ),
    NovenaCombo(
      text: 'Pentecost',
      imagePath: 'assets/Pentecost.jpg',
      category: 'Novena',
    ),
    NovenaCombo(
      text: 'Pope Leo',
      imagePath: 'assets/Leo.jpg',
      category: 'Novena',
    ),
  ];

  List<NovenaCombo> get filteredLessons {
    if (selectedCategory == 'All') return spiritualLessons;
    return spiritualLessons
        .where((item) => item.category == selectedCategory)
        .toList();
  }

  /// Smart tap handler: launches the external site for online resources,
  /// otherwise routes into the in-app detail screen.
  /// Smart tap handler: routes lessons to LessonDetailScreen and novenas to NovenaDetailScreen
  /// Smart tap handler: routes lessons to LessonDetailScreen and novenas to NovenaDetailScreen
  Future<void> _handleItemTap(BuildContext context, NovenaCombo item) async {
    final url = item.webUrl;
    if (item.isOnline && url != null && url.isNotEmpty) {
      final uri = Uri.tryParse(url);
      if (uri == null) return;

      final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);

      if (!launched && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not open ${item.text}.')),
        );
      }
      return;
    }

    // Check if the item belongs to the spiritual lessons array
    final isLesson = spiritualLessons.contains(item);

    if (isLesson) {
      await _openLessonDetail(context, item);
    } else {
      await _openNovenaDetail(context, item);
    }
  }

  Future<void> _openLessonDetail(BuildContext context, NovenaCombo item) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LessonDetailScreen(lessonItem: item),
      ),
    );
  }

  Future<void> _openNovenaDetail(BuildContext context, NovenaCombo item) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NovenaDetailScreen(
          title: item.text,
          novenaImage: item.imagePath,
          storyText: getNovenaStoryForTitle(item.text),
          days: getNovenaDaysForTitle(item.text),
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
                        if (selectedCategory == 'Saints') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SaintsDirectoryScreen(),
                            ),
                          );
                          return;
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SeeAllGridPage(
                              title: 'Spiritual Lessons',
                              items: filteredLessons,
                              cardHeight: 220,
                              onItemTap: (item) => _handleItemTap(context, item),
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
                        selectedCategory == 'Saints' ? 'Open Directory' : 'See All',
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
                          fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
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

              // SAINTS: dynamic Saint of the Day card, or LESSONS HORIZONTAL LIST
              if (selectedCategory == 'Saints')
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SaintsDirectoryScreen(),
                        ),
                      );
                    },
                    child: ListenableBuilder(
                      listenable: SaintOfTheDayController.instance,
                      builder: (context, child) {
                        final todaySaint = SaintOfTheDayController.instance.primaryTodaySaint;
                        return SaintOfDayCard(saint: todaySaint);
                      },
                    ),
                  ),
                )
              else
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
                          onTap: () => _handleItemTap(context, pray),
                          child: Column(
                            children: [
                              Container(
                                width: 180,
                                height: 220,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: theme.colorScheme.shadow
                                          .withValues(alpha: 0.12),
                                      blurRadius: 10,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(20),
                                      child: Image.asset(
                                        pray.imagePath,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                            Container(
                                              color: theme.colorScheme
                                                  .surfaceContainerHighest,
                                              child: Icon(
                                                Icons
                                                    .image_not_supported_rounded,
                                                color: theme
                                                    .colorScheme.onSurface
                                                    .withValues(alpha: 0.4),
                                              ),
                                            ),
                                      ),
                                    ),
                                    if (pray.isOnline)
                                      const _OnlineIndicatorBadge(),
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
                        onItemTap: (item) => _openNovenaDetail(context, item), // <-- Updated here
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
                  onTap: () => _handleItemTap(context, item),
                  child: Column(
                    children: [
                      Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                item.imagePath,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(
                                      color: theme
                                          .colorScheme.surfaceContainerHighest,
                                      child: Icon(
                                        Icons.image_not_supported_rounded,
                                        color: theme.colorScheme.onSurface
                                            .withValues(alpha: 0.4),
                                      ),
                                    ),
                              ),
                            ),
                            if (item.isOnline) const _OnlineIndicatorBadge(),
                          ],
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

/// Small circular badge shown on cards for items that open an external
/// link (isOnline == true), signalling they leave the app.
class _OnlineIndicatorBadge extends StatelessWidget {
  const _OnlineIndicatorBadge();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Positioned(
      top: 8,
      right: 8,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface.withValues(alpha: 0.88),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.shadow.withValues(alpha: 0.18),
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Icon(
          Icons.open_in_new_rounded,
          size: 14,
          color: theme.colorScheme.primary,
        ),
      ),
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
                          color:
                          theme.colorScheme.shadow.withValues(alpha: 0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            item.imagePath,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                                  color:
                                  theme.colorScheme.surfaceContainerHighest,
                                  child: Icon(
                                    Icons.image_not_supported_rounded,
                                    color: theme.colorScheme.onSurface
                                        .withValues(alpha: 0.4),
                                  ),
                                ),
                          ),
                        ),
                        if (item.isOnline) const _OnlineIndicatorBadge(),
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