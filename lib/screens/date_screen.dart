import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateScreen extends StatefulWidget {
  const DateScreen({super.key});

  @override
  State<DateScreen> createState() => _DateScreenState();
}

class _DateScreenState extends State<DateScreen> {
  final DateFormat _dateFormat = DateFormat('dd-MM-yyyy');
  DateTime _selectedDate = DateTime.now();

  void _showDateAndroid(context) async {
    final datePick = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: _selectedDate.subtract(const Duration(days: 30)),
      lastDate: DateTime(_selectedDate.year + 1),
    );

    if (datePick != null) {
      setState(() {
        _selectedDate = datePick;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Selected Date : ${_dateFormat.format(_selectedDate)}'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _showDateAndroid(context),
            child: const Text('Pick Date'),
          ),
        ],
      ),
    );
  }
}
