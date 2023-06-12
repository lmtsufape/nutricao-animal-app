import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';

import '../../shared/constants/style_constants.dart';

class TextFieldCustom extends StatelessWidget {
  final String _fieldLabel;
  final TextEditingController controller;
  final String label;

  const TextFieldCustom(this._fieldLabel, this.controller, this.label,
      {super.key});

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _fieldLabel,
            style: TextStyle(
                color: kSecondaryColor, fontSize: heightScreen * kMediumSize),
          ),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              label: Text(label),
              contentPadding: EdgeInsets.all(14),
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldCustomDate extends StatefulWidget {
  final String _fieldLabel;
  TextEditingController controller;
  int? age;

  TextFieldCustomDate(this._fieldLabel, this.controller, this.age, {super.key});

  @override
  State<TextFieldCustomDate> createState() => _TextFieldCustomDateState();
}

class _TextFieldCustomDateState extends State<TextFieldCustomDate> {
  DateTime _datept = DateTime.now();
  String date = 'dd/mm/aaaa';
  DateTime today = DateTime.now();
  int age = 0;

  getDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2010),
            lastDate: DateTime(2025))
        .then((value) {
      setState(() {
        if (value != null) {
          _datept = value;
          age = today.year - _datept.year;
          date = DateFormat(DateFormat.YEAR_MONTH_DAY, "pt_Br").format(_datept);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.controller.text = date;
    final heightScreen = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget._fieldLabel,
            style: TextStyle(
                color: kSecondaryColor, fontSize: heightScreen * kMediumSize),
          ),
          InkWell(
            onTap: () => getDate(),
            child: TextField(
              enabled: false,
              controller: widget.controller,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                label: Text(date.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                    )),
                contentPadding: const EdgeInsets.all(14),
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_month_outlined,
                        color: kDetailColor),
                    onPressed: () => getDate()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class textFieldCustomTutorial extends StatefulWidget {
  final String _fieldLabel;
  final TextEditingController controller;
  final String label;

  const textFieldCustomTutorial(this._fieldLabel, this.controller, this.label,
      {super.key});

  @override
  State<textFieldCustomTutorial> createState() =>
      _textFieldCustomTutorialState();
}

class _textFieldCustomTutorialState extends State<textFieldCustomTutorial> {
  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget._fieldLabel,
            style: TextStyle(
                color: kSecondaryColor, fontSize: heightScreen * kMediumSize),
          ),
          Row(
            children: [
              SizedBox(
                width: widthScreen * 0.8,
                child: TextField(
                  controller: widget.controller,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    label: Text(widget.label),
                    contentPadding: EdgeInsets.all(14),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.question_mark,
                    color: Colors.red,
                    size: heightScreen * 0.05,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
