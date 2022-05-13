// ================= Radio Buttons =================
import 'package:flutter/material.dart';
import 'package:wiki_places/global/types.dart';

class RadioButtons extends StatefulWidget {
  const RadioButtons({required this.options, required this.controller, this.onChangeCallback, this.isDisabled = false, Key? key}) : super(key: key);
  final List<Json> options;  // {'value': dynamic, 'name': String}
  final PrimitiveWrapper controller;
  final Function? onChangeCallback;
  final bool isDisabled;

  @override
  State<RadioButtons> createState() => _RadioButtonsState();
}

class _RadioButtonsState extends State<RadioButtons> {
  void _activateRadioButton(EPlaceMode? value) {
    if (value != null) {
      setState(() {
        widget.controller.value = value;
        if (widget.onChangeCallback != null) {
          widget.onChangeCallback!(value);
        }
      });
    }
  }

  List<Widget> get _radioButtonOptions {
    List<Widget> buttonOptions = [];
    for (Json data in widget.options) {
      buttonOptions.add(Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Radio<EPlaceMode>(
            activeColor: widget.isDisabled ? Colors.black38 : null,
            value: data["value"],
            groupValue: widget.controller.value,
            onChanged: widget.isDisabled ? null : _activateRadioButton,
          ),
          Text(data["name"]),
        ],
      ));
    }
    return buttonOptions;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      children: _radioButtonOptions,
    );
  }
}