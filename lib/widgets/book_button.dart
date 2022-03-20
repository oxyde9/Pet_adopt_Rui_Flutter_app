import 'package:pet/pages/cabinet_vet.dart';
import 'package:pet/utils/styles.dart';
import 'package:flutter/material.dart';

class BookButton extends StatelessWidget {
  const BookButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => CabinetVet()));
      },
      child: const Text('Voir un Veterinaire',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: Styles.highlightColor,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
      ),
    );
  }
}
