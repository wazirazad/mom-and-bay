import 'package:flutter/material.dart';
import 'package:health/models/health_care_model.dart';
import 'package:health/util/pregnancy_care_handler.dart';
class ScreenBody extends StatelessWidget {
  const ScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PregnancyCareModel>>(
        future: PregnancyCareHandler.getAllAfterBabyBornTips(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<PregnancyCareModel> healthcare = snapshot.data;
            return ListView.builder(
                itemCount: healthcare.length,
                itemBuilder: (context, index) {
                  PregnancyCareModel pregnancyCare = healthcare[index];
                  return Column(
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
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
