import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckBoxState extends StatelessWidget {

  final String text;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const CheckBoxState({
    super.key,
    required this.text,
    required this.value,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {

    return CheckboxListTile(
      title: Text(text),
      value: value,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}