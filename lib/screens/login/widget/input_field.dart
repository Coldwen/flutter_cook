import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextInputType inputType;
  final ValueChanged<String>? onChange;
  final bool passwordVisible;

  const InputField({
    Key? key,
    required this.hint,
    required this.icon,
    required this.onChange,
    this.inputType = TextInputType.text,
    this.passwordVisible = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      autocorrect: false,
      keyboardType: inputType,
      enabled: true,
      obscureText: passwordVisible,
      decoration: InputDecoration(
        //背景颜色，必须结合filled: true,才有效
        fillColor: Colors.grey[50],
        filled: true,
        //初始状态的输入框样式
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.red, width: 0.9),
        ),
        prefixIcon: Icon(icon),
        labelText: hint,
        labelStyle: const TextStyle(fontSize: 15, color: Colors.black45),
        //编辑状态下的输入框样式
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.grey.shade50),
        ),
        //不可编辑状态下的输入框样式
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.grey.shade50),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
      onChanged: onChange,
    );
  }
}
