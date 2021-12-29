import 'package:flutter/material.dart';
import 'package:health/models/health_care_model.dart';
import 'package:health/widgets/app_drawer.dart';
class AfterBornDetialScreen extends StatelessWidget {
  final PregnancyCareModel pregnancyCareModel;
  const AfterBornDetialScreen({Key? key,required this.pregnancyCareModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
                padding: const EdgeInsets.only(right: 40),
                onPressed: (){
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios_outlined,color: Colors.white,)
            ),
            const Padding(
              padding: EdgeInsets.only(left: 18.0),
              child: Text(
                'After your baby is born',textAlign: TextAlign.center,
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
      body:  Center(child: Text(pregnancyCareModel.message)),
    );
  }
}
