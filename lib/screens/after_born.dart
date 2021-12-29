import 'package:flutter/material.dart';
import 'package:health/models/health_care_model.dart';
import 'package:health/util/pregnancy_care_handler.dart';
import 'package:health/widgets/app_drawer.dart';

import 'after_born_detial_screen.dart';

class AfterBabyBorn extends StatelessWidget {
  const AfterBabyBorn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
        title: const Text(
          'After your baby is born',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
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
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'After Your Baby is Born',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            Expanded(
              child: FutureBuilder<List<PregnancyCareModel>>(
                  future: PregnancyCareHandler.getAllAfterBabyBornTips(context),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      List<PregnancyCareModel> healthcare = snapshot.data;
                      return ListView.builder(
                          itemCount: healthcare.length,
                          itemBuilder: (context, index) {
                            PregnancyCareModel pregnancyCare = healthcare[index];
                            return InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                                return AfterBornDetialScreen(pregnancyCareModel: pregnancyCare);
                                }));
                              },
                              child: Column(
                                children: [
                                  const Divider(
                                    color: Colors.red,
                                    thickness: 2,
                                  ),
                                  const SizedBox(
                                    height: 0.9,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                            child: Container(
                                                height: 120,
                                                width: 80,
                                                child: Text(
                                                  pregnancyCare.message,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ))),
                                        Expanded(
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/after_baby_born/${pregnancyCare.image}'),
                                            height: 130,
                                            width: 150,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
