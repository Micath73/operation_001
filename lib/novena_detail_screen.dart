import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:operation_001/db_helper.dart';
import 'package:operation_001/prayer_completion_screen.dart';

// Centralized so the whole screen's typographic voice lives in one place —
// change it once here rather than in ~15 scattered TextStyle literals.
// NOTE: confirm 'Serif' is actually registered as a custom font family in
// pubspec.yaml — if it isn't, this silently falls back to a platform default
// and the "premium" serif look this screen is going for won't render.
const String kNovenaFontFamily = 'Serif';

// ── DATA MODELS ─────────────────────────────────────────────────────────────

class NovenaDayContent {
  final int dayNumber;
  final String theme;
  final String prayer;

  const NovenaDayContent({
    required this.dayNumber,
    required this.theme,
    required this.prayer,
  });
}

class NovenaData {
  NovenaData._();

  static String getStoryForTitle(String title) {
    final lowerTitle = title.toLowerCase();
    if (lowerTitle.contains("divine mercy")) {
      return divineMercyStory;
    } else if (lowerTitle.contains("sacred heart")) {
      return sacredHeartStory;
    }
    return "A novena is a traditional Catholic devotion consisting of private or public prayers repeated for nine successive days or weeks for a particular intent.";
  }

  static List<NovenaDayContent> getDaysForTitle(String title) {
    final cleanTitle = title.toLowerCase().trim();

    if (masterNovenaDB.containsKey(title)) {
      return masterNovenaDB[title]!;
    }

    for (final entry in masterNovenaDB.entries) {
      final dbKey = entry.key.toLowerCase();
      if (cleanTitle.contains(dbKey) || dbKey.contains(cleanTitle)) {
        return entry.value;
      }
    }

    if (cleanTitle.contains("sacred heart")) {
      return masterNovenaDB["Novena to the Sacred Heart of Jesus"]!;
    } else if (cleanTitle.contains("divine mercy")) {
      return masterNovenaDB["Divine Mercy Chaplet"]!;
    }

    return List.generate(
      9,
          (i) => NovenaDayContent(
        dayNumber: i + 1,
        theme: "Day ${i + 1}: Grace & Intentions",
        prayer:
        "O Lord, as we reflect on $title during Day ${i + 1}, we place our humble prayer and heart's desires into Your holy hands. Amen.",
      ),
    );
  }

  static const String divineMercyStory =
      'Jesus asked that the Feast of the Divine Mercy be preceded by a Novena to the Divine Mercy which would begin on Good Friday. He gave St. Faustina an intention to pray for on each day of the Novena, saving for the last day the most difficult intention of all, the lukewarm and indifferent.\n\n'
      '"On each day of the novena you will bring to My heart a different group of souls and you will immerse them in this ocean of My mercy ... On each day you will beg My Father, on the strength of My passion, for the graces for these souls."';

  static const String sacredHeartStory =
      '"Do not let the past disturb you – just leave everything in the Sacred Heart and begin again with joy." — St. Mother Teresa\n\n'
      'The devotion to the Sacred Heart of Jesus was inspired by Jesus’ apparitions to St. Margaret Mary Alacoque. '
      'This prayer, known as the Efficacious Novena, was prayed daily by St. Padre Pio for all who requested his intercession. '
      'Through these 9 days, we place our petitions in Christ’s infinite ocean of mercy and unite our hearts to His divine love.';

  static final Map<String, List<NovenaDayContent>> masterNovenaDB = {
    "Divine Mercy Chaplet": [
      const NovenaDayContent(
        dayNumber: 1,
        theme: "First Day - All Mankind, Especially Sinners",
        prayer:
        '"Today bring to Me all mankind, especially all sinners, and immerse them in the ocean of My mercy. In this way you will console Me in the bitter grief into which the loss of souls plunges Me."\n\n'
            'Most Merciful Jesus, whose very nature it is to have compassion on us and to forgive us, do not look upon our sins but upon our trust which we place in Your infinite goodness. Receive us all into the abode of Your Most Compassionate Heart, and never let us escape from It. We beg this of You by Your love which unites You to the Father and the Holy Spirit.\n\n'
            'Eternal Father, turn Your merciful gaze upon all mankind and especially upon poor sinners, all enfolded in the Most Compassionate Heart of Jesus. For the sake of His sorrowful Passion show us Your mercy, that we may praise the omnipotence of Your mercy for ever and ever. Amen.',
      ),
      const NovenaDayContent(
        dayNumber: 2,
        theme: "Second Day - Souls of Priests & Religious",
        prayer:
        '"Today bring to Me the Souls of Priests and Religious, and immerse them in My unfathomable mercy. It was they who gave me strength to endure My bitter Passion. Through them as through channels My mercy flows out upon mankind."\n\n'
            'Most Merciful Jesus, from whom comes all that is good, increase Your grace in men and women consecrated to Your service, that they may perform worthy works of mercy; and that all who see them may glorify the Father of Mercy who is in heaven.\n\n'
            'Eternal Father, turn Your merciful gaze upon the company of chosen ones in Your vineyard -- upon the souls of priests and religious; and endow them with the strength of Your blessing. For the love of the Heart of Your Son in which they are enfolded, impart to them Your power and light, that they may be able to guide others in the way of salvation and with one voice sing praise to Your boundless mercy for ages without end. Amen.',
      ),
      const NovenaDayContent(
        dayNumber: 3,
        theme: "Third Day - Devout & Faithful Souls",
        prayer:
        '"Today bring to Me all Devout and Faithful Souls, and immerse them in the ocean of My mercy. These souls brought me consolation on the Way of the Cross. They were a drop of consolation in the midst of an ocean of bitterness."\n\n'
            'Most Merciful Jesus, from the treasury of Your mercy, You impart Your graces in great abundance to each and all. Receive us into the abode of Your Most Compassionate Heart and never let us escape from It. We beg this grace of You by that most wondrous love for the heavenly Father with which Your Heart burns so fiercely.\n\n'
            'Eternal Father, turn Your merciful gaze upon faithful souls, as upon the inheritance of Your Son. For the sake of His sorrowful Passion, grant them Your blessing and surround them with Your constant protection. Thus may they never fail in love or lose the treasure of the holy faith, but rather, with all the hosts of Angels and Saints, may they glorify Your boundless mercy for endless ages. Amen.',
      ),
      const NovenaDayContent(
        dayNumber: 4,
        theme: "Fourth Day - Those Who Do Not Believe in God",
        prayer:
        '"Today bring to Me those who do not believe in God and those who do not know Me, I was thinking also of them during My bitter Passion, and their future zeal comforted My Heart. Immerse them in the ocean of My mercy."\n\n'
            'Most compassionate Jesus, You are the Light of the whole world. Receive into the abode of Your Most Compassionate Heart the souls of those who do not believe in God and of those who as yet do not know You. Let the rays of Your grace enlighten them that they, too, together with us, may extol Your wonderful mercy; and do not let them escape from the abode which is Your Most Compassionate Heart.\n\n'
            'Eternal Father, turn Your merciful gaze upon the souls of those who do not believe in You, and of those who as yet do not know You, but who are enclosed in the Most Compassionate Heart of Jesus. Draw them to the light of the Gospel. These souls do not know what great happiness it is to love You. Grant that they, too, may extol the generosity of Your mercy for endless ages. Amen.',
      ),
      const NovenaDayContent(
        dayNumber: 5,
        theme: "Fifth Day - Those Who Separated Themselves From My Church",
        prayer:
        '"Today bring to Me the Souls of those who have separated themselves from My Church, and immerse them in the ocean of My mercy. During My bitter Passion they tore at My Body and Heart, that is, My Church. As they return to unity with the Church My wounds heal and in this way they alleviate My Passion."\n\n'
            'Most Merciful Jesus, Goodness Itself, You do not refuse light to those who seek it of You. Receive into the abode of Your Most Compassionate Heart the souls of those who have separated themselves from Your Church. Draw them by Your light into the unity of the Church, and do not let them escape from the abode of Your Most Compassionate Heart; but bring it about that they, too, come to glorify the generosity of Your mercy.\n\n'
            'Eternal Father, turn Your merciful gaze upon the souls of those who have separated themselves from Your Son\'s Church, who have squandered Your blessings and misused Your graces by obstinately persisting in their errors. Do not look upon their errors, but upon the love of Your own Son and upon His bitter Passion, which He underwent for their sake, since they, too, are enclosed in His Most Compassionate Heart. Bring it about that they also may glorify Your great mercy for endless ages. Amen.',
      ),
      const NovenaDayContent(
        dayNumber: 6,
        theme: "Sixth Day - Meek and Humble Souls and Little Children",
        prayer:
        '"Today bring to Me the Meek and Humble Souls and the Souls of Little Children, and immerse them in My mercy. These souls most closely resemble My Heart. They strengthened Me during My bitter agony. I saw them as earthly Angels, who will keep vigil at My altars. I pour out upon them whole torrents of grace. I favor humble souls with My confidence."\n\n'
            'Most Merciful Jesus, You yourself have said, "Learn from Me for I am meek and humble of heart." Receive into the abode of Your Most Compassionate Heart all meek and humble souls and the souls of little children. These souls send all heaven into ecstasy and they are the heavenly Father\'s favorites. They are a sweet-smelling bouquet before the throne of God; God Himself takes delight in their fragrance. These souls have a permanent abode in Your Most Compassionate Heart, O Jesus, and they unceasingly sing out a hymn of love and mercy.\n\n'
            'Eternal Father, turn Your merciful gaze upon meek souls, upon humble souls, and upon little children who are enfolded in the abode which is the Most Compassionate Heart of Jesus. These souls bear the closest resemblance to Your Son. Their fragrance rises from the earth and reaches Your very throne. Father of mercy and of all goodness, I beg You by the love You bear these souls and by the delight You take in them: Bless the whole world, that all souls together may sing out the praises of Your mercy for endless ages. Amen.',
      ),
      const NovenaDayContent(
        dayNumber: 7,
        theme: "Seventh Day - Souls Who Venerate & Glorify My Mercy",
        prayer:
        '"Today bring to Me the Souls who especially venerate and glorify My Mercy, and immerse them in My mercy. These souls sorrowed most over my Passion and entered most deeply into My spirit. They are living images of My Compassionate Heart. These souls will shine with a special brightness in the next life. Not one of them will go into the fire of hell. I shall particularly defend each one of them at the hour of death."\n\n'
            'Most Merciful Jesus, whose Heart is Love Itself, receive into the abode of Your Most Compassionate Heart the souls of those who particularly extol and venerate the greatness of Your mercy. These souls are mighty with the very power of God Himself. In the midst of all afflictions and adversities they go forward, confident of Your mercy; and united to You, O Jesus, they carry all mankind on their shoulders. These souls will not be judged severely, but Your mercy will embrace them as they depart from this life.\n\n'
            'Eternal Father, turn Your merciful gaze upon the souls who glorify and venerate Your greatest attribute, that of Your fathomless mercy, and who are enclosed in the Most Compassionate Heart of Jesus. These souls are a living Gospel; their hands are full of deeds of mercy, and their hearts, overflowing with joy, sing a canticle of mercy to You, O Most High!\n\n'
            'Show them Your mercy according to the hope and trust they have placed in You. Let there be accomplished in them the promise of Jesus, who said to them that during their life, but especially at the hour of death, the souls who will venerate this fathomless mercy of His, He, Himself, will defend as His glory. Amen.',
      ),
      const NovenaDayContent(
        dayNumber: 8,
        theme: "Eighth Day - Souls in the Prison of Purgatory",
        prayer:
        '"Today bring to Me the Souls who are in the prison of Purgatory, and immerse them in the abyss of My mercy. Let the torrents of My Blood cool down their scorching flames. All these souls are greatly loved by Me. They are making retribution to My justice. It is in your power to bring them relief. Draw all the indulgences from the treasury of My Church and offer them on their behalf. Oh, if you only knew the torments they suffer, you would continually offer for them the alms of the spirit and pay off their debt to My justice."\n\n'
            'Most Merciful Jesus, You Yourself have said that You desire mercy; so I bring into the abode of Your Most Compassionate Heart the souls in Purgatory, souls who are very dear to You, and yet, who must make retribution to Your justice. May the streams of Blood and Water which gushed forth from Your Heart put out the flames of Purgatory, that there, too, the power of Your mercy may be celebrated.\n\n'
            'Eternal Father, turn Your merciful gaze upon the souls suffering in Purgatory, who are enfolded in the Most Compassionate Heart of Jesus. I beg You, by the sorrowful Passion of Jesus Your Son, and by all the bitterness with which His most sacred Soul was flooded: Manifest Your mercy to the souls who are under Your just scrutiny. Look upon them in no other way but only through the Wounds of Jesus, Your dearly beloved Son; for we firmly believe that there is no limit to Your goodness and compassion. Amen.',
      ),
      const NovenaDayContent(
        dayNumber: 9,
        theme: "Ninth Day - Lukewarm Souls",
        prayer:
        '"Today bring to Me the Souls who have become Lukewarm, and immerse them in the abyss of My mercy. These souls wound My Heart most painfully. My soul suffered the most dreadful loathing in the Garden of Olives because of lukewarm souls. They were the reason I cried out: \'Father, take this cup away from Me, if it be Your will.\' For them, the last hope of salvation is to run to My mercy."\n\n'
            'Most compassionate Jesus, You are Compassion Itself. I bring lukewarm souls into the abode of Your Most Compassionate Heart. In this fire of Your pure love, let these tepid souls who, like corpses, filled You with such deep loathing, be once again set aflame. O Most Compassionate Jesus, exercise the omnipotence of Your mercy and draw them into the very ardor of Your love, and bestow upon them the gift of holy love, for nothing is beyond Your power.\n\n'
            'Eternal Father, turn Your merciful gaze upon lukewarm souls who are nonetheless enfolded in the Most Compassionate Heart of Jesus. Father of Mercy, I beg You by the bitter Passion of Your Son and by His three-hour agony on the Cross: Let them, too, glorify the abyss of Your mercy. Amen.',
      ),
    ],
    "Novena to the Sacred Heart of Jesus": [
      const NovenaDayContent(
        dayNumber: 1,
        theme: "Day 1: Resting in the Heart of Jesus",
        prayer:
        "In the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n"
            "O Sacred Heart of Jesus, on this first day, I place my trust in Your infinite love. You invite all who labor and are heavy burdened to come to You for rest. Lord, take my worries, my doubts, and my intentions into Your Heart.\n\n"
            "I. O my Jesus, You have said: “Truly I say to you, ask and you will receive, seek and you will find, knock and it will be opened to you.” Behold I knock, I seek, and I ask for the grace of my intention.\n"
            "• Our Father... • Hail Mary... • Glory be...\n"
            "Sacred Heart of Jesus, I place all my trust in You.\n\n"
            "II. O my Jesus, You have said: “Truly I say to you, if you ask anything of the Father in My name, He will give it to you.” Behold, in Your name, I ask the Father for the grace of my intention.\n"
            "• Our Father... • Hail Mary... • Glory be...\n"
            "Sacred Heart of Jesus, I place all my trust in You.\n\n"
            "III. O my Jesus, You have said: “Truly I say to you, heaven and earth will pass away but My words will not pass away.” Encouraged by Your infallible words, I now ask for the grace of my intention.\n"
            "• Our Father... • Hail Mary... • Glory be...\n"
            "Sacred Heart of Jesus, I place all my trust in You.\n\n"
            "Concluding Prayer:\n"
            "O Sacred Heart of Jesus, have pity on us sinners and grant us the grace which we ask of You through the Immaculate Heart of Mary. Amen.",
      ),
      const NovenaDayContent(
        dayNumber: 2,
        theme: "Day 2: Trusting in Divine Mercy",
        prayer:
        "In the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n"
            "Sacred Heart of Jesus, on this second day, I seek the grace of complete confidence in Your divine will. When obstacles arise and my faith feels weak, draw my soul closer to the burning furnace of Your charity.\n\n"
            "I. O my Jesus, You have said: “Truly I say to you, ask and you will receive, seek and you will find, knock and it will be opened to you.” Behold I knock, I seek, and I ask for the grace of my intention.\n"
            "• Our Father... • Hail Mary... • Glory be...\n"
            "Sacred Heart of Jesus, I place all my trust in You.\n\n"
            "II. O my Jesus, You have said: “Truly I say to you, if you ask anything of the Father in My name, He will give it to you.” Behold, in Your name, I ask the Father for the grace of my intention.\n"
            "• Our Father... • Hail Mary... • Glory be...\n"
            "Sacred Heart of Jesus, I place all my trust in You.\n\n"
            "III. O my Jesus, You have said: “Truly I say to you, heaven and earth will pass away but My words will not pass away.” Encouraged by Your infallible words, I now ask for the grace of my intention.\n"
            "• Our Father... • Hail Mary... • Glory be...\n"
            "Sacred Heart of Jesus, I place all my trust in You.\n\n"
            "Concluding Prayer:\n"
            "O Sacred Heart of Jesus, grant us the grace which we ask through Mary's Immaculate Heart. Amen.",
      ),
      const NovenaDayContent(
        dayNumber: 3,
        theme: "Day 3: Healing of Our Weaknesses",
        prayer:
        "In the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n"
            "Lord Jesus, Your Sacred Heart was wounded for our transgressions. Today I ask for spiritual healing and forgiveness. Cleanse my heart from sin and fill it with peace, patience, and purity.\n\n"
            "I. O my Jesus, You have said: “Truly I say to you, ask and you will receive, seek and you will find, knock and it will be opened to you.” Behold I knock, I seek, and I ask for the grace of my intention.\n"
            "• Our Father... • Hail Mary... • Glory be...\n"
            "Sacred Heart of Jesus, I place all my trust in You.\n\n"
            "II. O my Jesus, You have said: “Truly I say to you, if you ask anything of the Father in My name, He will give it to you.” Behold, in Your name, I ask the Father for the grace of my intention.\n"
            "• Our Father... • Hail Mary... • Glory be...\n"
            "Sacred Heart of Jesus, I place all my trust in You.\n\n"
            "III. O my Jesus, You have said: “Truly I say to you, heaven and earth will pass away but My words will not pass away.” Encouraged by Your infallible words, I now ask for the grace of my intention.\n"
            "• Our Father... • Hail Mary... • Glory be...\n"
            "Sacred Heart of Jesus, I place all my trust in You.\n\n"
            "Concluding Prayer:\n"
            "O Sacred Heart of Jesus, have pity on us and grant our petition through Mary, Mother of Mercy. Amen.",
      ),
      const NovenaDayContent(
        dayNumber: 4,
        theme: "Day 4: Growth in Charity and Love",
        prayer:
        "In the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n"
            "O Most Holy Heart of Jesus, teach me to love others as You have loved us. Remove all selfishness, pride, and resentment from my life, and let Your divine love shine through my daily actions.\n\n"
            "I. O my Jesus, You have said: “Truly I say to you, ask and you will receive, seek and you will find, knock and it will be opened to you.” Behold I knock, I seek, and I ask for the grace of my intention.\n"
            "• Our Father... • Hail Mary... • Glory be...\n"
            "Sacred Heart of Jesus, I place all my trust in You.\n\n"
            "II. O my Jesus, You have said: “Truly I say to you, if you ask anything of the Father in My name, He will give it to you.” Behold, in Your name, I ask the Father for the grace of my intention.\n"
            "• Our Father... • Hail Mary... • Glory be...\n"
            "Sacred Heart of Jesus, I place all my trust in You.\n\n"
            "III. O my Jesus, You have said: “Truly I say to you, heaven and earth will pass away but My words will not pass away.” Encouraged by Your infallible words, I now ask for the grace of my intention.\n"
            "• Our Father... • Hail Mary... • Glory be...\n"
            "Sacred Heart of Jesus, I place all my trust in You.\n\n"
            "Concluding Prayer:\n"
            "O Sacred Heart of Jesus, hear our prayer through the intercession of the Blessed Virgin Mary. Amen.",
      ),
      const NovenaDayContent(
        dayNumber: 5,
        theme: "Day 5: Strength in Times of Trial",
        prayer:
        "In the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n"
            "Sacred Heart of Jesus, You experienced suffering and loneliness in the Garden of Olives. Give me courage when I face trials, and remind me that You walk with me through every shadow.\n\n"
            "I. O my Jesus, You have said: “Truly I say to you, ask and you will receive, seek and you will find, knock and it will be opened to you.” Behold I knock, I seek, and I ask for the grace of my intention.\n"
            "• Our Father... • Hail Mary... • Glory be...\n"
            "Sacred Heart of Jesus, I place all my trust in You.\n\n"
            "II. O my Jesus, You have said: “Truly I say to you, if you ask anything of the Father in My name, He will give it to you.” Behold, in Your name, I ask the Father for the grace of my intention.\n"
            "• Our Father... • Hail Mary... • Glory be...\n"
            "Sacred Heart of Jesus, I place all my trust in You.\n\n"
            "III. O my Jesus, You have said: “Truly I say to you, heaven and earth will pass away but My words will not pass away.” Encouraged by Your infallible words, I now ask for the grace of my intention.\n"
            "• Our Father... • Hail Mary... • Glory be...\n"
            "Sacred Heart of Jesus, I place all my trust in You.\n\n"
            "Concluding Prayer:\n"
            "O Sacred Heart of Jesus, grant us endurance and grant our request through Mary's Sorrowful Heart. Amen.",
      ),
      const NovenaDayContent(
        dayNumber: 6,
        theme: "Day 6: Peace for Our Families",
        prayer:
        "In the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n"
            "O Jesus, King and Center of all hearts, I consecrate my home and family to Your Sacred Heart. Bring unity, peace, and understanding into our relationships, and protect us from all harm.\n\n"
            "I. O my Jesus, You have said: “Truly I say to you, ask and you will receive, seek and you will find, knock and it will be opened to you.” Behold I knock, I seek, and I ask for the grace of my intention.\n"
            "• Our Father... • Hail Mary... • Glory be...\n"
            "Sacred Heart of Jesus, I place all my trust in You.\n\n"
            "II. O my Jesus, You have said: “Truly I say to you, if you ask anything of the Father in My name, He will give it to you.” Behold, in Your name, I ask the Father for the grace of my intention.\n"
            "• Our Father... • Hail Mary... • Glory be...\n"
            "Sacred Heart of Jesus, I place all my trust in You.\n\n"
            "III. O my Jesus, You have said: “Truly I say to you, heaven and earth will pass away but My words will not pass away.” Encouraged by Your infallible words, I now ask for the grace of my intention.\n"
            "• Our Father... • Hail Mary... • Glory be...\n"
            "Sacred Heart of Jesus, I place all my trust in You.\n\n"
            "Concluding Prayer:\n"
            "O Sacred Heart of Jesus, bless our homes and grant our special intentions through Holy Mary. Amen.",
      ),
      const NovenaDayContent(
        dayNumber: 7,
        theme: "Day 7: Surrender of Our Intentions",
        prayer:
        "In the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n"
            "Loving Savior, today I surrender all my anxiety regarding the answer to my prayer. I lay my deepest longings at the foot of Your Cross, trusting that Your divine wisdom knows what is best for my soul.\n\n"
            "I. O my Jesus, You have said: “Truly I say to you, ask and you will receive, seek and you will find, knock and it will be opened to you.” Behold I knock, I seek, and I ask for the grace of my intention.\n"
            "• Our Father... • Hail Mary... • Glory be...\n"
            "Sacred Heart of Jesus, I place all my trust in You.\n\n"
            "II. O my Jesus, You have said: “Truly I say to you, if you ask anything of the Father in My name, He will give it to you.” Behold, in Your name, I ask the Father for the grace of my intention.\n"
            "• Our Father... • Hail Mary... • Glory be...\n"
            "Sacred Heart of Jesus, I place all my trust in You.\n\n"
            "III. O my Jesus, You have said: “Truly I say to you, heaven and earth will pass away but My words will not pass away.” Encouraged by Your infallible words, I now ask for the grace of my intention.\n"
            "• Our Father... • Hail Mary... • Glory be...\n"
            "Sacred Heart of Jesus, I place all my trust in You.\n\n"
            "Concluding Prayer:\n"
            "O Sacred Heart of Jesus, accept my surrender and fulfill my petitions as best suits Your divine plan. Amen.",
      ),
      const NovenaDayContent(
        dayNumber: 8,
        theme: "Day 8: Persevering Faith and Hope",
        prayer:
        "In the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n"
            "Sacred Heart of Jesus, keep my hope steadfast as I near the end of this novena. Grant me the gift of final perseverance, that I may remain faithful to You through all stages of my life journey.\n\n"
            "I. O my Jesus, You have said: “Truly I say to you, ask and you will receive, seek and you will find, knock and it will be opened to you.” Behold I knock, I seek, and I ask for the grace of my intention.\n"
            "• Our Father... • Hail Mary... • Glory be...\n"
            "Sacred Heart of Jesus, I place all my trust in You.\n\n"
            "II. O my Jesus, You have said: “Truly I say to you, if you ask anything of the Father in My name, He will give it to you.” Behold, in Your name, I ask the Father for the grace of my intention.\n"
            "• Our Father... • Hail Mary... • Glory be...\n"
            "Sacred Heart of Jesus, I place all my trust in You.\n\n"
            "III. O my Jesus, You have said: “Truly I say to you, heaven and earth will pass away but My words will not pass away.” Encouraged by Your infallible words, I now ask for the grace of my intention.\n"
            "• Our Father... • Hail Mary... • Glory be...\n"
            "Sacred Heart of Jesus, I place all my trust in You.\n\n"
            "Concluding Prayer:\n"
            "O Sacred Heart of Jesus, strengthen my faith and hear my prayer through the Mother of God. Amen.",
      ),
      const NovenaDayContent(
        dayNumber: 9,
        theme: "Day 9: Thanksgiving and Consecration",
        prayer:
        "In the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n"
            "O Sacred Heart of Jesus, on this final day, I thank You for Your endless mercies and for listening to my prayer. I consecrate my heart, my mind, and my entire life to Your service now and forever.\n\n"
            "I. O my Jesus, You have said: “Truly I say to you, ask and you will receive, seek and you will find, knock and it will be opened to you.” Behold I knock, I seek, and I ask for the grace of my intention.\n"
            "• Our Father... • Hail Mary... • Glory be...\n"
            "Sacred Heart of Jesus, I place all my trust in You.\n\n"
            "II. O my Jesus, You have said: “Truly I say to you, if you ask anything of the Father in My name, He will give it to you.” Behold, in Your name, I ask the Father for the grace of my intention.\n"
            "• Our Father... • Hail Mary... • Glory be...\n"
            "Sacred Heart of Jesus, I place all my trust in You.\n\n"
            "III. O my Jesus, You have said: “Truly I say to you, heaven and earth will pass away but My words will not pass away.” Encouraged by Your infallible words, I now ask for the grace of my intention.\n"
            "• Our Father... • Hail Mary... • Glory be...\n"
            "Sacred Heart of Jesus, I place all my trust in You.\n\n"
            "Concluding Prayer:\n"
            "O Sacred Heart of Jesus, for whom it is impossible not to have compassion on the afflicted, have pity on us miserable sinners and grant us the grace which we ask of You, through the Sorrowful and Immaculate Heart of Mary, Your tender Mother and ours.\n\n"
            "Hail, Holy Queen (Salve Regina):\n"
            "Hail, Holy Queen, Mother of Mercy, our life, our sweetness, and our hope. To thee do we cry, poor banished children of Eve. To thee do we send up our sighs, mourning and weeping in this valley of tears. Turn then, most gracious advocate, thine eyes of mercy toward us, and after this our exile, show unto us the blessed fruit of thy womb, Jesus. O clement, O loving, O sweet Virgin Mary. Amen.",
      ),
    ],
  };
}

void openNovenaDetailScreen(
    BuildContext context, {
      required String title,
      required String novenaImage,
      int targetDay = 1,
      bool autoStart = false,
      VoidCallback? onProgressUpdated,
    }) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => NovenaDetailScreen(
        title: title,
        novenaImage: novenaImage,
        storyText: NovenaData.getStoryForTitle(title),
        days: NovenaData.getDaysForTitle(title),
        initialDay: targetDay,
        autoStart: autoStart,
      ),
    ),
  ).then((updated) {
    if (updated == true || onProgressUpdated != null) {
      onProgressUpdated?.call();
    }
  });
}

// ── MAIN SCREEN WIDGET ───────────────────────────────────────────────────────

class NovenaDetailScreen extends StatefulWidget {
  final String title;
  final String novenaImage;
  final String? storyText;
  final List<NovenaDayContent> days;
  final int initialDay;
  final bool autoStart;

  const NovenaDetailScreen({
    super.key,
    required this.title,
    required this.novenaImage,
    this.storyText,
    required this.days,
    this.initialDay = 1,
    this.autoStart = false,
  });

  @override
  State<NovenaDetailScreen> createState() => _NovenaDetailScreenState();
}

class _NovenaDetailScreenState extends State<NovenaDetailScreen> {
  late int currentDay;
  double fontSize = 16.5;
  final Set<int> completedDays = {};
  bool _hasProgressChanged = false;

  final TextEditingController intentionController = TextEditingController();
  final ScrollController dayScrollController = ScrollController();

  // One GlobalKey per day-chip so we can scroll to the actual rendered
  // position via Scrollable.ensureVisible, rather than assuming every chip
  // is a fixed 84px wide (completed chips are wider — they carry a
  // checkmark icon — so that assumption drifts out of alignment over the
  // course of the novena).
  final Map<int, GlobalKey> _dayChipKeys = {
    for (int i = 1; i <= 9; i++) i: GlobalKey(),
  };

  @override
  void initState() {
    super.initState();
    currentDay = widget.initialDay;
    _loadSavedProgress();
    intentionController.addListener(_saveIntention);
  }

  @override
  void dispose() {
    intentionController.removeListener(_saveIntention);
    intentionController.dispose();
    dayScrollController.dispose();
    super.dispose();
  }

  Future<void> _loadSavedProgress() async {
    final savedCompletedDays =
    await DatabaseHelper.instance.getCompletedDaysForNovena(widget.title);

    final intentions = await DatabaseHelper.instance
        .getIntentions(category: 'Novena_${widget.title}');

    if (!mounted) return;

    setState(() {
      completedDays.clear();
      completedDays.addAll(savedCompletedDays);

      if (intentions.isNotEmpty) {
        intentionController.text = intentions.first['intention'] as String;
      }

      if (!widget.autoStart && savedCompletedDays.isNotEmpty) {
        for (int i = 1; i <= 9; i++) {
          if (!completedDays.contains(i)) {
            currentDay = i;
            break;
          }
        }
      }
    });

    _scrollToActiveDay();

    if (completedDays.length == 9) {
      _promptRestartNovena();
    }
  }

  Future<void> _promptRestartNovena() async {
    final bool? confirm = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: const Text('Novena Completed!'),
        content: Text(
          'You have completed all 9 days of "${widget.title}". Would you like to restart this prayer from Day 1?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('View Progress'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Restart Novena'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await _clearAllProgress();
    }
  }

  Future<void> _clearAllProgress() async {
    await DatabaseHelper.instance.clearNovenaProgress(widget.title);
    _hasProgressChanged = true;

    if (!mounted) return;

    setState(() {
      completedDays.clear();
      currentDay = 1;
    });

    _scrollToActiveDay();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('"${widget.title}" progress has been reset.'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> _saveIntention() async {
    final text = intentionController.text.trim();
    final category = 'Novena_${widget.title}';

    final existingIntentions =
    await DatabaseHelper.instance.getIntentions(category: category);

    for (final record in existingIntentions) {
      final int existingId = record['id'] as int;
      await DatabaseHelper.instance.deleteIntention(existingId);
    }

    if (text.isNotEmpty) {
      await DatabaseHelper.instance.addIntention(
        category: category,
        intention: text,
      );
    }
  }

  void _scrollToActiveDay() {
    // Wait a frame so the chip list has actually laid out (relevant right
    // after initial load / a setState that just changed which chip is wider).
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final key = _dayChipKeys[currentDay];
      final ctx = key?.currentContext;
      if (ctx == null) return;
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
        alignment: 0.5,
      );
    });
  }

  Future<void> _completeCurrentDay() async {
    HapticFeedback.mediumImpact();

    if (currentDay == 9) {
      final List<int> unprayedDays = [];
      for (int i = 1; i <= 8; i++) {
        if (!completedDays.contains(i)) {
          unprayedDays.add(i);
        }
      }

      if (unprayedDays.isNotEmpty) {
        final String daysText = unprayedDays.length == 1
            ? 'Day ${unprayedDays.first}'
            : 'Days ${unprayedDays.join(", ")}';

        final bool? markAllAsCompleted = await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => AlertDialog(
            title: const Text('Unprayed Days Detected'),
            content: Text(
              'You haven\'t completed $daysText yet.\n\nWould you like to mark all missed days as completed or go back and pray them?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: Text(
                    'Go to ${unprayedDays.length == 1 ? "Day" : "Earliest Day"} ${unprayedDays.first}'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(ctx, true),
                child: const Text('Mark All & Complete'),
              ),
            ],
          ),
        );

        if (markAllAsCompleted == true) {
          for (final dayNum in unprayedDays) {
            await DatabaseHelper.instance.setNovenaDayCompletion(
              novenaTitle: widget.title,
              dayNumber: dayNum,
              isCompleted: true,
            );
            completedDays.add(dayNum);
          }
        } else {
          setState(() {
            currentDay = unprayedDays.first;
          });
          _scrollToActiveDay();
          return;
        }
      }
    }

    await DatabaseHelper.instance.setNovenaDayCompletion(
      novenaTitle: widget.title,
      dayNumber: currentDay,
      isCompleted: true,
    );

    _hasProgressChanged = true;

    if (!mounted) return;

    setState(() {
      completedDays.add(currentDay);
    });

    if (currentDay < 9) {
      setState(() => currentDay++);
      _scrollToActiveDay();
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PrayerCompletionScreen(
            isAmharic: false,
            prayerType: 'Novena',
            titleEn: 'Novena Completed',
            titleAm: 'የኖቬና ጸሎት በስኬት ተጠናቋል',
            detailValue: widget.title,
            bgImagePath: widget.novenaImage,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryAccent = theme.colorScheme.primary;

    final activeDayData = widget.days.firstWhere(
          (d) => d.dayNumber == currentDay,
      orElse: () => widget.days.isNotEmpty
          ? widget.days.first
          : NovenaDayContent(
        dayNumber: currentDay,
        theme: "Day $currentDay Intention",
        prayer: "O Lord, hear our prayer...",
      ),
    );

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        Navigator.pop(context, _hasProgressChanged);
      },
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // ── SLIVER APP BAR WITH HERO HEADER ──
            SliverAppBar(
              expandedHeight: 280.0,
              pinned: true,
              elevation: 0,
              leading: CircleAvatar(
                backgroundColor: Colors.black38,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                    size: 18,
                  ),
                  onPressed: () => Navigator.pop(context, _hasProgressChanged),
                ),
              ),
              actions: [
                if (completedDays.isNotEmpty)
                  CircleAvatar(
                    backgroundColor: Colors.black38,
                    child: IconButton(
                      tooltip: 'Reset Novena',
                      // Semantic error color from the theme instead of a
                      // fixed named color — correctly contrasted in both
                      // light and dark modes by construction.
                      icon: Icon(Icons.refresh_rounded,
                          color: theme.colorScheme.error),
                      onPressed: () async {
                        final bool? confirm = await showDialog<bool>(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text('Reset Progress?'),
                            content: Text(
                              'Are you sure you want to clear all progress for "${widget.title}"?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(ctx, false),
                                child: const Text('Cancel'),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: theme.colorScheme.error,
                                ),
                                onPressed: () => Navigator.pop(ctx, true),
                                child: Text(
                                  'Reset',
                                  style: TextStyle(
                                      color: theme.colorScheme.onError),
                                ),
                              ),
                            ],
                          ),
                        );
                        if (confirm == true) {
                          await _clearAllProgress();
                        }
                      },
                    ),
                  ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Colors.black38,
                  child: IconButton(
                    icon: const Icon(Icons.text_decrease_rounded,
                        color: Colors.white),
                    onPressed: () {
                      if (fontSize > 12) setState(() => fontSize -= 2);
                    },
                  ),
                ),
                const SizedBox(width: 4),
                CircleAvatar(
                  backgroundColor: Colors.black38,
                  child: IconButton(
                    icon: const Icon(Icons.text_increase_rounded,
                        color: Colors.white),
                    onPressed: () {
                      if (fontSize < 26) setState(() => fontSize += 2);
                    },
                  ),
                ),
                const SizedBox(width: 12),
              ],
              flexibleSpace: FlexibleSpaceBar(
                titlePadding:
                const EdgeInsets.only(left: 16, bottom: 16, right: 60),
                title: Text(
                  widget.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: kNovenaFontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      widget.novenaImage,
                      fit: BoxFit.cover,
                      // THE FIX: bias the crop toward the top of the source
                      // image instead of center-cropping. Center-crop on a
                      // portrait where the face sits in the upper third of
                      // the frame is what was slicing through the head.
                      alignment: Alignment.topCenter,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: theme.colorScheme.primaryContainer,
                        child: Icon(Icons.church_rounded,
                            size: 64, color: primaryAccent),
                      ),
                    ),
                    // Full-height gradient rather than a bottom-only one —
                    // softly darkens the top too so the leading/action
                    // icons stay legible over bright image regions, not
                    // just relying on their individual translucent circles.
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.35),
                            Colors.black.withValues(alpha: 0.05),
                            Colors.black.withValues(alpha: 0.3),
                            Colors.black.withValues(alpha: 0.8),
                          ],
                          stops: const [0.0, 0.25, 0.6, 1.0],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ── NOVENA STORY & INTRO CARD ──
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Card(
                  elevation: 0,
                  // Single surface role, no isDark branch — matches the
                  // intention card below and lets ColorScheme's own dark
                  // variant do its job.
                  color: theme.colorScheme.surfaceContainer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      color: primaryAccent.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'DEVOTIONAL OVERVIEW',
                          style: TextStyle(
                            fontFamily: kNovenaFontFamily,
                            color: primaryAccent,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.storyText ??
                              "A novena is a traditional Catholic devotion consisting of private or public prayers repeated for nine successive days.",
                          style: TextStyle(
                            fontFamily: kNovenaFontFamily,
                            fontSize: 14,
                            height: 1.5,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // ── DAY SELECTOR CHIPS + PROGRESS ──
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  children: [
                    _DaySelectorHeader(
                      scrollController: dayScrollController,
                      currentDay: currentDay,
                      completedDays: completedDays,
                      primaryAccent: primaryAccent,
                      textBodyColor: theme.colorScheme.onSurface,
                      chipKeys: _dayChipKeys,
                      onDaySelected: (dayNum) {
                        HapticFeedback.selectionClick();
                        setState(() => currentDay = dayNum);
                        _scrollToActiveDay();
                      },
                    ),
                    const SizedBox(height: 10),
                    // Slim overall-progress indicator — an at-a-glance
                    // sense of how far along the novena is, beyond just
                    // per-chip checkmarks.
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: completedDays.length / 9,
                          minHeight: 4,
                          backgroundColor:
                          theme.colorScheme.surfaceContainerHighest,
                          valueColor:
                          AlwaysStoppedAnimation<Color>(primaryAccent),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ── PRAYER CONTENT BODY ──
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _PersonalIntentionCard(
                    controller: intentionController,
                    primaryAccent: primaryAccent,
                    textBodyColor: theme.colorScheme.onSurface,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        width: 3,
                        height: 14,
                        color: primaryAccent,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'DAY $currentDay INTENTION',
                        style: TextStyle(
                          fontFamily: kNovenaFontFamily,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: primaryAccent,
                          letterSpacing: 2.2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    activeDayData.theme,
                    style: TextStyle(
                      fontFamily: kNovenaFontFamily,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildDropCapBody(
                    activeDayData.prayer,
                    theme.colorScheme.onSurface,
                    primaryAccent,
                    fontSize,
                  ),
                  const SizedBox(height: 28),
                  Center(
                    child: Text(
                      '✦  Amen  ✦',
                      style: TextStyle(
                        fontFamily: kNovenaFontFamily,
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        color: primaryAccent.withValues(alpha: 0.8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryAccent,
                        foregroundColor: theme.colorScheme.onPrimary,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: _completeCurrentDay,
                      icon: const Icon(Icons.check_circle_rounded),
                      label: Text(
                        currentDay == 9
                            ? "Finish Novena & Complete"
                            : "Complete Day $currentDay & Continue",
                        style: const TextStyle(
                          fontFamily: kNovenaFontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropCapBody(
      String text,
      Color textBodyColor,
      Color dropColor,
      double bodyFontSize,
      ) {
    final trimmedText = text.trim();
    if (trimmedText.isEmpty) return const SizedBox.shrink();

    final dropLetter = trimmedText[0];
    final remainder = trimmedText.substring(1);

    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: Text(
                dropLetter,
                style: TextStyle(
                  fontFamily: kNovenaFontFamily,
                  fontSize: bodyFontSize * 3.2,
                  fontWeight: FontWeight.bold,
                  color: dropColor,
                  height: 0.85,
                  letterSpacing: -2,
                ),
              ),
            ),
          ),
          TextSpan(
            text: remainder,
            style: TextStyle(
              fontFamily: kNovenaFontFamily,
              fontSize: bodyFontSize,
              color: textBodyColor,
              height: 1.6,
              letterSpacing: 0.15,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.left,
    );
  }
}

// ── AUXILIARY COMPONENTS ─────────────────────────────────────────────────────

class _DaySelectorHeader extends StatelessWidget {
  final ScrollController scrollController;
  final int currentDay;
  final Set<int> completedDays;
  final Color primaryAccent;
  final Color textBodyColor;
  final Map<int, GlobalKey> chipKeys;
  final ValueChanged<int> onDaySelected;

  const _DaySelectorHeader({
    required this.scrollController,
    required this.currentDay,
    required this.completedDays,
    required this.primaryAccent,
    required this.textBodyColor,
    required this.chipKeys,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 40,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 9,
        itemBuilder: (context, index) {
          final dayNum = index + 1;
          final isSelected = dayNum == currentDay;
          final isDone = completedDays.contains(dayNum);

          return Padding(
            key: chipKeys[dayNum],
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              showCheckmark: false,
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isDone) ...[
                    Icon(
                      Icons.check_circle_rounded,
                      size: 14,
                      color: isSelected
                          ? theme.colorScheme.onPrimary
                          : primaryAccent,
                    ),
                    const SizedBox(width: 4),
                  ],
                  Text(
                    'Day $dayNum',
                    style: TextStyle(
                      fontFamily: kNovenaFontFamily,
                      fontSize: 13,
                      fontWeight:
                      isSelected ? FontWeight.bold : FontWeight.w500,
                      color: isSelected
                          ? theme.colorScheme.onPrimary
                          : textBodyColor,
                    ),
                  ),
                ],
              ),
              selected: isSelected,
              selectedColor: primaryAccent,
              backgroundColor: theme.colorScheme.surfaceContainer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: isSelected
                      ? primaryAccent
                      : primaryAccent.withValues(alpha: 0.25),
                ),
              ),
              onSelected: (_) => onDaySelected(dayNum),
            ),
          );
        },
      ),
    );
  }
}

class _PersonalIntentionCard extends StatelessWidget {
  final TextEditingController controller;
  final Color primaryAccent;
  final Color textBodyColor;

  const _PersonalIntentionCard({
    required this.controller,
    required this.primaryAccent,
    required this.textBodyColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      color: theme.colorScheme.surfaceContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: primaryAccent.withValues(alpha: 0.3),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.edit_note_rounded, color: primaryAccent, size: 20),
                const SizedBox(width: 8),
                Text(
                  "My Personal Intention",
                  style: TextStyle(
                    fontFamily: kNovenaFontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: primaryAccent,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            TextField(
              controller: controller,
              maxLines: 2,
              style: TextStyle(
                fontFamily: kNovenaFontFamily,
                fontSize: 14,
                color: textBodyColor,
              ),
              decoration: InputDecoration(
                hintText: "State your prayer intention...",
                hintStyle: TextStyle(
                  fontFamily: kNovenaFontFamily,
                  fontSize: 13,
                  color: textBodyColor.withValues(alpha: 0.45),
                ),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}