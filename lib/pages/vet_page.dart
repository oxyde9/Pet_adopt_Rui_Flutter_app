import 'package:pet/models/package_details.dart';
import 'package:pet/utils/styles.dart';
import 'package:pet/widgets/back_button.dart';
import 'package:pet/widgets/book_button.dart';
import 'package:pet/widgets/vet_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class VetPage extends StatefulWidget {
  const VetPage({Key? key}) : super(key: key);

  @override
  State<VetPage> createState() => _VetPageState();
}

class _VetPageState extends State<VetPage> {
  late ScrollController _controller;
  double headerHeight = 140;
  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.offset > 0) {
        setState(() {
          headerHeight = 0;
        });
      } else {
        setState(() {
          headerHeight = 140;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    //_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final veterinaryPackage = [
      {
        'title': 'Vétérinaire en ligne',
        'sub': null,
        'pet': 'assets/svg/pet_circle.svg',
        'items': [
          'Consultation unique',
          'Conseil en appels et vidéo',
          'Conseils personnalisés'
        ],
        'price': 149
      },
      {
        'title': 'Soins essentiels en ligne',
        'sub': null,
        'pet': null,
        'items': [
          'Consultations en ligne',
          'Conseils personnalisés',
          'Suivi à 1 mois',
          'Prévention contre les puces'
        ],
        'price': 499
      },
      {
        'title': 'Soins essentiels en ligne',
        'sub': null,
        'pet': null,
        'items': [
          'Consultations en ligne',
          'Conseils personnalisés',
          'Suivi à 1 mois',
          'Prévention contre les puces'
        ],
        'price': 499
      },
      {
        'title': 'Consultation chiens',
        'sub': null,
        'pet': 'assets/svg/pet_circle2.svg',
        'items': [
          'Consultation sur la nutrition',
          'Gestion de l\'éducation des chiens',
          'Entraînement comportemental',
          '(Agressivité, morsures, sauts)'
        ],
        'price': 599
      },
      {
        'title': 'Soins essentiels en ligne',
        'sub': null,
        'pet': null,
        'items': [
          'Consultations en ligne',
          'Conseils personnalisés',
          'Suivi à 1 mois',
          'Prévention contre les puces'
        ],
        'price': 499
      },
    ];
    return Material(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const Gap(100),
                AnimatedContainer(
                  margin: EdgeInsets.only(bottom: headerHeight == 0 ? 0 : 16),
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInExpo,
                  width: double.infinity,
                  height: headerHeight,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('assets/png/vet.png'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: Styles.bgColor, width: 3)),
                ),
                Expanded(
                  child: MediaQuery.removeViewPadding(
                    context: context,
                    removeTop: true,
                    child: ListView.separated(
                        shrinkWrap: true,
                        controller: _controller,
                        itemBuilder: (c, i) {
                          final vp =
                              VeterinaryDetails.fromJson(veterinaryPackage[i]);
                          return VetCard(vp);
                        },
                        separatorBuilder: (c, i) {
                          return const Gap(12);
                        },
                        itemCount: veterinaryPackage.length),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 50,
            left: 15,
            right: 15,
            child: Row(
              children: [
                const PetBackButton(),
                const Gap(20),
                Text('Vétérinaire',
                    style: TextStyle(
                        color: Styles.blackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18))
              ],
            ),
          )
        ],
      ),
    );
  }
}
