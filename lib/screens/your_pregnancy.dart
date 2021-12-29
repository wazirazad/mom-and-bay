import 'package:flutter/material.dart';
import 'package:health/models/health_care_model.dart';
import 'package:health/util/pregnancy_care_handler.dart';
import 'package:health/widgets/app_drawer.dart';

class YourPregnancy extends StatelessWidget {
  const YourPregnancy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Your Pregnancy',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
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
              'Your Pregnancy',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            Expanded(
              child: FutureBuilder<List<PregnancyCareModel>>(
                  future: PregnancyCareHandler.getAllYourPregnancy(context),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      List<PregnancyCareModel> healthcare = snapshot.data;
                      return ListView.builder(
                          itemCount: healthcare.length,
                          itemBuilder: (context, index) {
                            PregnancyCareModel pregnancyCare = healthcare[index];
                            return InkWell(
                              onTap: (){
                                print(pregnancyCare.message);
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
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
                                                'assets/images/your_pregnancy/${pregnancyCare.image}'),
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
