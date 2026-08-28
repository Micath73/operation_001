class Dialogue {
  final String v; // Verse (Priest)
  final String r; // Response (People)

  const Dialogue({required this.v, required this.r});
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
}

class ConcludingAction {
  final String kissAltar;
  final String omissionRule;

  const ConcludingAction({
    required this.kissAltar,
    required this.omissionRule,
  });
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
}

// Global static dataset for Concluding Rites
const standardConcludingRites = ConcludingRites(
  announcements: "140. If they are necessary, any brief announcements to the people follow here.",
  simpleBlessing: SimpleBlessing(
    greeting: Dialogue(v: "The Lord be with you.", r: "And with your spirit."),
    formula: "May almighty God bless you, the Father, and the Son, + and the Holy Spirit.",
    response: "Amen.",
  ),
  pontificalBlessing: PontificalBlessing(
    rubricsBefore: [
      "143. In a Pontifical Mass, the celebrant receives the miter and, extending his hands, says:"
    ],
    dialogue: [
      Dialogue(v: "The Lord be with you.", r: "And with your spirit."),
      Dialogue(v: "Blessed be the name of the Lord.", r: "Now and for ever."),
      Dialogue(v: "Our help is in the name of the Lord.", r: "Who made heaven and earth."),
    ],
    formula: "May almighty God bless you, the Father, + and the Son, + and the Holy + Spirit.",
    response: "Amen.",
  ),
  dismissalOptions: [
    DismissalOption(id: 1, invitation: "Go forth, the Mass is ended.", response: "Thanks be to God."),
    DismissalOption(id: 2, invitation: "Go and announce the Gospel of the Lord.", response: "Thanks be to God."),
    DismissalOption(id: 3, invitation: "Go in peace, glorifying the Lord by your life.", response: "Thanks be to God."),
    DismissalOption(id: 4, invitation: "Go in peace.", response: "Thanks be to God."),
  ],
  concludingAction: ConcludingAction(
    kissAltar: "145. Then the Priest venerates the altar as usual with a kiss, as at the beginning. After making a profound bow with the ministers, he withdraws.",
    omissionRule: "146. If any liturgical action follows immediately, the rites of dismissal are omitted.",
  ),
);