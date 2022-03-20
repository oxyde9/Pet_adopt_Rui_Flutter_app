import 'package:pet/pages/list_pets.dart';
import 'package:pet/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class PetCard extends StatefulWidget {
  final double? height;
  final String petPath;
  final String petName;
  const PetCard(
      {Key? key, required this.petPath, required this.petName, this.height})
      : super(key: key);

  @override
  State<PetCard> createState() => _PetCardState();
}

class _PetCardState extends State<PetCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: InkWell(
        child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: const Duration(seconds: 1),
            builder: (context, value, _) {
              return Container(
                width: double.infinity,
                height: 205.0 * value,
                decoration: BoxDecoration(
                    color: Styles.bgColor,
                    borderRadius: BorderRadius.circular(27)),
                child: FittedBox(
                  child: Column(
                    children: [
                      const Gap(15),
                      SizedBox(
                          height: 95.0 * value,
                          child: SvgPicture.asset(widget.petPath,
                              height: widget.height ?? 95)),
                      const Gap(10),
                      Text(
                        widget.petName,
                        style: TextStyle(
                            color: Styles.highlightColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const Gap(5),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
