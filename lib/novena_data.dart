import 'package:operation_001/novena_detail_screen.dart';

List<NovenaDayContent> getNovenaDaysForTitle(String title) {
  return NovenaData.getDaysForTitle(title);
}

String getNovenaStoryForTitle(String title) {
  return NovenaData.getStoryForTitle(title);
}

class NovenaData {
  NovenaData._();

  static String getStoryForTitle(String title) {
    final lowerTitle = title.toLowerCase();

    if (lowerTitle.contains("divine mercy")) {
      return divineMercyStory;
    } else if (lowerTitle.contains("sacred heart")) {
      return sacredHeartStory;
    } else if (lowerTitle.contains("michael") || lowerTitle.contains("archangel")) {
      return archangelMichaelStory;
    } else if (lowerTitle.contains("trinity") || lowerTitle.contains("holy trinity")) {
      return holyTrinityStory;
    } else if (lowerTitle.contains("pentecost") || lowerTitle.contains("holy spirit")) {
      return pentecostStory;
    }

    return "Jesus asked for novenas of prayer to prepare our hearts to receive His abundant graces, divine mercy, and protection.";
  }

  static List<NovenaDayContent> getDaysForTitle(String title) {
    final cleanTitle = title.toLowerCase().trim();

    // 1. Direct exact key match
    if (masterNovenaDB.containsKey(title)) {
      return masterNovenaDB[title]!;
    }

    // 2. Case-insensitive & partial key match across DB
    for (final entry in masterNovenaDB.entries) {
      final dbKey = entry.key.toLowerCase();
      if (cleanTitle.contains(dbKey) || dbKey.contains(cleanTitle)) {
        return entry.value;
      }
    }

    // 3. Fallback Alias Keyword Matching
    if (cleanTitle.contains("sacred heart")) {
      return masterNovenaDB["Novena to the Sacred Heart of Jesus"]!;
    } else if (cleanTitle.contains("divine mercy")) {
      return masterNovenaDB["Divine Mercy Chaplet"]!;
    } else if (cleanTitle.contains("michael") || cleanTitle.contains("archangel")) {
      return masterNovenaDB["Archangel Michael"] ?? masterNovenaDB["Arch Angel Michael"]!;
    } else if (cleanTitle.contains("trinity") || cleanTitle.contains("holy trinity")) {
      return masterNovenaDB["Holy Trinity"]!;
    } else if (cleanTitle.contains("pentecost") || cleanTitle.contains("holy spirit")) {
      return masterNovenaDB["Pentecost Novena"] ?? masterNovenaDB["Holy Spirit Novena"]!;
    }

    // 4. Ultimate Fallback
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
      'Jesus asked that the Feast of the Divine Mercy be preceded by a Novena to the Divine Mercy which would begin on Good Friday. He gave St. Faustina an intention to pray for on each day of the Novena, saving for the last day the most difficult intention of all, the lukewarm and indifferent of whom He said:\n\n'
      '"These souls cause Me more suffering than any others; it was from such souls that My soul felt the most revulsion in the Garden of Olives. It was on their account that I said: \'My Father, if it is possible, let this cup pass Me by.\' The last hope of salvation for them is to flee to My Mercy."\n\n'
      'In her diary, St. Faustina wrote that Jesus told her:\n\n'
      '"On each day of the novena you will bring to My heart a different group of souls and you will immerse them in this ocean of My mercy ... On each day you will beg My Father, on the strength of My passion, for the graces for these souls."';

  static const String sacredHeartStory =
      '"Do not let the past disturb you – just leave everything in the Sacred Heart and begin again with joy." — St. Mother Teresa\n\n'
      'The devotion to the Sacred Heart of Jesus was inspired by Jesus’ apparitions to St. Margaret Mary Alacoque. '
      'This prayer, known as the Efficacious Novena, was prayed daily by St. Padre Pio for all who requested his intercession. '
      'Through these 9 days, we place our petitions in Christ’s infinite ocean of mercy and unite our hearts to His divine love.';

  static const String archangelMichaelStory = '''
St. Michael the Archangel is one of the seven archangels who stand before God and is known as the leader of the heavenly hosts. In Scripture, he appears as the defender of God’s people and the one who casts Satan and the fallen angels out of heaven (Revelation 12:7–9). He is also mentioned in the Book of Daniel as the protector of Israel and in the Letter of Jude as contending with the devil.

The name Michael comes from the Hebrew (מִיכָאֵל), which means: “Who is like God?”

The Church venerates St. Michael as a powerful protector against evil, a guardian of the faithful, and a guide for souls at the hour of death. His feast day, shared with Sts. Gabriel and Raphael, is celebrated on September 29.
''';

  static const String holyTrinityStory = '''
The Holy Trinity Novena is a profound Catholic devotion dedicated to praising the central mystery of Christian faith and life: the mystery of the Most Holy Trinity—God the Father, God the Son, and God the Holy Spirit.

While distinct in Persons, the Triune God is one in substance and love. Through this novena, believers honor the Father as Creator, the Son as Redeemer, and the Holy Spirit as Sanctifier. It is traditionally prayed ahead of Trinity Sunday—celebrated on the first Sunday after Pentecost—or at any time throughout the year when seeking spiritual renewal, deep divine protection, and growth in holiness.

By lifting our petitions to the three adorable Persons of the Holy Trinity, we align our earthly journey with the eternal love and communion that exists within God Himself.
''';

  static const String pentecostStory = '''
The Holy Spirit Novena, also known as the Pentecost Novena, is considered the oldest of all novenas. It draws its origins from Jesus commanding His apostles to remain in Jerusalem and wait for the promise of the Father: "for John baptized with water, but in a few days you will be baptized with the Holy Spirit" (Acts 1:4-5).

Traditionally prayed during the nine days between Ascension Thursday and Pentecost Sunday, this novena reflects the apostles and Mary gathering in prayer in the Upper Room. In 1979, St. John Paul II encouraged the faithful to persevere in this ten-day liturgical rhythm between Ascension and Pentecost. 

The catechism highlights the Seven Gifts of the Holy Spirit (rooted in Isaiah 11:2-3 and 1 Corinthians 12:4-11): Wisdom, Understanding, Counsel, Fortitude, Knowledge, Piety, and Fear of the Lord. Each day of this novena focuses on asking the Holy Spirit to awaken and deepen these divine gifts within our souls.
''';

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
    "Arch Angel Michael": [
      const NovenaDayContent(
        dayNumber: 1,
        theme: "Day 1 – Defender Against Evil",
        prayer:
        'In the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n'
            'O glorious Prince, St. Michael the Archangel, chief and commander of the heavenly hosts, guardian of souls, vanquisher of rebel spirits, servant in the house of the Divine King, and our admirable protector, you who shine with excellence and superhuman virtue, deliver us from all evil. We turn to you with confidence, and we ask that through your gracious protection we may serve God ever more faithfully each day.\n\n'
            'Pray for us, O glorious St. Michael, Prince of the Church of Jesus Christ, that we may be made worthy of His promises.\n\n'
            '(Mention your request here…)\n\n'
            'Almighty and Everlasting God, who, by a wondrous act of goodness and in Your merciful desire for the salvation of all people, appointed the most glorious Archangel St. Michael as Prince of Your Church, grant, we pray, that we may be delivered from all our enemies. May none of them trouble us at the hour of our death, but may St. Michael lead us safely into Your presence.\n\n'
            'We ask this through the merits of Jesus Christ our Lord. Amen.\n\n'
            'Prayer to St. Michael:\n'
            'St. Michael the Archangel, defend us in battle. Be our protection against the wickedness and snares of the devil. May God rebuke him, we humbly pray; and do thou, O Prince of the heavenly hosts, by the power of God, cast into hell Satan and all the evil spirits who prowl throughout the world seeking the ruin of souls. Amen.\n\n'
            '• Our Father... • Hail Mary... • Glory be...',
      ),
      const NovenaDayContent(
        dayNumber: 2,
        theme: "Day 2 – Guardian of the Faithful",
        prayer:
        'In the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n'
            'O glorious Prince, St. Michael the Archangel, chief and commander of the heavenly hosts, guardian of souls, vanquisher of rebel spirits, servant in the house of the Divine King, and our admirable protector, you who shine with excellence and superhuman virtue, deliver us from all evil. We turn to you with confidence, and we ask that through your gracious protection we may serve God ever more faithfully each day.\n\n'
            'Pray for us, O glorious St. Michael, Prince of the Church of Jesus Christ, that we may be made worthy of His promises.\n\n'
            '(Mention your request here…)\n\n'
            'Almighty and Everlasting God, who, by a wondrous act of goodness and in Your merciful desire for the salvation of all people, appointed the most glorious Archangel St. Michael as Prince of Your Church, grant, we pray, that we may be delivered from all our enemies. May none of them trouble us at the hour of our death, but may St. Michael lead us safely into Your presence.\n\n'
            'We ask this through the merits of Jesus Christ our Lord. Amen.\n\n'
            'Prayer to St. Michael:\n'
            'St. Michael the Archangel, defend us in battle. Be our protection against the wickedness and snares of the devil. May God rebuke him, we humbly pray; and do thou, O Prince of the heavenly hosts, by the power of God, cast into hell Satan and all the evil spirits who prowl throughout the world seeking the ruin of souls. Amen.\n\n'
            '• Our Father... • Hail Mary... • Glory be...',
      ),
      const NovenaDayContent(
        dayNumber: 3,
        theme: "Day 3 – Champion of the Heavenly Host",
        prayer:
        'In the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n'
            'O glorious Prince, St. Michael the Archangel, chief and commander of the heavenly hosts, guardian of souls, vanquisher of rebel spirits, servant in the house of the Divine King, and our admirable protector, you who shine with excellence and superhuman virtue, deliver us from all evil. We turn to you with confidence, and we ask that through your gracious protection we may serve God ever more faithfully each day.\n\n'
            'Pray for us, O glorious St. Michael, Prince of the Church of Jesus Christ, that we may be made worthy of His promises.\n\n'
            '(Mention your request here…)\n\n'
            'Almighty and Everlasting God, who, by a wondrous act of goodness and in Your merciful desire for the salvation of all people, appointed the most glorious Archangel St. Michael as Prince of Your Church, grant, we pray, that we may be delivered from all our enemies. May none of them trouble us at the hour of our death, but may St. Michael lead us safely into Your presence.\n\n'
            'We ask this through the merits of Jesus Christ our Lord. Amen.\n\n'
            'Prayer to St. Michael:\n'
            'St. Michael the Archangel, defend us in battle. Be our protection against the wickedness and snares of the devil. May God rebuke him, we humbly pray; and do thou, O Prince of the heavenly hosts, by the power of God, cast into hell Satan and all the evil spirits who prowl throughout the world seeking the ruin of souls. Amen.\n\n'
            '• Our Father... • Hail Mary... • Glory be...',
      ),
      const NovenaDayContent(
        dayNumber: 4,
        theme: "Day 4 – Protector of the Church",
        prayer:
        'In the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n'
            'O glorious Prince, St. Michael the Archangel, chief and commander of the heavenly hosts, guardian of souls, vanquisher of rebel spirits, servant in the house of the Divine King, and our admirable protector, you who shine with excellence and superhuman virtue, deliver us from all evil. We turn to you with confidence, and we ask that through your gracious protection we may serve God ever more faithfully each day.\n\n'
            'Pray for us, O glorious St. Michael, Prince of the Church of Jesus Christ, that we may be made worthy of His promises.\n\n'
            '(Mention your request here…)\n\n'
            'Almighty and Everlasting God, who, by a wondrous act of goodness and in Your merciful desire for the salvation of all people, appointed the most glorious Archangel St. Michael as Prince of Your Church, grant, we pray, that we may be delivered from all our enemies. May none of them trouble us at the hour of our death, but may St. Michael lead us safely into Your presence.\n\n'
            'We ask this through the merits of Jesus Christ our Lord. Amen.\n\n'
            'Prayer to St. Michael:\n'
            'St. Michael the Archangel, defend us in battle. Be our protection against the wickedness and snares of the devil. May God rebuke him, we humbly pray; and do thou, O Prince of the heavenly hosts, by the power of God, cast into hell Satan and all the evil spirits who prowl throughout the world seeking the ruin of souls. Amen.\n\n'
            '• Our Father... • Hail Mary... • Glory be...',
      ),
      const NovenaDayContent(
        dayNumber: 5,
        theme: "Day 5 – Shield Against Temptation",
        prayer:
        'In the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n'
            'O glorious Prince, St. Michael the Archangel, chief and commander of the heavenly hosts, guardian of souls, vanquisher of rebel spirits, servant in the house of the Divine King, and our admirable protector, you who shine with excellence and superhuman virtue, deliver us from all evil. We turn to you with confidence, and we ask that through your gracious protection we may serve God ever more faithfully each day.\n\n'
            'Pray for us, O glorious St. Michael, Prince of the Church of Jesus Christ, that we may be made worthy of His promises.\n\n'
            '(Mention your request here…)\n\n'
            'Almighty and Everlasting God, who, by a wondrous act of goodness and in Your merciful desire for the salvation of all people, appointed the most glorious Archangel St. Michael as Prince of Your Church, grant, we pray, that we may be delivered from all our enemies. May none of them trouble us at the hour of our death, but may St. Michael lead us safely into Your presence.\n\n'
            'We ask this through the merits of Jesus Christ our Lord. Amen.\n\n'
            'Prayer to St. Michael:\n'
            'St. Michael the Archangel, defend us in battle. Be our protection against the wickedness and snares of the devil. May God rebuke him, we humbly pray; and do thou, O Prince of the heavenly hosts, by the power of God, cast into hell Satan and all the evil spirits who prowl throughout the world seeking the ruin of souls. Amen.\n\n'
            '• Our Father... • Hail Mary... • Glory be...',
      ),
      const NovenaDayContent(
        dayNumber: 6,
        theme: "Day 6 – Strength in Spiritual Warfare",
        prayer:
        'In the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n'
            'O glorious Prince, St. Michael the Archangel, chief and commander of the heavenly hosts, guardian of souls, vanquisher of rebel spirits, servant in the house of the Divine King, and our admirable protector, you who shine with excellence and superhuman virtue, deliver us from all evil. We turn to you with confidence, and we ask that through your gracious protection we may serve God ever more faithfully each day.\n\n'
            'Pray for us, O glorious St. Michael, Prince of the Church of Jesus Christ, that we may be made worthy of His promises.\n\n'
            '(Mention your request here…)\n\n'
            'Almighty and Everlasting God, who, by a wondrous act of goodness and in Your merciful desire for the salvation of all people, appointed the most glorious Archangel St. Michael as Prince of Your Church, grant, we pray, that we may be delivered from all our enemies. May none of them trouble us at the hour of our death, but may St. Michael lead us safely into Your presence.\n\n'
            'We ask this through the merits of Jesus Christ our Lord. Amen.\n\n'
            'Prayer to St. Michael:\n'
            'St. Michael the Archangel, defend us in battle. Be our protection against the wickedness and snares of the devil. May God rebuke him, we humbly pray; and do thou, O Prince of the heavenly hosts, by the power of God, cast into hell Satan and all the evil spirits who prowl throughout the world seeking the ruin of souls. Amen.\n\n'
            '• Our Father... • Hail Mary... • Glory be...',
      ),
      const NovenaDayContent(
        dayNumber: 7,
        theme: "Day 7 – Consoler of the Afflicted",
        prayer:
        'In the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n'
            'O glorious Prince, St. Michael the Archangel, chief and commander of the heavenly hosts, guardian of souls, vanquisher of rebel spirits, servant in the house of the Divine King, and our admirable protector, you who shine with excellence and superhuman virtue, deliver us from all evil. We turn to you with confidence, and we ask that through your gracious protection we may serve God ever more faithfully each day.\n\n'
            'Pray for us, O glorious St. Michael, Prince of the Church of Jesus Christ, that we may be made worthy of His promises.\n\n'
            '(Mention your request here…)\n\n'
            'Almighty and Everlasting God, who, by a wondrous act of goodness and in Your merciful desire for the salvation of all people, appointed the most glorious Archangel St. Michael as Prince of Your Church, grant, we pray, that we may be delivered from all our enemies. May none of them trouble us at the hour of our death, but may St. Michael lead us safely into Your presence.\n\n'
            'We ask this through the merits of Jesus Christ our Lord. Amen.\n\n'
            'Prayer to St. Michael:\n'
            'St. Michael the Archangel, defend us in battle. Be our protection against the wickedness and snares of the devil. May God rebuke him, we humbly pray; and do thou, O Prince of the heavenly hosts, by the power of God, cast into hell Satan and all the evil spirits who prowl throughout the world seeking the ruin of souls. Amen.\n\n'
            '• Our Father... • Hail Mary... • Glory be...',
      ),
      const NovenaDayContent(
        dayNumber: 8,
        theme: "Day 8 – Escort of Souls to Eternal Life",
        prayer:
        'In the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n'
            'O glorious Prince, St. Michael the Archangel, chief and commander of the heavenly hosts, guardian of souls, vanquisher of rebel spirits, servant in the house of the Divine King, and our admirable protector, you who shine with excellence and superhuman virtue, deliver us from all evil. We turn to you with confidence, and we ask that through your gracious protection we may serve God ever more faithfully each day.\n\n'
            'Pray for us, O glorious St. Michael, Prince of the Church of Jesus Christ, that we may be made worthy of His promises.\n\n'
            '(Mention your request here…)\n\n'
            'Almighty and Everlasting God, who, by a wondrous act of goodness and in Your merciful desire for the salvation of all people, appointed the most glorious Archangel St. Michael as Prince of Your Church, grant, we pray, that we may be delivered from all our enemies. May none of them trouble us at the hour of our death, but may St. Michael lead us safely into Your presence.\n\n'
            'We ask this through the merits of Jesus Christ our Lord. Amen.\n\n'
            'Prayer to St. Michael:\n'
            'St. Michael the Archangel, defend us in battle. Be our protection against the wickedness and snares of the devil. May God rebuke him, we humbly pray; and do thou, O Prince of the heavenly hosts, by the power of God, cast into hell Satan and all the evil spirits who prowl throughout the world seeking the ruin of souls. Amen.\n\n'
            '• Our Father... • Hail Mary... • Glory be...',
      ),
      const NovenaDayContent(
        dayNumber: 9,
        theme: "Day 9 – Prince of Heavenly Glory",
        prayer:
        'In the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n'
            'O glorious Prince, St. Michael the Archangel, chief and commander of the heavenly hosts, guardian of souls, vanquisher of rebel spirits, servant in the house of the Divine King, and our admirable protector, you who shine with excellence and superhuman virtue, deliver us from all evil. We turn to you with confidence, and we ask that through your gracious protection we may serve God ever more faithfully each day.\n\n'
            'Pray for us, O glorious St. Michael, Prince of the Church of Jesus Christ, that we may be made worthy of His promises.\n\n'
            '(Mention your request here…)\n\n'
            'Almighty and Everlasting God, who, by a wondrous act of goodness and in Your merciful desire for the salvation of all people, appointed the most glorious Archangel St. Michael as Prince of Your Church, grant, we pray, that we may be delivered from all our enemies. May none of them trouble us at the hour of our death, but may St. Michael lead us safely into Your presence.\n\n'
            'We ask this through the merits of Jesus Christ our Lord. Amen.\n\n'
            'Prayer to St. Michael:\n'
            'St. Michael the Archangel, defend us in battle. Be our protection against the wickedness and snares of the devil. May God rebuke him, we humbly pray; and do thou, O Prince of the heavenly hosts, by the power of God, cast into hell Satan and all the evil spirits who prowl throughout the world seeking the ruin of souls. Amen.\n\n'
            '• Our Father... • Hail Mary... • Glory be...',
      ),
    ],
    "Holy Trinity": [
      const NovenaDayContent(
        dayNumber: 1,
        theme: "Day 1 – Divine Creation & Image of God",
        prayer:
        'Let us begin, in the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n'
            'Glory be to the Father, who by His almighty power and love created me, making me in the image and likeness of God.\n\n'
            'Glory be to the Son, who by His Precious Blood delivered me from hell and opened for me the gates of heaven.\n\n'
            'Glory be to the Holy Spirit, who has sanctified me in the Sacrament of Baptism and continues to sanctify me by the graces I receive daily from His bounty.\n\n'
            'Glory be to the three adorable Persons of the Holy Trinity, now and forever. Amen.\n\n'
            '(Mention your request here…)\n\n'
            'Say 1: Our Father…\n'
            'Say 1: Hail Mary…\n'
            'Say 1: Glory Be…',
      ),
      const NovenaDayContent(
        dayNumber: 2,
        theme: "Day 2 – Thanksgiving for Salvation",
        prayer:
        'Let us begin, in the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n'
            'Glory be to the Father, who by His almighty power and love created me, making me in the image and likeness of God.\n\n'
            'Glory be to the Son, who by His Precious Blood delivered me from hell and opened for me the gates of heaven.\n\n'
            'Glory be to the Holy Spirit, who has sanctified me in the Sacrament of Baptism and continues to sanctify me by the graces I receive daily from His bounty.\n\n'
            'Glory be to the three adorable Persons of the Holy Trinity, now and forever. Amen.\n\n'
            '(Mention your request here…)\n\n'
            'Say 1: Our Father…\n'
            'Say 1: Hail Mary…\n'
            'Say 1: Glory Be…',
      ),
      const NovenaDayContent(
        dayNumber: 3,
        theme: "Day 3 – Grace & Spiritual Renewal",
        prayer:
        'Let us begin, in the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n'
            'Glory be to the Father, who by His almighty power and love created me, making me in the image and likeness of God.\n\n'
            'Glory be to the Son, who by His Precious Blood delivered me from hell and opened for me the gates of heaven.\n\n'
            'Glory be to the Holy Spirit, who has sanctified me in the Sacrament of Baptism and continues to sanctify me by the graces I receive daily from His bounty.\n\n'
            'Glory be to the three adorable Persons of the Holy Trinity, now and forever. Amen.\n\n'
            '(Mention your request here…)\n\n'
            'Say 1: Our Father…\n'
            'Say 1: Hail Mary…\n'
            'Say 1: Glory Be…',
      ),
      const NovenaDayContent(
        dayNumber: 4,
        theme: "Day 4 – Divine Protection & Strength",
        prayer:
        'Let us begin, in the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n'
            'Glory be to the Father, who by His almighty power and love created me, making me in the image and likeness of God.\n\n'
            'Glory be to the Son, who by His Precious Blood delivered me from hell and opened for me the gates of heaven.\n\n'
            'Glory be to the Holy Spirit, who has sanctified me in the Sacrament of Baptism and continues to sanctify me by the graces I receive daily from His bounty.\n\n'
            'Glory be to the three adorable Persons of the Holy Trinity, now and forever. Amen.\n\n'
            '(Mention your request here…)\n\n'
            'Say 1: Our Father…\n'
            'Say 1: Hail Mary…\n'
            'Say 1: Glory Be…',
      ),
      const NovenaDayContent(
        dayNumber: 5,
        theme: "Day 5 – Sanctification of the Soul",
        prayer:
        'Let us begin, in the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n'
            'Glory be to the Father, who by His almighty power and love created me, making me in the image and likeness of God.\n\n'
            'Glory be to the Son, who by His Precious Blood delivered me from hell and opened for me the gates of heaven.\n\n'
            'Glory be to the Holy Spirit, who has sanctified me in the Sacrament of Baptism and continues to sanctify me by the graces I receive daily from His bounty.\n\n'
            'Glory be to the three adorable Persons of the Holy Trinity, now and forever. Amen.\n\n'
            '(Mention your request here…)\n\n'
            'Say 1: Our Father…\n'
            'Say 1: Hail Mary…\n'
            'Say 1: Glory Be…',
      ),
      const NovenaDayContent(
        dayNumber: 6,
        theme: "Day 6 – Deep Relationship with God",
        prayer:
        'Let us begin, in the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n'
            'Glory be to the Father, who by His almighty power and love created me, making me in the image and likeness of God.\n\n'
            'Glory be to the Son, who by His Precious Blood delivered me from hell and opened for me the gates of heaven.\n\n'
            'Glory be to the Holy Spirit, who has sanctified me in the Sacrament of Baptism and continues to sanctify me by the graces I receive daily from His bounty.\n\n'
            'Glory be to the three adorable Persons of the Holy Trinity, now and forever. Amen.\n\n'
            '(Mention your request here…)\n\n'
            'Say 1: Our Father…\n'
            'Say 1: Hail Mary…\n'
            'Say 1: Glory Be…',
      ),
      const NovenaDayContent(
        dayNumber: 7,
        theme: "Day 7 – Trust in Divine Providence",
        prayer:
        'Let us begin, in the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n'
            'Glory be to the Father, who by His almighty power and love created me, making me in the image and likeness of God.\n\n'
            'Glory be to the Son, who by His Precious Blood delivered me from hell and opened for me the gates of heaven.\n\n'
            'Glory be to the Holy Spirit, who has sanctified me in the Sacrament of Baptism and continues to sanctify me by the graces I receive daily from His bounty.\n\n'
            'Glory be to the three adorable Persons of the Holy Trinity, now and forever. Amen.\n\n'
            '(Mention your request here…)\n\n'
            'Say 1: Our Father…\n'
            'Say 1: Hail Mary…\n'
            'Say 1: Glory Be…',
      ),
      const NovenaDayContent(
        dayNumber: 8,
        theme: "Day 8 – Wisdom and Guidance",
        prayer:
        'Let us begin, in the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n'
            'Glory be to the Father, who by His almighty power and love created me, making me in the image and likeness of God.\n\n'
            'Glory be to the Son, who by His Precious Blood delivered me from hell and opened for me the gates of heaven.\n\n'
            'Glory be to the Holy Spirit, who has sanctified me in the Sacrament of Baptism and continues to sanctify me by the graces I receive daily from His bounty.\n\n'
            'Glory be to the three adorable Persons of the Holy Trinity, now and forever. Amen.\n\n'
            '(Mention your request here…)\n\n'
            'Say 1: Our Father…\n'
            'Say 1: Hail Mary…\n'
            'Say 1: Glory Be…',
      ),
      const NovenaDayContent(
        dayNumber: 9,
        theme: "Day 9 – Eternal Glory with the Triune God",
        prayer:
        'Let us begin, in the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n'
            'Glory be to the Father, who by His almighty power and love created me, making me in the image and likeness of God.\n\n'
            'Glory be to the Son, who by His Precious Blood delivered me from hell and opened for me the gates of heaven.\n\n'
            'Glory be to the Holy Spirit, who has sanctified me in the Sacrament of Baptism and continues to sanctify me by the graces I receive daily from His bounty.\n\n'
            'Glory be to the three adorable Persons of the Holy Trinity, now and forever. Amen.\n\n'
            '(Mention your request here…)\n\n'
            'Say 1: Our Father…\n'
            'Say 1: Hail Mary…\n'
            'Say 1: Glory Be…',
      ),
    ],
    "Pentecost": [
      const NovenaDayContent(
        dayNumber: 1,
        theme: "Day 1 – The Seven Gifts of the Holy Spirit",
        prayer:
        'Begin with the Sign of the Cross: In the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n'
            'Act of Consecration to the Holy Spirit:\n'
            'On my knees before the great multitude of heavenly witnesses, I offer myself, soul and body to Thee, Eternal Spirit of God. I adore the brightness of Thy purity, the unerring keenness of Thy justice, and the might of Thy love. Thou art the Strength and Light of my soul. In Thee I live and move and have my being. I desire never to grieve Thee by my unfaithfulness to grace and I pray with all my heart to be kept from the smallest sin against Thee. Make me faithful in every thought and grant that I may always listen to Thy voice, watch for Thy light, and follow Thy gracious inspirations. I cling to Thee and give myself to Thee and I ask Thee, by Thy compassion, to watch over me in my weakness. Holding the pierced Feet of Jesus, looking at His Five Wounds, trusting in His Precious Blood, and adoring his open side and stricken heart, I implore Thee, Adorable Spirit, Helper of my infirmity, so to keep me in Thy grace that I may never sin against Thee with the sin which Thou will not forgive. Give me grace, O Holy Spirit, Spirit of the Father and of the Son, to say to Thee always and everywhere, "Speak Lord for Thy servant hears." Amen.\n\n'
            'Prayer for the Seven Gifts of the Holy Spirit:\n'
            'O Lord Jesus Christ Who, before ascending into heaven did promise to send the Holy Ghost to finish Thy work in the souls of Thine Apostles and Disciples, deign to grant the same Holy Spirit to me that He may perfect in my soul, the work of Thy grace and Thy love. Grant me the Spirit of Wisdom that I may despise the perishable things of this world and aspire only after the things that are eternal, the Spirit of Understanding to enlighten my mind with the light of Thy divine truth, the Spirit of Counsel that I may ever choose the surest way of pleasing God and gaining heaven, the Spirit of Fortitude that I may bear my cross with Thee and that I may overcome with courage all the obstacles that oppose my salvation, the Spirit of Knowledge that I may know God and know myself and grow perfect in the science of the Saints, the Spirit of Piety that I may find the service of God sweet and amiable, the Spirit of Fear that I may be filled with a loving reverence towards God and may dread in any way to displease Him. Mark me, dear Lord, with the sign of Thy true disciples and animate me in all things with Thy Spirit. Amen.\n\n'
            'Say:\n'
            '1x Our Father\n'
            '1x Hail Mary\n'
            '7x Glory Be',
      ),
      const NovenaDayContent(
        dayNumber: 2,
        theme: "Day 2 – The Gift of Wisdom",
        prayer:
        'In the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n'
            'Act of Consecration to the Holy Spirit:\n'
            'On my knees before the great multitude of heavenly witnesses, I offer myself, soul and body to Thee, Eternal Spirit of God. I adore the brightness of Thy purity, the unerring keenness of Thy justice, and the might of Thy love. Thou art the Strength and Light of my soul. In Thee I live and move and have my being. I desire never to grieve Thee by my unfaithfulness to grace and I pray with all my heart to be kept from the smallest sin against Thee. Make me faithful in every thought and grant that I may always listen to Thy voice, watch for Thy light, and follow Thy gracious inspirations. I cling to Thee and give myself to Thee and I ask Thee, by Thy compassion, to watch over me in my weakness. Holding the pierced Feet of Jesus, looking at His Five Wounds, trusting in His Precious Blood, and adoring his open side and stricken heart, I implore Thee, Adorable Spirit, Helper of my infirmity, so to keep me in Thy grace that I may never sin against Thee with the sin which Thou will not forgive. Give me grace, O Holy Spirit, Spirit of the Father and of the Son, to say to Thee always and everywhere, "Speak Lord for Thy servant hears." Amen.\n\n'
            'Prayer for the Gift of Wisdom:\n'
            'O Lord Jesus Christ Who, before ascending into heaven did promise to send the Holy Ghost to finish Thy work in the souls of Thine Apostles and Disciples, deign to grant the same Holy Spirit to me that He may perfect in my soul, the work of Thy grace and Thy love. Grant me the Spirit of Wisdom that I may despise the perishable things of this world and aspire only after the things that are eternal, the Spirit of Understanding to enlighten my mind with the light of Thy divine truth, the Spirit of Counsel that I may ever choose the surest way of pleasing God and gaining heaven, the Spirit of Fortitude that I may bear my cross with Thee and that I may overcome with courage all the obstacles that oppose my salvation, the Spirit of Knowledge that I may know God and know myself and grow perfect in the science of the Saints, the Spirit of Piety that I may find the service of God sweet and amiable, the Spirit of Fear that I may be filled with a loving reverence towards God and may dread in any way to displease Him. Mark me, dear Lord, with the sign of Thy true disciples and animate me in all things with Thy Spirit. Amen.\n\n'
            'Say:\n'
            '1x Our Father\n'
            '1x Hail Mary\n'
            '7x Glory Be',
      ),
      const NovenaDayContent(
        dayNumber: 3,
        theme: "Day 3 – The Gift of Understanding",
        prayer:
        'In the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n'
            'Act of Consecration to the Holy Spirit:\n'
            'On my knees before the great multitude of heavenly witnesses, I offer myself, soul and body to Thee, Eternal Spirit of God. I adore the brightness of Thy purity, the unerring keenness of Thy justice, and the might of Thy love. Thou art the Strength and Light of my soul. In Thee I live and move and have my being. I desire never to grieve Thee by my unfaithfulness to grace and I pray with all my heart to be kept from the smallest sin against Thee. Make me faithful in every thought and grant that I may always listen to Thy voice, watch for Thy light, and follow Thy gracious inspirations. I cling to Thee and give myself to Thee and I ask Thee, by Thy compassion, to watch over me in my weakness. Holding the pierced Feet of Jesus, looking at His Five Wounds, trusting in His Precious Blood, and adoring his open side and stricken heart, I implore Thee, Adorable Spirit, Helper of my infirmity, so to keep me in Thy grace that I may never sin against Thee with the sin which Thou will not forgive. Give me grace, O Holy Spirit, Spirit of the Father and of the Son, to say to Thee always and everywhere, "Speak Lord for Thy servant hears." Amen.\n\n'
            'Prayer for the Gift of Understanding:\n'
            'O Lord Jesus Christ Who, before ascending into heaven did promise to send the Holy Ghost to finish Thy work in the souls of Thine Apostles and Disciples, deign to grant the same Holy Spirit to me that He may perfect in my soul, the work of Thy grace and Thy love. Grant me the Spirit of Wisdom that I may despise the perishable things of this world and aspire only after the things that are eternal, the Spirit of Understanding to enlighten my mind with the light of Thy divine truth, the Spirit of Counsel that I may ever choose the surest way of pleasing God and gaining heaven, the Spirit of Fortitude that I may bear my cross with Thee and that I may overcome with courage all the obstacles that oppose my salvation, the Spirit of Knowledge that I may know God and know myself and grow perfect in the science of the Saints, the Spirit of Piety that I may find the service of God sweet and amiable, the Spirit of Fear that I may be filled with a loving reverence towards God and may dread in any way to displease Him. Mark me, dear Lord, with the sign of Thy true disciples and animate me in all things with Thy Spirit. Amen.\n\n'
            'Say:\n'
            '1x Our Father\n'
            '1x Hail Mary\n'
            '7x Glory Be',
      ),
      const NovenaDayContent(
        dayNumber: 4,
        theme: "Day 4 – The Gift of Counsel",
        prayer:
        'In the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n'
            'Act of Consecration to the Holy Spirit:\n'
            'On my knees before the great multitude of heavenly witnesses, I offer myself, soul and body to Thee, Eternal Spirit of God. I adore the brightness of Thy purity, the unerring keenness of Thy justice, and the might of Thy love. Thou art the Strength and Light of my soul. In Thee I live and move and have my being. I desire never to grieve Thee by my unfaithfulness to grace and I pray with all my heart to be kept from the smallest sin against Thee. Make me faithful in every thought and grant that I may always listen to Thy voice, watch for Thy light, and follow Thy gracious inspirations. I cling to Thee and give myself to Thee and I ask Thee, by Thy compassion, to watch over me in my weakness. Holding the pierced Feet of Jesus, looking at His Five Wounds, trusting in His Precious Blood, and adoring his open side and stricken heart, I implore Thee, Adorable Spirit, Helper of my infirmity, so to keep me in Thy grace that I may never sin against Thee with the sin which Thou will not forgive. Give me grace, O Holy Spirit, Spirit of the Father and of the Son, to say to Thee always and everywhere, "Speak Lord for Thy servant hears." Amen.\n\n'
            'Prayer for the Gift of Counsel:\n'
            'O Lord Jesus Christ Who, before ascending into heaven did promise to send the Holy Ghost to finish Thy work in the souls of Thine Apostles and Disciples, deign to grant the same Holy Spirit to me that He may perfect in my soul, the work of Thy grace and Thy love. Grant me the Spirit of Wisdom that I may despise the perishable things of this world and aspire only after the things that are eternal, the Spirit of Understanding to enlighten my mind with the light of Thy divine truth, the Spirit of Counsel that I may ever choose the surest way of pleasing God and gaining heaven, the Spirit of Fortitude that I may bear my cross with Thee and that I may overcome with courage all the obstacles that oppose my salvation, the Spirit of Knowledge that I may know God and know myself and grow perfect in the science of the Saints, the Spirit of Piety that I may find the service of God sweet and amiable, the Spirit of Fear that I may be filled with a loving reverence towards God and may dread in any way to displease Him. Mark me, dear Lord, with the sign of Thy true disciples and animate me in all things with Thy Spirit. Amen.\n\n'
            'Say:\n'
            '1x Our Father\n'
            '1x Hail Mary\n'
            '7x Glory Be',
      ),
      const NovenaDayContent(
        dayNumber: 5,
        theme: "Day 5 – The Gift of Fortitude",
        prayer:
        'In the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n'
            'Act of Consecration to the Holy Spirit:\n'
            'On my knees before the great multitude of heavenly witnesses, I offer myself, soul and body to Thee, Eternal Spirit of God. I adore the brightness of Thy purity, the unerring keenness of Thy justice, and the might of Thy love. Thou art the Strength and Light of my soul. In Thee I live and move and have my being. I desire never to grieve Thee by my unfaithfulness to grace and I pray with all my heart to be kept from the smallest sin against Thee. Make me faithful in every thought and grant that I may always listen to Thy voice, watch for Thy light, and follow Thy gracious inspirations. I cling to Thee and give myself to Thee and I ask Thee, by Thy compassion, to watch over me in my weakness. Holding the pierced Feet of Jesus, looking at His Five Wounds, trusting in His Precious Blood, and adoring his open side and stricken heart, I implore Thee, Adorable Spirit, Helper of my infirmity, so to keep me in Thy grace that I may never sin against Thee with the sin which Thou will not forgive. Give me grace, O Holy Spirit, Spirit of the Father and of the Son, to say to Thee always and everywhere, "Speak Lord for Thy servant hears." Amen.\n\n'
            'Prayer for the Gift of Fortitude:\n'
            'O Lord Jesus Christ Who, before ascending into heaven did promise to send the Holy Ghost to finish Thy work in the souls of Thine Apostles and Disciples, deign to grant the same Holy Spirit to me that He may perfect in my soul, the work of Thy grace and Thy love. Grant me the Spirit of Wisdom that I may despise the perishable things of this world and aspire only after the things that are eternal, the Spirit of Understanding to enlighten my mind with the light of Thy divine truth, the Spirit of Counsel that I may ever choose the surest way of pleasing God and gaining heaven, the Spirit of Fortitude that I may bear my cross with Thee and that I may overcome with courage all the obstacles that oppose my salvation, the Spirit of Knowledge that I may know God and know myself and grow perfect in the science of the Saints, the Spirit of Piety that I may find the service of God sweet and amiable, the Spirit of Fear that I may be filled with a loving reverence towards God and may dread in any way to displease Him. Mark me, dear Lord, with the sign of Thy true disciples and animate me in all things with Thy Spirit. Amen.\n\n'
            'Say:\n'
            '1x Our Father\n'
            '1x Hail Mary\n'
            '7x Glory Be',
      ),
      const NovenaDayContent(
        dayNumber: 6,
        theme: "Day 6 – The Gift of Knowledge",
        prayer:
        'In the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n'
            'Act of Consecration to the Holy Spirit:\n'
            'On my knees before the great multitude of heavenly witnesses, I offer myself, soul and body to Thee, Eternal Spirit of God. I adore the brightness of Thy purity, the unerring keenness of Thy justice, and the might of Thy love. Thou art the Strength and Light of my soul. In Thee I live and move and have my being. I desire never to grieve Thee by my unfaithfulness to grace and I pray with all my heart to be kept from the smallest sin against Thee. Make me faithful in every thought and grant that I may always listen to Thy voice, watch for Thy light, and follow Thy gracious inspirations. I cling to Thee and give myself to Thee and I ask Thee, by Thy compassion, to watch over me in my weakness. Holding the pierced Feet of Jesus, looking at His Five Wounds, trusting in His Precious Blood, and adoring his open side and stricken heart, I implore Thee, Adorable Spirit, Helper of my infirmity, so to keep me in Thy grace that I may never sin against Thee with the sin which Thou will not forgive. Give me grace, O Holy Spirit, Spirit of the Father and of the Son, to say to Thee always and everywhere, "Speak Lord for Thy servant hears." Amen.\n\n'
            'Prayer for the Gift of Knowledge:\n'
            'O Lord Jesus Christ Who, before ascending into heaven did promise to send the Holy Ghost to finish Thy work in the souls of Thine Apostles and Disciples, deign to grant the same Holy Spirit to me that He may perfect in my soul, the work of Thy grace and Thy love. Grant me the Spirit of Wisdom that I may despise the perishable things of this world and aspire only after the things that are eternal, the Spirit of Understanding to enlighten my mind with the light of Thy divine truth, the Spirit of Counsel that I may ever choose the surest way of pleasing God and gaining heaven, the Spirit of Fortitude that I may bear my cross with Thee and that I may overcome with courage all the obstacles that oppose my salvation, the Spirit of Knowledge that I may know God and know myself and grow perfect in the science of the Saints, the Spirit of Piety that I may find the service of God sweet and amiable, the Spirit of Fear that I may be filled with a loving reverence towards God and may dread in any way to displease Him. Mark me, dear Lord, with the sign of Thy true disciples and animate me in all things with Thy Spirit. Amen.\n\n'
            'Say:\n'
            '1x Our Father\n'
            '1x Hail Mary\n'
            '7x Glory Be',
      ),
      const NovenaDayContent(
        dayNumber: 7,
        theme: "Day 7 – The Gift of Piety",
        prayer:
        'In the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n'
            'Act of Consecration to the Holy Spirit:\n'
            'On my knees before the great multitude of heavenly witnesses, I offer myself, soul and body to Thee, Eternal Spirit of God. I adore the brightness of Thy purity, the unerring keenness of Thy justice, and the might of Thy love. Thou art the Strength and Light of my soul. In Thee I live and move and have my being. I desire never to grieve Thee by my unfaithfulness to grace and I pray with all my heart to be kept from the smallest sin against Thee. Make me faithful in every thought and grant that I may always listen to Thy voice, watch for Thy light, and follow Thy gracious inspirations. I cling to Thee and give myself to Thee and I ask Thee, by Thy compassion, to watch over me in my weakness. Holding the pierced Feet of Jesus, looking at His Five Wounds, trusting in His Precious Blood, and adoring his open side and stricken heart, I implore Thee, Adorable Spirit, Helper of my infirmity, so to keep me in Thy grace that I may never sin against Thee with the sin which Thou will not forgive. Give me grace, O Holy Spirit, Spirit of the Father and of the Son, to say to Thee always and everywhere, "Speak Lord for Thy servant hears." Amen.\n\n'
            'Prayer for the Gift of Piety:\n'
            'O Lord Jesus Christ Who, before ascending into heaven did promise to send the Holy Ghost to finish Thy work in the souls of Thine Apostles and Disciples, deign to grant the same Holy Spirit to me that He may perfect in my soul, the work of Thy grace and Thy love. Grant me the Spirit of Wisdom that I may despise the perishable things of this world and aspire only after the things that are eternal, the Spirit of Understanding to enlighten my mind with the light of Thy divine truth, the Spirit of Counsel that I may ever choose the surest way of pleasing God and gaining heaven, the Spirit of Fortitude that I may bear my cross with Thee and that I may overcome with courage all the obstacles that oppose my salvation, the Spirit of Knowledge that I may know God and know myself and grow perfect in the science of the Saints, the Spirit of Piety that I may find the service of God sweet and amiable, the Spirit of Fear that I may be filled with a loving reverence towards God and may dread in any way to displease Him. Mark me, dear Lord, with the sign of Thy true disciples and animate me in all things with Thy Spirit. Amen.\n\n'
            'Say:\n'
            '1x Our Father\n'
            '1x Hail Mary\n'
            '7x Glory Be',
      ),
      const NovenaDayContent(
        dayNumber: 8,
        theme: "Day 8 – The Gift of Holy Fear",
        prayer:
        'In the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n'
            'Act of Consecration to the Holy Spirit:\n'
            'On my knees before the great multitude of heavenly witnesses, I offer myself, soul and body to Thee, Eternal Spirit of God. I adore the brightness of Thy purity, the unerring keenness of Thy justice, and the might of Thy love. Thou art the Strength and Light of my soul. In Thee I live and move and have my being. I desire never to grieve Thee by my unfaithfulness to grace and I pray with all my heart to be kept from the smallest sin against Thee. Make me faithful in every thought and grant that I may always listen to Thy voice, watch for Thy light, and follow Thy gracious inspirations. I cling to Thee and give myself to Thee and I ask Thee, by Thy compassion, to watch over me in my weakness. Holding the pierced Feet of Jesus, looking at His Five Wounds, trusting in His Precious Blood, and adoring his open side and stricken heart, I implore Thee, Adorable Spirit, Helper of my infirmity, so to keep me in Thy grace that I may never sin against Thee with the sin which Thou will not forgive. Give me grace, O Holy Spirit, Spirit of the Father and of the Son, to say to Thee always and everywhere, "Speak Lord for Thy servant hears." Amen.\n\n'
            'Prayer for the Gift of Holy Fear:\n'
            'O Lord Jesus Christ Who, before ascending into heaven did promise to send the Holy Ghost to finish Thy work in the souls of Thine Apostles and Disciples, deign to grant the same Holy Spirit to me that He may perfect in my soul, the work of Thy grace and Thy love. Grant me the Spirit of Wisdom that I may despise the perishable things of this world and aspire only after the things that are eternal, the Spirit of Understanding to enlighten my mind with the light of Thy divine truth, the Spirit of Counsel that I may ever choose the surest way of pleasing God and gaining heaven, the Spirit of Fortitude that I may bear my cross with Thee and that I may overcome with courage all the obstacles that oppose my salvation, the Spirit of Knowledge that I may know God and know myself and grow perfect in the science of the Saints, the Spirit of Piety that I may find the service of God sweet and amiable, the Spirit of Fear that I may be filled with a loving reverence towards God and may dread in any way to displease Him. Mark me, dear Lord, with the sign of Thy true disciples and animate me in all things with Thy Spirit. Amen.\n\n'
            'Say:\n'
            '1x Our Father\n'
            '1x Hail Mary\n'
            '7x Glory Be',
      ),
      const NovenaDayContent(
        dayNumber: 9,
        theme: "Day 9 – All Gifts of the Holy Spirit",
        prayer:
        'In the name of the Father, and of the Son, and of the Holy Spirit. Amen.\n\n'
            'Act of Consecration to the Holy Spirit:\n'
            'On my knees before the great multitude of heavenly witnesses, I offer myself, soul and body to Thee, Eternal Spirit of God. I adore the brightness of Thy purity, the unerring keenness of Thy justice, and the might of Thy love. Thou art the Strength and Light of my soul. In Thee I live and move and have my being. I desire never to grieve Thee by my unfaithfulness to grace and I pray with all my heart to be kept from the smallest sin against Thee. Make me faithful in every thought and grant that I may always listen to Thy voice, watch for Thy light, and follow Thy gracious inspirations. I cling to Thee and give myself to Thee and I ask Thee, by Thy compassion, to watch over me in my weakness. Holding the pierced Feet of Jesus, looking at His Five Wounds, trusting in His Precious Blood, and adoring his open side and stricken heart, I implore Thee, Adorable Spirit, Helper of my infirmity, so to keep me in Thy grace that I may never sin against Thee with the sin which Thou will not forgive. Give me grace, O Holy Spirit, Spirit of the Father and of the Son, to say to Thee always and everywhere, "Speak Lord for Thy servant hears." Amen.\n\n'
            'Prayer for all the Gifts of the Holy Spirit:\n'
            'O Lord Jesus Christ Who, before ascending into heaven did promise to send the Holy Ghost to finish Thy work in the souls of Thine Apostles and Disciples, deign to grant the same Holy Spirit to me that He may perfect in my soul, the work of Thy grace and Thy love. Grant me the Spirit of Wisdom that I may despise the perishable things of this world and aspire only after the things that are eternal, the Spirit of Understanding to enlighten my mind with the light of Thy divine truth, the Spirit of Counsel that I may ever choose the surest way of pleasing God and gaining heaven, the Spirit of Fortitude that I may bear my cross with Thee and that I may overcome with courage all the obstacles that oppose my salvation, the Spirit of Knowledge that I may know God and know myself and grow perfect in the science of the Saints, the Spirit of Piety that I may find the service of God sweet and amiable, the Spirit of Fear that I may be filled with a loving reverence towards God and may dread in any way to displease Him. Mark me, dear Lord, with the sign of Thy true disciples and animate me in all things with Thy Spirit. Amen.\n\n'
            'Say:\n'
            '1x Our Father\n'
            '1x Hail Mary\n'
            '7x Glory Be',
      ),
    ],
  };
}