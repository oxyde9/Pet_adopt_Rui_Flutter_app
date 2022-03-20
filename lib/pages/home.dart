import 'package:pet/pages/grooming_page.dart';
import 'package:pet/pages/list_pets.dart';
import 'package:pet/pages/vet_page.dart';
import 'package:pet/utils/layouts.dart';
import 'package:pet/utils/styles.dart';
import 'package:pet/widgets/animated_title.dart';
import 'package:pet/widgets/pet_card.dart';
import 'package:pet/widgets/stories_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = Layouts.getSize(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Styles.bgColor,
        title: Image.asset(
          'assets/svg/sticker.png',
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text('Hānai holoholona'),
            ),
            ListTile(
              title: const Text('Adopt'),
              leading: ImageIcon(
                AssetImage("assets/nav_icons/dog_icon.png"),
                color: Styles.bgColor,
              ),
            ),
            ListTile(
              title: const Text('Toilettage'),
              leading: ImageIcon(
                AssetImage("assets/nav_icons/cut_icon.png"),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => GroomingPage()));
              },
            ),
            ListTile(
              title: const Text('Vet'),
              leading: ImageIcon(
                AssetImage("assets/nav_icons/vet_icon.png"),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => VetPage()));
              },
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          const Gap(35),
          const AnimatedTitle(title: 'Vous cherchez qui ?'),
          const Gap(10),
          Row(
            children: const [
              PetCard(petPath: 'assets/svg/cat1.svg', petName: 'Chats'),
              Gap(28),
              PetCard(
                petPath: 'assets/svg/dog1.svg',
                petName: 'Chiens',
                height: 68,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 25),
            width: double.infinity,
            height: 50,
            child: FittedBox(
              child: Column(
                children: [
                  AnimatedScale(
                    duration: const Duration(milliseconds: 800),
                    scale: 1.5,
                    curve: Curves.bounceInOut,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => ListPets()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Les animaux',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Styles.highlightColor)),
                          const Gap(5),
                          SvgPicture.asset(
                            'assets/svg/arrow_right.svg',
                            height: 14,
                            width: 14,
                          )
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        fixedSize: const Size(90, 0),
                        primary: Styles.bgWithOpacityColor,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                      ),
                    ),
                  ),
                  const Gap(5),
                ],
              ),
            ),
          ),
          const Gap(25),
          const AnimatedTitle(title: 'Communauté'),
          const Gap(10),
          TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: 1),
              duration: const Duration(milliseconds: 500),
              builder: (context, value, _) {
                return Stack(
                  children: [
                    Container(
                      height: 150,
                      alignment: Alignment.bottomCenter,
                      child: Stack(
                        children: [
                          Container(
                            height: 135,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Styles.bgColor,
                                borderRadius: BorderRadius.circular(27)),
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(
                                right: 12,
                                left: Layouts.getSize(context).width * 0.37,
                                top: 15,
                                bottom: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Rejoignez \nnous',
                                  style: TextStyle(
                                      fontSize: value * 27,
                                      fontWeight: FontWeight.bold,
                                      color: Styles.blackColor,
                                      height: 1),
                                ),
                                const Gap(12),
                                AnimatedOpacity(
                                  duration: const Duration(milliseconds: 1500),
                                  opacity: value,
                                  child: Text(
                                    'Partagez vos moments avec d\'autres parents d\'animaux.',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Styles.blackColor,
                                        fontSize: 12),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 12,
                      bottom: 0,
                      child: SvgPicture.asset(
                        'assets/svg/person.svg',
                        height: value * 150,
                      ),
                    ),
                  ],
                );
              }),
          const Gap(25),
          const AnimatedTitle(title: 'Quelques uns de nos amis'),
          const Gap(10),
          const StoriesSection()
        ],
      ),
    );
  }
}
