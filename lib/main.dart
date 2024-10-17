import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'apiController.dart';
import 'package:get/get.dart';
import 'detailsScreen.dart';
import 'producttile.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => HomeMain(),
      DetailsPage.detailsProduct: (context) => DetailsPage(),
    },
  ));
}

class HomeMain extends StatelessWidget {
  final PersonController personController = Get.put(PersonController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                FontAwesomeIcons.cartShopping,
                color: Colors.black,
              ),
            )
          ],
          bottom: PreferredSize(
              preferredSize: const Size(double.infinity, 70),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Employes",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[850]),
                      ),
                    ),
                    const TabBar(
                        indicatorWeight: 2,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.black,
                        labelPadding: EdgeInsets.symmetric(vertical: 10),
                        tabs: [
                          Text(
                            "Work Rate",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            "Projects",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            "Skills",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            "CTC",
                            style: TextStyle(color: Colors.black),
                          ),
                        ])
                  ],
                ),
              )),
        ),
        body: Obx(() {
          if (personController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 15,
                  crossAxisCount: 2,
                  childAspectRatio: .7),
              itemCount: personController.personList.length,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) {
                return PersonTile(personController.personList[index], index);
              },
            );
          }
        }),
      ),
    );
  }
}
