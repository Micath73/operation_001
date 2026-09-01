class Dialogue {
  final String v; // Verse (Priest)
  final String r; // Response (People)

  const Dialogue({required this.v, required this.r});

  factory Dialogue.fromMap(Map<String, dynamic> map) {
    return Dialogue(
      v: map['v'] ?? '',
      r: map['r'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {'v': v, 'r': r};
}

class SimpleBlessing {
  final Dialogue greeting;
  final String formula;
  final String response;

  const SimpleBlessing({
    required this.greeting,
    required this.formula,
    required this.response,
  });

  factory SimpleBlessing.fromMap(Map<String, dynamic> map) {
    return SimpleBlessing(
      greeting: Dialogue.fromMap(map['greeting'] ?? {}),
      formula: map['formula'] ?? '',
      response: map['response'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
    'greeting': greeting.toMap(),
    'formula': formula,
    'response': response,
  };
}

class PontificalBlessing {
  final List<String> rubricsBefore;
  final List<Dialogue> dialogue;
  final String formula;
  final String response;

  const PontificalBlessing({
    required this.rubricsBefore,
    required this.dialogue,
    required this.formula,
    required this.response,
  });

  factory PontificalBlessing.fromMap(Map<String, dynamic> map) {
    return PontificalBlessing(
      rubricsBefore: List<String>.from(map['rubricsBefore'] ?? []),
      dialogue: (map['dialogue'] as List? ?? [])
          .map((d) => Dialogue.fromMap(d))
          .toList(),
      formula: map['formula'] ?? '',
      response: map['response'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
    'rubricsBefore': rubricsBefore,
    'dialogue': dialogue.map((d) => d.toMap()).toList(),
    'formula': formula,
    'response': response,
  };
}

class DismissalOption {
  final int id;
  final String invitation;
  final String response;

  const DismissalOption({
    required this.id,
    required this.invitation,
    required this.response,
  });

  factory DismissalOption.fromMap(Map<String, dynamic> map) {
    return DismissalOption(
      id: map['id'] ?? 0,
      invitation: map['invitation'] ?? '',
      response: map['response'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'invitation': invitation,
    'response': response,
  };
}

class ConcludingAction {
  final String kissAltar;
  final String omissionRule;

  const ConcludingAction({
    required this.kissAltar,
    required this.omissionRule,
  });

  factory ConcludingAction.fromMap(Map<String, dynamic> map) {
    return ConcludingAction(
      kissAltar: map['kissAltar'] ?? '',
      omissionRule: map['omissionRule'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
    'kissAltar': kissAltar,
    'omissionRule': omissionRule,
  };
}

class ConcludingRites {
  final String announcements;
  final SimpleBlessing simpleBlessing;
  final PontificalBlessing pontificalBlessing;
  final List<DismissalOption> dismissalOptions;
  final ConcludingAction concludingAction;

  const ConcludingRites({
    required this.announcements,
    required this.simpleBlessing,
    required this.pontificalBlessing,
    required this.dismissalOptions,
    required this.concludingAction,
  });

  factory ConcludingRites.fromMap(Map<String, dynamic> map) {
    return ConcludingRites(
      announcements: map['announcements'] ?? '',
      simpleBlessing: SimpleBlessing.fromMap(map['simpleBlessing'] ?? {}),
      pontificalBlessing:
      PontificalBlessing.fromMap(map['pontificalBlessing'] ?? {}),
      dismissalOptions: (map['dismissalOptions'] as List? ?? [])
          .map((d) => DismissalOption.fromMap(d))
          .toList(),
      concludingAction:
      ConcludingAction.fromMap(map['concludingAction'] ?? {}),
    );
  }

  Map<String, dynamic> toMap() => {
    'announcements': announcements,
    'simpleBlessing': simpleBlessing.toMap(),
    'pontificalBlessing': pontificalBlessing.toMap(),
    'dismissalOptions': dismissalOptions.map((d) => d.toMap()).toList(),
    'concludingAction': concludingAction.toMap(),
  };
}

// --- ENGLISH DATASET ---
const standardConcludingRites = ConcludingRites(
  announcements:
  "140. If they are necessary, any brief announcements to the people follow here.",
  simpleBlessing: SimpleBlessing(
    greeting: Dialogue(v: "The Lord be with you.", r: "And with your spirit."),
    formula:
    "May almighty God bless you, the Father, and the Son, + and the Holy Spirit.",
    response: "Amen.",
  ),
  pontificalBlessing: PontificalBlessing(
    rubricsBefore: [
      "143. In a Pontifical Mass, the celebrant receives the miter and, extending his hands, says:"
    ],
    dialogue: [
      Dialogue(v: "The Lord be with you.", r: "And with your spirit."),
      Dialogue(v: "Blessed be the name of the Lord.", r: "Now and for ever."),
      Dialogue(
          v: "Our help is in the name of the Lord.",
          r: "Who made heaven and earth."),
    ],
    formula:
    "May almighty God bless you, the Father, + and the Son, + and the Holy + Spirit.",
    response: "Amen.",
  ),
  dismissalOptions: [
    DismissalOption(
        id: 1,
        invitation: "Go forth, the Mass is ended.",
        response: "Thanks be to God."),
    DismissalOption(
        id: 2,
        invitation: "Go and announce the Gospel of the Lord.",
        response: "Thanks be to God."),
    DismissalOption(
        id: 3,
        invitation: "Go in peace, glorifying the Lord by your life.",
        response: "Thanks be to God."),
    DismissalOption(
        id: 4, invitation: "Go in peace.", response: "Thanks be to God."),
  ],
  concludingAction: ConcludingAction(
    kissAltar:
    "145. Then the Priest venerates the altar as usual with a kiss, as at the beginning. After making a profound bow with the ministers, he withdraws.",
    omissionRule:
    "146. If any liturgical action follows immediately, the rites of dismissal are omitted.",
  ),
);

// --- AMHARIC DATASET ---
const amharicConcludingRites = ConcludingRites(
  announcements: "140. አስፈላጊ ከሆነ ለሕዝቡ አጫጭር ማስታወቂያዎች እዚህ ይነበባሉ።",
  simpleBlessing: SimpleBlessing(
    greeting: Dialogue(v: "እግዚአብሔር ከሁላችሁ ጋር ይሁን።", r: "ከመንፈስህም ጋር።"),
    formula: "ሁሉን የሚችሉ አምላክ አብ፡ ወልድ፡ + መንፈስ ቅዱስም ይባርካችሁ።",
    response: "አሜን።",
  ),
  pontificalBlessing: PontificalBlessing(
    rubricsBefore: ["143. በጳጳሳዊ ቅዳሴ ጊዜ ሊቀ ጳጳሱ እጆቻቸውን ዘርግተው ይላሉ፦"],
    dialogue: [
      Dialogue(v: "እግዚአብሔር ከሁላችሁ ጋር ይሁን።", r: "ከመንፈስህም ጋር።"),
      Dialogue(
          v: "የእግዚአብሔር ስም የተባረከ ይሁን።", r: "ከዛሬ ጀምሮ እስከ ዘላለም።"),
      Dialogue(
          v: "ረዳታችን በእግዚአብሔር ስም ነው።", r: "ሰማይንና ምድርን በፈጠረ።"),
    ],
    formula: "ሁሉን የሚችሉ አምላክ አብ፡ + ወልድ፡ + መንፈስ + ቅዱስም ይባርካችሁ።",
    response: "አሜን።",
  ),
  dismissalOptions: [
    DismissalOption(
        id: 1, invitation: "በሰላም ሂዱ ቅዳሴው ተፈጽሟል።", response: "ለእግዚአብሔር ምስጋና ይሁን።"),
    DismissalOption(
        id: 2,
        invitation: "በሰላም ሂዱና የጌታን ወንጌል አብስሩ።",
        response: "ለእግዚአብሔር ምስጋና ይሁን።"),
  ],
  concludingAction: ConcludingAction(
    kissAltar: "145. ካህኑ ከመﺬበሩ ሳም አድርገው ይወጣሉ።",
    omissionRule: "146. ሌላ የሊቱርጂ ሥነ ሥርዓት የሚቀጥል ከሆነ ይህ የማጠቃለያ ሥርዓት ይቀራል፡፡",
  ),
);

/// Helper function to grab active concluding rites based on app language
ConcludingRites getConcludingRites(bool isAmharic) {
  return isAmharic ? amharicConcludingRites : standardConcludingRites;
}