import 'package:flutter/material.dart';
import 'package:health/screens/after_born.dart';
import 'package:health/screens/labour_and_birth.dart';
import 'package:health/screens/personal_care.dart';
import 'package:health/screens/ready_for_birth.dart';
import 'package:health/screens/your_pregnancy.dart';
class AppDrawer extends StatelessWidget {
   AppDrawer({Key? key}) : super(key: key);
   var search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.white),
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'mum & baby',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(height: 17,),
                  TextField(
                    controller: search,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      filled: true,
                      fillColor: Colors.deepOrangeAccent[100],
                      hintText: 'Search',hintStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(Icons.search,color: Colors.white,),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear,color: Colors.white,),
                        onPressed: (){
                          search.clear();
                        },
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.border_inner_outlined,
                color: Colors.red,
              ),
              title: const Text(
                'Maternity units',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.developer_board,
                color: Colors.red,
              ),
              title: const Text(
                'Personalised care and\nsupport plans',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                  return const YourPersonalCare();
                }));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.date_range_sharp,
                color: Colors.red,
              ),
              title: const Text(
                'Appointments',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                //.of(context).pushNamed(VenueScreen.routeName);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.red,
              ),
              title: const Text(
                'Your pregnancy',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                  return const YourPregnancy();
                }));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.red,
              ),
              title: const Text(
                'Getting ready for birth',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                  return const GettingReadyForBirth();
                }));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.red,
              ),
              title: const Text(
                'Labour and birth',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                  return const LabourAndBirth();
                }));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.red,
              ),
              title: const Text(
                'After your baby is born',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                  return const AfterBabyBorn();
                }));
              },
            ),
            const Divider(
              color: Colors.red,
              thickness: 1.9,
            ),
            ListTile(
              title: const Text(
                'Your due date',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text(
                'Get involved',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text(
                'Feedback',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text(
                'Donation',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text(
                'Backup',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text(
                'About this app',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text(
                'Contact us',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
