import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'detailsScreen.dart';
import 'model.dart';

class PersonTile extends StatelessWidget {
  final PersonModel person;
  final int index;

  PersonTile(this.person, this.index);

  void NavDetailsPage(BuildContext context, int index) {
    Navigator.of(context).pushNamed(DetailsPage.detailsProduct, arguments: {
      "name": person.name.toString(),
      "position": person.position.toString(),
      "image": person.image.toString(),
      "description": person.description.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => NavDetailsPage(context, index),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(person.image ?? ""),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 8),
              child: Text(
                person.name ?? "",
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 3),
              child: Row(
                children: [
                  const Icon(
                    FontAwesomeIcons.idBadge,
                    size: 15,
                  ),
                  SizedBox(width: 5),
                  Text(
                    person.position ?? "",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
