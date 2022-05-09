// ================= Radio Buttons =================
import 'package:flutter/material.dart';
import 'package:wiki_places/global/types.dart';

class RadioButtons extends StatefulWidget {
  const RadioButtons({this.options = const [], this.controller, this.onChangeCallback, this.isDisabled = false, Key? key}) : super(key: key);
  final List<String> options;
  final PrimitiveWrapper? controller;
  final Function? onChangeCallback;
  final bool isDisabled;

  @override
  State<RadioButtons> createState() => _RadioButtonsState();
}

class _RadioButtonsState extends State<RadioButtons> {
  void _activateRadioButton(String? value) {
    if (widget.controller != null && value != null) {
      setState(() {
        widget.controller!.value = value;
        if (widget.onChangeCallback != null) {
          widget.onChangeCallback!(value);
        }
      });
    }
  }

  List<Widget> get _radioButtonOptions {
    List<Widget> buttonOptions = [];
    for (String data in widget.options) {
      buttonOptions.add(Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Radio<String>(
            activeColor: widget.isDisabled ? Colors.black38 : null,
            value: data,
            groupValue: widget.controller!.value,
            onChanged: widget.isDisabled ? null : _activateRadioButton,
          ),
          Text(data),
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