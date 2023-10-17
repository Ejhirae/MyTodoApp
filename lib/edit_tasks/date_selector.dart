import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

class DateSelector extends StatefulWidget {
  const DateSelector({super.key});

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  final TextEditingController dateController = TextEditingController();
  DateTime dateNow = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: true,
      readOnly: true,
      controller: dateController,
      // style: const TextStyle(
      //   color: Colors.black,
      //   fontSize: 12,
      //   fontWeight: FontWeight.normal,
      // ),
      autofocus: false,
      keyboardType: TextInputType.datetime,
      textInputAction: TextInputAction.next,
      onTap: () async {
        DateTime? newDate = await showDatePicker(
            context: context,
            initialDate: dateNow,
            firstDate: dateNow,
            lastDate: DateTime(2100));
        if (newDate == null) return;
        final ageVerif = DateTime.now().difference(newDate);
        if (ageVerif.inDays >= 6570 && ageVerif.inDays >= 365) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('You are eligible to register')));
          print(dateController.text);
          setState(() {
            String convertedNewDate = DateFormat('yyyy-mm-dd').format(newDate);
            dateController.text = convertedNewDate;
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('You must be 18 or older to register')));
        }
      },
    );
  }
}
