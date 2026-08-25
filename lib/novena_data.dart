import 'package:operation_001/novena_detail_screen.dart';

final Map<String, List<NovenaDayContent>> novenaData = {
  "Divine Mercy Chaplet": List.generate(
    9,
        (i) => NovenaDayContent(
      dayNumber: i + 1,
      theme: "Day ${i + 1}: Divine Mercy Intentions",
      prayer: "Today bring to Me all mankind, especially all sinners, and immerse them in the ocean of My mercy. Most Merciful Jesus, whose very nature it is to have compassion on us and to forgive us, look not upon our sins but upon our trust which we place in Your infinite goodness... Amen.",
    ),
  ),
  "Sacred Heart": List.generate(
    9,
        (i) => NovenaDayContent(
      dayNumber: i + 1,
      theme: "Day ${i + 1}: Trust in the Sacred Heart",
      prayer: "O Divine Jesus, who hast said: 'Ask and you shall receive, seek and you shall find, knock and it shall be opened unto you.' Behold me kneeling at Thy feet, inflamed with a lively faith and confidence in these promises... I place my trust in Thy Most Sacred Heart. Amen.",
    ),
  ),
};