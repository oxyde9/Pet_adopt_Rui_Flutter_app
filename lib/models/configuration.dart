import 'package:flutter/material.dart';

Color primaryColor = Color(0xff376565);

List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey, blurRadius: 30, offset: Offset(0, 10))
];

String details = 'Mon travail nécessite de déménager dans un autre pays. '
    'Je n\'ai pas la possibilité d\'emmener mon animal avec moi. '
    'Je cherche de bonnes personnes qui accueilleront mon animal de compagnie.';

List<Map> catMapList = [
  {
    "id": 0,
    "name": 'Sola',
    "imagePath": 'assets/animaux/pet_cat2.png',
    "Species": 'Abyssinion cat',
    "sex": 'Female',
    "year": '2',
    "distance": '3.6 km',
    "location": '5 Allée Adrienne-Lecouvreur, Paris',
  },
  {
    "id": 1,
    "name": 'Orion',
    "imagePath": 'assets/animaux/pet_cat1.png',
    "Species": 'Chausie',
    "sex": 'male',
    "year": '1.5',
    "distance": '7.6 km',
    "location": '25 Allée Célestin Hennion, Paris',
  },
  {
    "id": 2,
    "name": 'Bella',
    "imagePath": 'assets/animaux/pet_dog2.png',
    "Species": 'Chihuahua',
    "sex": 'female',
    "year": '1',
    "distance": '3.6 km',
    "location": '2 Allée Royale, Paris',
  },
  {
    "id": 3,
    "name": 'Max',
    "imagePath": 'assets/animaux/pet_dog1.png',
    "Species": 'Berger Australien',
    "sex": 'male',
    "year": '3',
    "distance": '7.6 km',
    "location": '75 Allée des Frères-Voisin, Paris',
  },
  {
    "id": 4,
    "name": 'Maverick',
    "imagePath": 'assets/animaux/pet_dog3.png',
    "Species": 'Akita Inu',
    "sex": 'male',
    "year": '1.5',
    "distance": '3.6 km',
    "location": '86 Allée des Poteaux, Paris',
  },
  {
    "id": 5,
    "name": 'Mouchette',
    "imagePath": 'assets/animaux/pet_cat3.png',
    "Species": 'American Shorthair',
    "sex": 'female',
    "year": '1.5',
    "distance": '7.6 km',
    "location": '36 Allée Verhaeren, Paris',
  },
];

List<Map> navList = [
  {'icon': Icons.pets_rounded, 'title': 'Adoption'},
  {'icon': Icons.markunread_mailbox_rounded, 'title': 'Donation'},
  {'icon': Icons.add_rounded, 'title': 'Add Pet'},
  {'icon': Icons.favorite_rounded, 'title': 'Favorites'},
  {'icon': Icons.mail_rounded, 'title': 'Messages'},
  {'icon': Icons.person, 'title': 'Profile'},
];
