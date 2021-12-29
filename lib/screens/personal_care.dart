import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:health/widgets/app_drawer.dart';
import 'package:health/widgets/menu_design.dart';
import 'package:health/widgets/strings.dart';

import 'home_screen.dart';

class YourPersonalCare extends StatelessWidget {
  const YourPersonalCare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              padding: const EdgeInsets.only(right: 40),
                onPressed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx){
                 return const HomeScreen();
                }));
                },
                icon: const Icon(Icons.arrow_back_ios_outlined,color: Colors.white,)
            ),
            const Padding(
              padding: EdgeInsets.only(left: 18.0),
              child: Text(
                'Your Personal Care',textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        actions: [
          Builder(builder: (context) {
            return TextButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              child: const Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            );
          })
        ],
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Your Personal Care',
                style:  TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Your personal details',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                Message.personalDetail,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'About me',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                Message.about,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 22,
              ),
              MenuDesign(string: 'About me', color: Colors.red, ontap: () {
                print('hell');
              }),
              const SizedBox(
                height: 14,
              ),
              const Text(
                'Personalised care and support plans',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MenuDesign(
                  string: 'Health and wellbeing in pregnancy',
                  color: Colors.orangeAccent.shade100,
                  ontap: () {}),
              const SizedBox(
                height: 16,
              ),
              MenuDesign(
                  string: 'Personalised birth preferences',
                  color: Colors.purpleAccent.shade100,
                  ontap: () {}),
              const SizedBox(
                height: 16,
              ),
              MenuDesign(
                  string: 'After your baby is born',
                  color: Colors.lightBlue.shade100,
                  ontap: () {}),
              const SizedBox(
                height: 16,
              ),
              MenuDesign(
                  string: 'Birth reflections',
                  color: Colors.blueGrey.shade100,
                  ontap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
