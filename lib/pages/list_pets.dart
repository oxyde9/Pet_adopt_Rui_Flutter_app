import 'package:pet/models/configuration.dart';
import 'package:pet/pages/pet_details.dart';
import 'package:pet/utils/layouts.dart';
import 'package:pet/utils/styles.dart';
import 'package:pet/widgets/back_button.dart';
import 'package:pet/widgets/package_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class ListPets extends StatefulWidget {
  @override
  _ListPetsState createState() => _ListPetsState();
}

class _ListPetsState extends State<ListPets> {
  @override
  Widget build(BuildContext context) {
    final size = Layouts.getSize(context);
    return Material(
        child: SingleChildScrollView(
            child: Column(children: [
      Stack(
        children: [
          TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: 1),
              duration: const Duration(milliseconds: 500),
              builder: (context, value, _) {
                return Stack(
                  children: [
                    Container(
                      width: value * size.width,
                      height: value * size.width,
                      decoration: BoxDecoration(
                          color: Styles.bgColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(value * size.width / 2),
                            bottomRight:
                                Radius.circular(value * size.width / 2),
                          )),
                      child: Column(
                        children: [
                          Gap(value * 50),
                          AnimatedSize(
                            curve: Curves.bounceInOut,
                            duration: const Duration(seconds: 1),
                            child: SvgPicture.asset(
                              'assets/svg/person.svg',
                              height: value * 300,
                            ),
                          ),
                          Gap(value * 20),
                        ],
                      ),
                    ),
                    const Positioned(left: 15, top: 50, child: PetBackButton()),
                  ],
                );
              }),
        ],
      ),
      Container(
        child: ListView.builder(
          physics: ScrollPhysics(),
          itemCount: catMapList.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PetDetails(
                              catDetailsMap: catMapList[index],
                            )));
              },
              child: Container(
                height: 230,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: (index % 2 == 0)
                                  ? Styles.highlightColor
                                  : Styles.bgColor,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: shadowList,
                            ),
                            margin: EdgeInsets.only(top: 40),
                          ),
                          Align(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Hero(
                                tag: 'pet${catMapList[index]['id']}',
                                child: Image.asset(
                                    catMapList[index]['imagePath'])),
                          )),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 65, bottom: 20),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          boxShadow: shadowList,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  catMapList[index]['name'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21.0,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                (catMapList[index]['sex'] == 'male')
                                    ? Icon(
                                        Icons.male_rounded,
                                        color: Colors.grey[500],
                                      )
                                    : Icon(
                                        Icons.female_rounded,
                                        color: Colors.grey[500],
                                      ),
                              ],
                            ),
                            Text(
                              catMapList[index]['Species'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[500],
                              ),
                            ),
                            Text(
                              catMapList[index]['year'] + ' ans',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[400],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: primaryColor,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  'Distance: ' + catMapList[index]['distance'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ])));
  }
}
