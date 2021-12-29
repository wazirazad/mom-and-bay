import 'package:flutter/material.dart';
import 'package:health/widgets/app_drawer.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'add_appointment_screen.dart';
import 'home_screen.dart';

class AppointmentsScreen extends StatelessWidget {
  AppointmentsScreen({Key? key}) : super(key: key);
  var date = DateTime.now();

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
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (ctx) {
                    return const HomeScreen();
                  }));
                },
                icon: const Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.white,
                )),
            const Padding(
              padding: EdgeInsets.only(left: 18.0),
              child: Text(
                'Appointment',
                textAlign: TextAlign.center,
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Center(
              child: TableCalendar(
                focusedDay: DateTime.now(),
                firstDay: DateTime(2000),
                lastDay: DateTime(2050),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                Text(
                  '${DateFormat('MMMM').format(date)} Appointments',
                  style: const TextStyle(fontSize: 17),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle_outlined),
                  color: Colors.red,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddAppointmentScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green[400], onPrimary: Colors.white),
                    icon: const Icon(
                      Icons.search,
                      size: 40,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                    label: const Text(
                      'VIEW ALL',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
