import 'package:flutter/material.dart';
import 'package:operation_001/daily_readings_screen.dart';

class UserMass extends StatefulWidget {
  const UserMass({super.key});

  @override
  State<UserMass> createState() => _UserMassState();
}

class _UserMassState extends State<UserMass> {
  final List<Map<String, dynamic>> massSections = [
    {
      "en": "The Introductory Rites",
      "am": "የመግቢያ ሥርዓት",
      "desc": "From the Entrance Chant through the Collect prayer.",
      "image": "assets/church interior.jpeg",
      "content": [
        {
          "title": "1. Entrance",
          "lines": [
            {
              "type": "rubric",
              "text": "When the people are gathered, the Priest approaches the altar with the ministers while the Entrance Chant is sung."
            },
            {
              "type": "rubric",
              "text": "When he has arrived at the altar, after making a profound bow with the ministers, the Priest venerates the altar with a kiss and, if appropriate, incenses the cross and the altar. Then, with the ministers, he goes to the chair."
            },
            {
              "type": "rubric",
              "text": "When the Entrance Chant is concluded, the Priest and the faithful, standing, sign themselves with the Sign of the Cross, while the Priest, facing the people, says:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "In the name of the Father, and of the Son, and of the Holy Spirit."
            },
            {
              "type": "dialogue",
              "role": "People",
              "text": "Amen."
            },
          ]
        },
        {
          "title": "2. Greeting",
          "lines": [
            {
              "type": "rubric",
              "text": "Then the Priest, extending his hands, greets the people, saying:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "The grace of our Lord Jesus Christ, and the love of God, and the communion of the Holy Spirit be with you all."
            },
            {
              "type": "rubric",
              "text": "Or:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "Grace to you and peace from God our Father and the Lord Jesus Christ."
            },
            {
              "type": "rubric",
              "text": "Or:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "The Lord be with you."
            },
            {
              "type": "dialogue",
              "role": "People",
              "text": "And with your spirit."
            },
            {
              "type": "rubric",
              "text": "In this first greeting a Bishop, instead of The Lord be with you, says:"
            },
            {
              "type": "dialogue",
              "role": "Bishop",
              "text": "Peace be with you."
            },
            {
              "type": "dialogue",
              "role": "People",
              "text": "And with your spirit."
            },
          ]
        },
        {
          "title": "3. Introduction to the Mass of the Day",
          "lines": [
            {
              "type": "rubric",
              "text": "The Priest, or a Deacon, or another minister, may very briefly introduce the faithful to the Mass of the day."
            },
            {
              "type": "rubric",
              "text": "From time to time on Sundays, especially in Easter Time, instead of the customary Penitential Act, the blessing and sprinkling of water may take place as a reminder of Baptism."
            },
          ]
        },
        {
          "title": "4. Penitential Act — Form A",
          "lines": [
            {
              "type": "rubric",
              "text": "Then follows the Penitential Act, to which the Priest invites the faithful, saying:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "Brethren (brothers and sisters), let us acknowledge our sins, and so prepare ourselves to celebrate the sacred mysteries."
            },
            {
              "type": "rubric",
              "text": "A brief pause for silence follows. Then all recite together the formula of general confession:"
            },
            {
              "type": "dialogue",
              "role": "All",
              "text": "I confess to almighty God and to you, my brothers and sisters, that I have greatly sinned, in my thoughts and in my words, in what I have done and in what I have failed to do,"
            },
            {
              "type": "rubric",
              "text": "And, striking their breast, they say:"
            },
            {
              "type": "dialogue",
              "role": "All",
              "text": "through my fault, through my fault, through my most grievous fault;"
            },
            {
              "type": "rubric",
              "text": "Then they continue:"
            },
            {
              "type": "dialogue",
              "role": "All",
              "text": "therefore I ask blessed Mary ever-Virgin, all the Angels and Saints, and you, my brothers and sisters, to pray for me to the Lord our God."
            },
            {
              "type": "rubric",
              "text": "The absolution by the Priest follows:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "May almighty God have mercy on us, forgive us our sins, and bring us to everlasting life."
            },
            {
              "type": "dialogue",
              "role": "People",
              "text": "Amen."
            },
          ]
        },
        {
          "title": "5. Penitential Act — Form B",
          "lines": [
            {
              "type": "rubric",
              "text": "The Priest invites the faithful to make the Penitential Act:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "Brethren (brothers and sisters), let us acknowledge our sins, and so prepare ourselves to celebrate the sacred mysteries."
            },
            {
              "type": "rubric",
              "text": "A brief pause for silence follows. The Priest then says:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "Have mercy on us, O Lord."
            },
            {
              "type": "dialogue",
              "role": "People",
              "text": "For we have sinned against you."
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "Show us, O Lord, your mercy."
            },
            {
              "type": "dialogue",
              "role": "People",
              "text": "And grant us your salvation."
            },
            {
              "type": "rubric",
              "text": "The absolution by the Priest follows:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "May almighty God have mercy on us, forgive us our sins, and bring us to everlasting life."
            },
            {
              "type": "dialogue",
              "role": "People",
              "text": "Amen."
            },
          ]
        },
        {
          "title": "6. Penitential Act — Form C",
          "lines": [
            {
              "type": "rubric",
              "text": "The Priest invites the faithful to make the Penitential Act:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "Brethren (brothers and sisters), let us acknowledge our sins, and so prepare ourselves to celebrate the sacred mysteries."
            },
            {
              "type": "rubric",
              "text": "A brief pause for silence follows."
            },
            {
              "type": "rubric",
              "text": "The Priest, or a Deacon or another minister, then says the following or other invocations with Kyrie, eleison (Lord, have mercy):"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "You were sent to heal the contrite of heart: Lord, have mercy. (Or: Kyrie, eleison.)"
            },
            {
              "type": "dialogue",
              "role": "People",
              "text": "Lord, have mercy. (Or: Kyrie, eleison.)"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "You came to call sinners: Christ, have mercy. (Or: Christe, eleison.)"
            },
            {
              "type": "dialogue",
              "role": "People",
              "text": "Christ, have mercy. (Or: Christe, eleison.)"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "You are seated at the right hand of the Father to intercede for us: Lord, have mercy. (Or: Kyrie, eleison.)"
            },
            {
              "type": "dialogue",
              "role": "People",
              "text": "Lord, have mercy. (Or: Kyrie, eleison.)"
            },
            {
              "type": "rubric",
              "text": "The absolution by the Priest follows:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "May almighty God have mercy on us, forgive us our sins, and bring us to everlasting life."
            },
            {
              "type": "dialogue",
              "role": "People",
              "text": "Amen."
            },
          ]
        },
        {
          "title": "7. The Kyrie",
          "lines": [
            {
              "type": "rubric",
              "text": "The Kyrie eleison (Lord, have mercy) invocations follow, unless they have just occurred in a formula of the Penitential Act."
            },
            {
              "type": "dialogue",
              "role": "V",
              "text": "Lord, have mercy."
            },
            {
              "type": "dialogue",
              "role": "R",
              "text": "Lord, have mercy."
            },
            {
              "type": "dialogue",
              "role": "V",
              "text": "Christ, have mercy."
            },
            {
              "type": "dialogue",
              "role": "R",
              "text": "Christ, have mercy."
            },
            {
              "type": "dialogue",
              "role": "V",
              "text": "Lord, have mercy."
            },
            {
              "type": "dialogue",
              "role": "R",
              "text": "Lord, have mercy."
            },
            {
              "type": "rubric",
              "text": "Or:"
            },
            {
              "type": "dialogue",
              "role": "V",
              "text": "Kyrie, eleison."
            },
            {
              "type": "dialogue",
              "role": "R",
              "text": "Kyrie, eleison."
            },
            {
              "type": "dialogue",
              "role": "V",
              "text": "Christe, eleison."
            },
            {
              "type": "dialogue",
              "role": "R",
              "text": "Christe, eleison."
            },
            {
              "type": "dialogue",
              "role": "V",
              "text": "Kyrie, eleison."
            },
            {
              "type": "dialogue",
              "role": "R",
              "text": "Kyrie, eleison."
            },
          ]
        },
        {
          "title": "8. The Gloria",
          "lines": [
            {
              "type": "rubric",
              "text": "Then, when it is prescribed, this hymn is either sung or said:"
            },
            {
              "type": "dialogue",
              "text": "Glory to God in the highest, and on earth peace to people of good will. We praise you, we bless you, we adore you, we glorify you, we give you thanks for your great glory, Lord God, heavenly King, O God, almighty Father."
            },
            {
              "type": "dialogue",
              "text": "Lord Jesus Christ, Only Begotten Son, Lord God, Lamb of God, Son of the Father, you take away the sins of the world, have mercy on us; you take away the sins of the world, receive our prayer; you are seated at the right hand of the Father, have mercy on us."
            },
            {
              "type": "dialogue",
              "text": "For you alone are the Holy One, you alone are the Lord, you alone are the Most High, Jesus Christ, with the Holy Spirit, in the glory of God the Father. Amen."
            },
          ]
        },
        {
          "title": "9. The Collect",
          "lines": [
            {
              "type": "rubric",
              "text": "When this hymn is concluded, the Priest, with hands joined, says:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "Let us pray."
            },
            {
              "type": "rubric",
              "text": "And all pray in silence with the Priest for a while."
            },
            {
              "type": "rubric",
              "text": "Then the Priest, with hands extended, says the Collect prayer, at the end of which the people acclaim:"
            },
            {
              "type": "dialogue",
              "role": "People",
              "text": "Amen."
            },
          ]
        },
      ],
    },
    {
      "en": "The Liturgy of the Word",
      "am": "የቃል ሥርዓት",
      "desc": "From the First Reading through the Universal Prayer.",
      "image": "assets/bible reading.jpg",
      "content": [
        {
          "title": "10. First Reading",
          "lines": [
            {
              "type": "rubric",
              "text": "Then the reader goes to the ambo and reads the First Reading, while all sit and listen."
            },
            {
              "type": "rubric",
              "text": "To indicate the end of the reading, the reader acclaims:"
            },
            {
              "type": "dialogue",
              "role": "Reader",
              "text": "The word of the Lord."
            },
            {
              "type": "dialogue",
              "role": "People",
              "text": "Thanks be to God."
            },
          ]
        },
        {
          "title": "11. Responsorial Psalm",
          "lines": [
            {
              "type": "rubric",
              "text": "The psalmist or cantor sings or says the Psalm, with the people making the response."
            },
          ]
        },
        {
          "title": "12. Second Reading",
          "lines": [
            {
              "type": "rubric",
              "text": "After this, if there is to be a Second Reading, a reader reads it from the ambo, as above."
            },
            {
              "type": "rubric",
              "text": "To indicate the end of the reading, the reader acclaims:"
            },
            {
              "type": "dialogue",
              "role": "Reader",
              "text": "The word of the Lord."
            },
            {
              "type": "dialogue",
              "role": "People",
              "text": "Thanks be to God."
            },
          ]
        },
        {
          "title": "13. Gospel Acclamation",
          "lines": [
            {
              "type": "rubric",
              "text": "There follows the Alleluia or another chant laid down by the rubrics, as the liturgical time requires."
            },
          ]
        },
        {
          "title": "14. Blessing Before the Gospel",
          "lines": [
            {
              "type": "rubric",
              "text": "Meanwhile, if incense is used, the Priest puts some into the thurible. After this, the Deacon who is to proclaim the Gospel, bowing profoundly before the Priest, asks for the blessing, saying in a low voice:"
            },
            {
              "type": "dialogue",
              "role": "Deacon",
              "text": "Your blessing, Father."
            },
            {
              "type": "rubric",
              "text": "The Priest says in a low voice:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "May the Lord be in your heart and on your lips, that you may proclaim his Gospel worthily and well, in the name of the Father and of the Son + and of the Holy Spirit."
            },
            {
              "type": "rubric",
              "text": "The Deacon signs himself with the Sign of the Cross and replies:"
            },
            {
              "type": "dialogue",
              "role": "Deacon",
              "text": "Amen."
            },
            {
              "type": "rubric",
              "text": "If, however, a Deacon is not present, the Priest, bowing before the altar, says quietly:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "Cleanse my heart and my lips, almighty God, that I may worthily proclaim your holy Gospel."
            },
          ]
        },
        {
          "title": "15. The Gospel",
          "lines": [
            {
              "type": "rubric",
              "text": "The Deacon, or the Priest, then proceeds to the ambo, accompanied, if appropriate, by ministers with incense and candles. There he says:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "The Lord be with you."
            },
            {
              "type": "dialogue",
              "role": "People",
              "text": "And with your spirit."
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "A reading from the holy Gospel according to N."
            },
            {
              "type": "rubric",
              "text": "and, at the same time, he makes the Sign of the Cross on the book and on his forehead, lips, and breast."
            },
            {
              "type": "dialogue",
              "role": "People",
              "text": "Glory to you, O Lord."
            },
            {
              "type": "rubric",
              "text": "Then the Deacon, or the Priest, incenses the book, if incense is used, and proclaims the Gospel."
            },
          ]
        },
        {
          "title": "16. End of the Gospel",
          "lines": [
            {
              "type": "rubric",
              "text": "At the end of the Gospel, the Deacon, or the Priest, acclaims:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "The Gospel of the Lord."
            },
            {
              "type": "dialogue",
              "role": "People",
              "text": "Praise to you, Lord Jesus Christ."
            },
            {
              "type": "rubric",
              "text": "Then he kisses the book, saying quietly:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "Through the words of the Gospel may our sins be wiped away."
            },
          ]
        },
        {
          "title": "17. The Homily",
          "lines": [
            {
              "type": "rubric",
              "text": "Then follows the Homily, which is to be preached by a Priest or Deacon on all Sundays and Holydays of Obligation; on other days, it is recommended."
            },
          ]
        },
        {
          "title": "18. The Niceno-Constantinopolitan Creed",
          "lines": [
            {
              "type": "rubric",
              "text": "At the end of the Homily, the Symbol or Profession of Faith or Creed, when prescribed, is either said or sung:"
            },
            {
              "type": "dialogue",
              "role": "All",
              "text": "I believe in one God, the Father almighty, maker of heaven and earth, of all things visible and invisible."
            },
            {
              "type": "dialogue",
              "role": "All",
              "text": "I believe in one Lord Jesus Christ, the Only Begotten Son of God, born of the Father before all ages. God from God, Light from Light, true God from true God, begotten, not made, consubstantial with the Father; through him all things were made. For us men and for our salvation he came down from heaven,"
            },
            {
              "type": "rubric",
              "text": "(At the words that follow up to and including 'and became man,' all bow.)"
            },
            {
              "type": "dialogue",
              "role": "All",
              "text": "and by the Holy Spirit was incarnate of the Virgin Mary, and became man."
            },
            {
              "type": "dialogue",
              "role": "All",
              "text": "For our sake he was crucified under Pontius Pilate, he suffered death and was buried, and rose again on the third day in accordance with the Scriptures. He ascended into heaven and is seated at the right hand of the Father. He will come again in glory to judge the living and the dead and his kingdom will have no end."
            },
            {
              "type": "dialogue",
              "role": "All",
              "text": "I believe in the Holy Spirit, the Lord, the giver of life, who proceeds from the Father and the Son, who with the Father and the Son is adored and glorified, who has spoken through the prophets."
            },
            {
              "type": "dialogue",
              "role": "All",
              "text": "I believe in one, holy, catholic and apostolic Church. I confess one baptism for the forgiveness of sins and I look forward to the resurrection of the dead and the life of the world to come. Amen."
            },
          ]
        },
        {
          "title": "19. The Apostles' Creed (Alternative)",
          "lines": [
            {
              "type": "rubric",
              "text": "Instead of the Niceno-Constantinopolitan Creed, especially during Lent and Easter time, the baptismal Symbol of the Roman Church, known as the Apostles' Creed, may be used."
            },
            {
              "type": "dialogue",
              "role": "All",
              "text": "I believe in God, the Father almighty, Creator of heaven and earth, and in Jesus Christ, his only Son, our Lord,"
            },
            {
              "type": "rubric",
              "text": "(At the words that follow, up to and including 'the Virgin Mary,' all bow.)"
            },
            {
              "type": "dialogue",
              "role": "All",
              "text": "who was conceived by the Holy Spirit, born of the Virgin Mary, suffered under Pontius Pilate, was crucified, died and was buried; he descended into hell; on the third day he rose again from the dead; he ascended into heaven, and is seated at the right hand of God the Father almighty; from there he will come to judge the living and the dead."
            },
            {
              "type": "dialogue",
              "role": "All",
              "text": "I believe in the Holy Spirit, the holy catholic Church, the communion of saints, the forgiveness of sins, the resurrection of the body, and life everlasting. Amen."
            },
          ]
        },
        {
          "title": "20. The Universal Prayer",
          "lines": [
            {
              "type": "rubric",
              "text": "Then follows the Universal Prayer, that is, the Prayer of the Faithful or Bidding Prayers."
            },
          ]
        },
      ],
    },
    {
      "en": "The Liturgy of the Eucharist",
      "am": "የቁርባን ሥርዓት",
      "desc": "From the Preparation of the Gifts through the Eucharistic Prayer.",
      "image": "assets/bread and wine.jpg",
      "content": [
        {
          "title": "21–22. Preparation of the Altar and Gifts",
          "lines": [
            {
              "type": "rubric",
              "text": "When all this has been done, the Offertory Chant begins. Meanwhile, the ministers place the corporal, the purificator, the chalice, the pall, and the Missal on the altar."
            },
            {
              "type": "rubric",
              "text": "It is desirable that the faithful express their participation by making an offering, bringing forward bread and wine for the celebration of the Eucharist and perhaps other gifts to relieve the needs of the Church and of the poor."
            },
          ]
        },
        {
          "title": "23. Offering of the Bread",
          "lines": [
            {
              "type": "rubric",
              "text": "The Priest, standing at the altar, takes the paten with the bread and holds it slightly raised above the altar with both hands, saying in a low voice:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "Blessed are you, Lord God of all creation, for through your goodness we have received the bread we offer you: fruit of the earth and work of human hands, it will become for us the bread of life."
            },
            {
              "type": "rubric",
              "text": "Then he places the paten with the bread on the corporal."
            },
            {
              "type": "rubric",
              "text": "If the Offertory Chant is not sung, the Priest may speak these words aloud; at the end, the people may acclaim:"
            },
            {
              "type": "dialogue",
              "role": "People",
              "text": "Blessed be God for ever."
            },
          ]
        },
        {
          "title": "24. Mingling of Water and Wine",
          "lines": [
            {
              "type": "rubric",
              "text": "The Deacon, or the Priest, pours wine and a little water into the chalice, saying quietly:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "By the mystery of this water and wine may we come to share in the divinity of Christ who humbled himself to share in our humanity."
            },
          ]
        },
        {
          "title": "25. Offering of the Chalice",
          "lines": [
            {
              "type": "rubric",
              "text": "The Priest then takes the chalice and holds it slightly raised above the altar with both hands, saying in a low voice:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "Blessed are you, Lord God of all creation, for through your goodness we have received the wine we offer you: fruit of the vine and work of human hands, it will become our spiritual drink."
            },
            {
              "type": "rubric",
              "text": "Then he places the chalice on the corporal."
            },
            {
              "type": "rubric",
              "text": "If the Offertory Chant is not sung, the Priest may speak these words aloud; at the end, the people may acclaim:"
            },
            {
              "type": "dialogue",
              "role": "People",
              "text": "Blessed be God for ever."
            },
          ]
        },
        {
          "title": "26. Prayer in a Humble Spirit",
          "lines": [
            {
              "type": "rubric",
              "text": "After this, the Priest, bowing profoundly, says quietly:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "With humble spirit and contrite heart may we be accepted by you, O Lord, and may our sacrifice in your sight this day be pleasing to you, Lord God."
            },
          ]
        },
        {
          "title": "27. Incensation",
          "lines": [
            {
              "type": "rubric",
              "text": "If appropriate, he also incenses the offerings, the cross, and the altar. A Deacon or other minister then incenses the Priest and the people."
            },
          ]
        },
        {
          "title": "28. Washing of Hands",
          "lines": [
            {
              "type": "rubric",
              "text": "Then the Priest, standing at the side of the altar, washes his hands, saying quietly:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "Wash me, O Lord, from my iniquity and cleanse me from my sin."
            },
          ]
        },
        {
          "title": "29. Invitation to Prayer",
          "lines": [
            {
              "type": "rubric",
              "text": "Standing at the middle of the altar, facing the people, extending and then joining his hands, he says:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "Pray, brethren (brothers and sisters), that my sacrifice and yours may be acceptable to God, the almighty Father."
            },
            {
              "type": "rubric",
              "text": "The people rise and reply:"
            },
            {
              "type": "dialogue",
              "role": "People",
              "text": "May the Lord accept the sacrifice at your hands for the praise and glory of his name, for our good and the good of all his holy Church."
            },
          ]
        },
        {
          "title": "30. Prayer over the Offerings",
          "lines": [
            {
              "type": "rubric",
              "text": "Then the Priest, with hands extended, says the Prayer over the Offerings, at the end of which the people acclaim:"
            },
            {
              "type": "dialogue",
              "role": "People",
              "text": "Amen."
            },
          ]
        },
        {
          "title": "31. Preface Dialogue and Sanctus",
          "lines": [
            {
              "type": "rubric",
              "text": "Then the Priest begins the Eucharistic Prayer. Extending his hands, he says:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "The Lord be with you."
            },
            {
              "type": "dialogue",
              "role": "People",
              "text": "And with your spirit."
            },
            {
              "type": "rubric",
              "text": "The Priest, raising his hands, continues:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "Lift up your hearts."
            },
            {
              "type": "dialogue",
              "role": "People",
              "text": "We lift them up to the Lord."
            },
            {
              "type": "rubric",
              "text": "The Priest, with hands extended, adds:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "Let us give thanks to the Lord our God."
            },
            {
              "type": "dialogue",
              "role": "People",
              "text": "It is right and just."
            },
            {
              "type": "rubric",
              "text": "The Priest, with hands extended, continues the Preface. At the end of the Preface he joins his hands and concludes with the people, singing or saying aloud:"
            },
            {
              "type": "dialogue",
              "role": "All",
              "text": "Holy, Holy, Holy Lord God of hosts. Heaven and earth are full of your glory. Hosanna in the highest. Blessed is he who comes in the name of the Lord. Hosanna in the highest."
            },
          ]
        },
        {
          "title": "32. The Eucharistic Prayer",
          "lines": [
            {
              "type": "rubric",
              "text": "In all Masses, the Priest celebrant is permitted to sing parts of the Eucharistic Prayer, especially the principal parts."
            },
            {
              "type": "rubric",
              "text": "In Eucharistic Prayer I, the Roman Canon, the words included in brackets may be omitted."
            },
          ]
        },
      ],
    },
    {
      "en": "The Communion Rite",
      "am": "የቁርባን ተቀብሎ ሥርዓት",
      "desc": "From the Lord's Prayer through the Prayer after Communion.",
      "image": "assets/holy communion given.jpg",
      "content": [
        {
          "title": "124. The Lord's Prayer",
          "lines": [
            {
              "type": "rubric",
              "text": "After the chalice and paten have been set down, the Priest, with hands joined, says:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "At the Savior's command and formed by divine teaching, we dare to say:"
            },
            {
              "type": "rubric",
              "text": "He extends his hands and, together with the people, continues:"
            },
            {
              "type": "dialogue",
              "role": "All",
              "text": "Our Father, who art in heaven, hallowed be thy name; thy kingdom come, thy will be done on earth as it is in heaven. Give us this day our daily bread, and forgive us our trespasses, as we forgive those who trespass against us; and lead us not into temptation, but deliver us from evil."
            },
          ]
        },
        {
          "title": "125. Embolism",
          "lines": [
            {
              "type": "rubric",
              "text": "With hands extended, the Priest alone continues, saying:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "Deliver us, Lord, we pray, from every evil, graciously grant peace in our days, that, by the help of your mercy, we may be always free from sin and safe from all distress, as we await the blessed hope and the coming of our Savior, Jesus Christ."
            },
            {
              "type": "rubric",
              "text": "He joins his hands. The people conclude the prayer, acclaiming:"
            },
            {
              "type": "dialogue",
              "role": "People",
              "text": "For the kingdom, the power and the glory are yours now and for ever."
            },
          ]
        },
        {
          "title": "126–127. Prayer and Sign of Peace",
          "lines": [
            {
              "type": "rubric",
              "text": "Then the Priest, with hands extended, says aloud:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "Lord Jesus Christ, who said to your Apostles: Peace I leave you, my peace I give you; look not on our sins, but on the faith of your Church, and graciously grant her peace and unity in accordance with your will."
            },
            {
              "type": "rubric",
              "text": "He joins his hands."
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "Who live and reign for ever and ever."
            },
            {
              "type": "dialogue",
              "role": "People",
              "text": "Amen."
            },
            {
              "type": "rubric",
              "text": "The Priest, turned towards the people, extending and then joining his hands, adds:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "The peace of the Lord be with you always."
            },
            {
              "type": "dialogue",
              "role": "People",
              "text": "And with your spirit."
            },
          ]
        },
        {
          "title": "128. Sign of Peace",
          "lines": [
            {
              "type": "rubric",
              "text": "Then, if appropriate, the Deacon, or the Priest, adds:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "Let us offer each other the sign of peace."
            },
            {
              "type": "rubric",
              "text": "And all offer one another a sign, in keeping with local customs, that expresses peace, communion, and charity. The Priest gives the sign of peace to a Deacon or minister."
            },
          ]
        },
        {
          "title": "129–130. Fraction and Lamb of God",
          "lines": [
            {
              "type": "rubric",
              "text": "Then he takes the Host, breaks it over the paten, and places a small piece in the chalice, saying quietly:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "May this mingling of the Body and Blood of our Lord Jesus Christ bring eternal life to us who receive it."
            },
            {
              "type": "rubric",
              "text": "Meanwhile the following is sung or said:"
            },
            {
              "type": "dialogue",
              "role": "All",
              "text": "Lamb of God, you take away the sins of the world, have mercy on us."
            },
            {
              "type": "dialogue",
              "role": "All",
              "text": "Lamb of God, you take away the sins of the world, have mercy on us."
            },
            {
              "type": "dialogue",
              "role": "All",
              "text": "Lamb of God, you take away the sins of the world, grant us peace."
            },
            {
              "type": "rubric",
              "text": "The invocation may be repeated several times if the fraction is prolonged. Only the final time, however, is 'grant us peace' said."
            },
          ]
        },
        {
          "title": "131. Private Preparation of the Priest",
          "lines": [
            {
              "type": "rubric",
              "text": "Then the Priest, with hands joined, says quietly:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "Lord Jesus Christ, Son of the living God, who, by the will of the Father and the work of the Holy Spirit, through your Death gave life to the world, free me by this, your most holy Body and Blood, from all my sins and from every evil; keep me always faithful to your commandments, and never let me be parted from you."
            },
            {
              "type": "rubric",
              "text": "Or:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "May the receiving of your Body and Blood, Lord Jesus Christ, not bring me to judgment and condemnation, but through your loving mercy be for me protection in mind and body and a healing remedy."
            },
          ]
        },
        {
          "title": "132. Invitation to Communion",
          "lines": [
            {
              "type": "rubric",
              "text": "The Priest genuflects, takes the host and, holding it slightly raised above the paten or above the chalice, while facing the people, says aloud:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "Behold the Lamb of God, behold him who takes away the sins of the world. Blessed are those called to the supper of the Lamb."
            },
            {
              "type": "rubric",
              "text": "And together with the people he adds once:"
            },
            {
              "type": "dialogue",
              "role": "All",
              "text": "Lord, I am not worthy that you should enter under my roof, but only say the word and my soul shall be healed."
            },
          ]
        },
        {
          "title": "133. Communion of the Priest",
          "lines": [
            {
              "type": "rubric",
              "text": "The Priest, facing the altar, says quietly:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "May the Body of Christ keep me safe for eternal life."
            },
            {
              "type": "rubric",
              "text": "And he reverently consumes the Body of Christ. Then he takes the chalice and says quietly:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "May the Blood of Christ keep me safe for eternal life."
            },
            {
              "type": "rubric",
              "text": "And he reverently consumes the Blood of Christ."
            },
          ]
        },
        {
          "title": "134. Communion of the Faithful",
          "lines": [
            {
              "type": "rubric",
              "text": "After this, he takes the paten or ciborium and approaches the communicants. The Priest raises a host slightly and shows it to each of the communicants, saying:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "The Body of Christ."
            },
            {
              "type": "dialogue",
              "role": "People",
              "text": "Amen."
            },
            {
              "type": "rubric",
              "text": "and receives Holy Communion. If a Deacon also distributes Holy Communion, he does so in the same manner."
            },
          ]
        },
        {
          "title": "136–137. Communion Chant and Purification",
          "lines": [
            {
              "type": "rubric",
              "text": "While the Priest is receiving the Body of Christ, the Communion Chant begins."
            },
            {
              "type": "rubric",
              "text": "When the distribution of Communion is over, the Priest or a Deacon or an acolyte purifies the paten over the chalice and also the chalice itself."
            },
            {
              "type": "rubric",
              "text": "While he carries out the purification, the Priest says quietly:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "What has passed our lips as food, O Lord, may we possess in purity of heart, that what has been given to us in time may be our healing for eternity."
            },
          ]
        },
        {
          "title": "138–139. Silence and Prayer after Communion",
          "lines": [
            {
              "type": "rubric",
              "text": "Then the Priest may return to the chair. If appropriate, a sacred silence may be observed for a while, or a psalm or other canticle of praise or a hymn may be sung."
            },
            {
              "type": "rubric",
              "text": "Then, standing at the altar or at the chair and facing the people, with hands joined, the Priest says:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "Let us pray."
            },
            {
              "type": "rubric",
              "text": "All pray in silence with the Priest for a while, unless silence has just been observed. Then the Priest, with hands extended, says the Prayer after Communion, at the end of which the people acclaim:"
            },
            {
              "type": "dialogue",
              "role": "People",
              "text": "Amen."
            },
          ]
        },
      ],
    },
    {
      "en": "The Concluding Rites",
      "am": "የመዝጋቢ ሥርዓት",
      "desc": "Announcements, the final blessing, and the dismissal.",
      "image": "assets/priest blessing.jpeg",
      "content": [
        {
          "title": "140. Announcements",
          "lines": [
            {
              "type": "rubric",
              "text": "If they are necessary, any brief announcements to the people follow here."
            },
          ]
        },
        {
          "title": "141. The Dismissal and Blessing",
          "lines": [
            {
              "type": "rubric",
              "text": "Then the dismissal takes place. The Priest, facing the people and extending his hands, says:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "The Lord be with you."
            },
            {
              "type": "dialogue",
              "role": "People",
              "text": "And with your spirit."
            },
            {
              "type": "rubric",
              "text": "The Priest blesses the people, saying:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "May almighty God bless you, the Father, and the Son, + and the Holy Spirit."
            },
            {
              "type": "dialogue",
              "role": "People",
              "text": "Amen."
            },
          ]
        },
        {
          "title": "142. Solemn Formula (Optional)",
          "lines": [
            {
              "type": "rubric",
              "text": "On certain days or occasions, this formula of blessing is preceded, in accordance with the rubrics, by another more solemn formula of blessing or by a prayer over the people."
            },
          ]
        },
        {
          "title": "144. Words of Dismissal",
          "lines": [
            {
              "type": "rubric",
              "text": "Then the Deacon, or the Priest himself, with hands joined and facing the people, says:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "Go forth, the Mass is ended."
            },
            {
              "type": "rubric",
              "text": "Or:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "Go and announce the Gospel of the Lord."
            },
            {
              "type": "rubric",
              "text": "Or:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "Go in peace, glorifying the Lord by your life."
            },
            {
              "type": "rubric",
              "text": "Or:"
            },
            {
              "type": "dialogue",
              "role": "Priest",
              "text": "Go in peace."
            },
            {
              "type": "dialogue",
              "role": "People",
              "text": "Thanks be to God."
            },
          ]
        },
        {
          "title": "145. Veneration of the Altar",
          "lines": [
            {
              "type": "rubric",
              "text": "Then the Priest venerates the altar as usual with a kiss, as at the beginning. After making a profound bow with the ministers, he withdraws."
            },
          ]
        },
        {
          "title": "146. Note",
          "lines": [
            {
              "type": "rubric",
              "text": "If any liturgical action follows immediately, the rites of dismissal are omitted."
            },
          ]
        },
      ],
    },
  ];


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Holy Mass',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            indicatorColor: colorScheme.secondary,
            indicatorWeight: 3,
            labelColor: colorScheme.onPrimary,
            unselectedLabelColor: colorScheme.onPrimary.withOpacity(0.6),
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            tabs: const [
              Tab(icon: Icon(Icons.calendar_today_rounded), text: 'Daily Readings'),
              Tab(icon: Icon(Icons.auto_stories_rounded), text: 'Order of Mass'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildReadingsTab(context),
            _buildOrderOfMassTab(context),
          ],
        ),
      ),
    );
  }

  Widget _buildReadingsTab(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Card(
          elevation: 0,
          color: theme.colorScheme.primaryContainer.withOpacity(0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: theme.colorScheme.primary.withOpacity(0.2)),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DailyReadingsScreen(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.auto_stories_rounded,
                        color: theme.colorScheme.primary,
                        size: 32,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Today's Mass Readings",
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Liturgical Readings & Psalms",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onSurface.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: theme.colorScheme.primary,
                        size: 18,
                      ),
                    ],
                  ),
                  const Divider(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tap to open full reader & calendar",
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: theme.colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.calendar_month_rounded,
                        size: 18,
                        color: theme.colorScheme.secondary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReadingSection(
      BuildContext context, {
        required String titleEn,
        required String titleAm,
        required String passage,
      }) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.primary.withOpacity(0.12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titleEn,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              Text(
                titleAm,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.secondary,
                ),
              ),
            ],
          ),
          const Divider(height: 20),
          Text(
            passage,
            style: theme.textTheme.bodyMedium?.copyWith(
              height: 1.5,
              color: theme.colorScheme.onSurface.withOpacity(0.85),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderOfMassTab(BuildContext context) {
    final theme = Theme.of(context);

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: massSections.length,
      itemBuilder: (context, index) {
        final item = massSections[index];
        return Card(
          elevation: 0,
          margin: const EdgeInsets.only(bottom: 12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: theme.colorScheme.primary.withOpacity(0.15)),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            leading: CircleAvatar(
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: theme.colorScheme.onPrimary,
              child: Text(
                "${index + 1}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(
              item["en"] as String,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["am"] as String,
                  style: TextStyle(
                    color: theme.colorScheme.secondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item["desc"] as String,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
            trailing: Icon(
              Icons.chevron_right_rounded,
              color: theme.colorScheme.primary,
            ),
            onTap: () => _openSectionDetail(context, item),
          ),
        );
      },
    );
  }

  void _openSectionDetail(BuildContext context, Map<String, dynamic> section) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderDetailScreen(section: section),
      ),
    );
  }
}

class OrderDetailScreen extends StatelessWidget {
  final Map<String, dynamic> section;

  const OrderDetailScreen({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<Map<String, dynamic>> content =
    List<Map<String, dynamic>>.from(section["content"]);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              section["image"] as String,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.82),
            ),
          ),
          SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  iconTheme: const IconThemeData(color: Colors.white),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        section["en"] as String,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        section["am"] as String,
                        style: TextStyle(
                          color: theme.colorScheme.secondary,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(16.0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        final item = content[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 16.0),
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.15),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item["title"] as String,
                                style: TextStyle(
                                  color: theme.colorScheme.secondary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              const Divider(
                                color: Colors.white24,
                                height: 20,
                              ),
                              _buildFormattedDialogue(
                                context,
                                item["lines"] as List<dynamic>,
                              ),
                            ],
                          ),
                        );
                      },
                      childCount: content.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormattedDialogue(BuildContext context, List<dynamic> rawLines) {
    final theme = Theme.of(context);
    final goldColor = theme.colorScheme.secondary;
    final lines = List<Map<String, dynamic>>.from(rawLines);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: lines.map((line) {
        final isRubric = line["type"] == "rubric";
        final role = line["role"] as String?;
        final text = line["text"] as String? ?? "";

        if (isRubric) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white70,
                fontStyle: FontStyle.italic,
                fontSize: 14.0,
                height: 1.4,
              ),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0),
          child: Text.rich(
            TextSpan(
              children: [
                if (role != null && role.isNotEmpty)
                  TextSpan(
                    text: '$role: ',
                    style: TextStyle(
                      color: goldColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.5,
                    ),
                  ),
                TextSpan(
                  text: text,
                  style: TextStyle(
                    color: goldColor,
                    fontSize: 15.0,
                    height: 1.45,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}