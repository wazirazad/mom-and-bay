import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health/widgets/app_drawer.dart';
import 'package:intl/intl.dart';
class AddAppointmentScreen extends StatefulWidget {
  const AddAppointmentScreen({Key? key}) : super(key: key);

  @override
  _AddAppointmentScreenState createState() => _AddAppointmentScreenState();
}

class _AddAppointmentScreenState extends State<AddAppointmentScreen> {
  late String _setTime, _setDate;
  late String _hour, _minute, _time;
  late String dateTime;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = const TimeOfDay(hour: 00, minute: 00);
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
    }
  }

  @override
  initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());

    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }
  var _light1 = false;
  var _light2 = false;
  @override
  Widget build(BuildContext context) {
    dateTime = DateFormat.yMd().format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Add Appointment',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Type of appointment',
                  ),
                ),
              ),
              Row(
                children: [
                  const Text(
                    'Date  ',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Container(
                      width: 110,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextFormField(
                        style:
                            const TextStyle(fontSize: 17, color: Colors.white),
                        textAlign: TextAlign.center,
                        enabled: false,
                        keyboardType: TextInputType.text,
                        controller: _dateController,
                        onSaved: (var val) {
                          _setDate = val!;
                        },
                        decoration: const InputDecoration(
                          disabledBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  const Text(
                    'Time  ',
                    style: TextStyle(fontSize: 17),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      _selectTime(context);
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextFormField(
                        style:
                            const TextStyle(fontSize: 17, color: Colors.white),
                        textAlign: TextAlign.center,
                        onSaved: (var val) {
                          _setTime = val!;
                        },
                        enabled: false,
                        keyboardType: TextInputType.text,
                        controller: _timeController,
                        decoration: const InputDecoration(
                          disabledBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Location (optional)',
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'HealthCare Professional (optional)',
                ),
              ),
              Container(
                  height: 40,
                  padding: const EdgeInsets.only(left: 10),
                  color: Colors.grey[350],
                  child: const Center(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Alerts (Optional)',
                      ),
                    ),
                  )),
              MergeSemantics(
                child: ListTile(
                  title: const Text('1 day before'),
                  trailing: CupertinoSwitch(
                    value: _light1,
                    onChanged: (bool value) {
                      setState(() {
                        _light1 = value;
                      });
                    },
                  ),
                  onTap: () {
                    setState(() {
                      _light1 = !_light1;
                    });
                  },
                ),
              ),
              const Divider(color: Colors.grey,thickness: 1.2,),
              MergeSemantics(
                child: ListTile(
                  title: const Text('1 week before'),
                  trailing: CupertinoSwitch(
                    value: _light2,
                    onChanged: (bool value) {
                      setState(() {
                        _light2 = value;
                      });
                    },
                  ),
                  onTap: () {
                    setState(() {
                      _light2 = !_light2;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
