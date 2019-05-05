import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../utils.dart';
import './types.dart';

class InputContainer extends StatefulWidget {
  InputContainer({@required this.onSubmitCity, @required this.currentCity})
      : super(key: ObjectKey("inputContainer"));

  final SubmitCityCallback onSubmitCity;
  final String currentCity;

  @override
  createState() => InputContainerState();
}

class InputContainerState extends State<InputContainer> {
  String _cityText = '';
  TextEditingController _controller = new TextEditingController();

  void _handleSubmitCity() {
    widget.onSubmitCity(_cityText);
    _controller.clear();
  }

  void _handleTextChanged(city) => setState(() => _cityText = city);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: Text(
              capitalize(widget.currentCity),
              style: getTextStyle(fontSize: 35.0),
            ),
            flex: 6),
        Expanded(
            flex: 4,
            child: TextField(
              style: getTextStyle(),
              controller: _controller,
              decoration: InputDecoration(
                  hintText: 'Enter city',
                  hintStyle: getTextStyle(fontSize: 16.0, color: Colors.grey),
                  enabledBorder: new UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white))),
              onChanged: _handleTextChanged,
            )),
        Expanded(
            flex: 3,
            child: CupertinoButton(
              child: Text(
                "Submit",
                style: getTextStyle(fontSize: 12.0),
              ),
              onPressed: _handleSubmitCity,
              color: Colors.grey,
            ))
      ],
    );
  }
}
