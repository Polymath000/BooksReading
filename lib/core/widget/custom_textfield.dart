import 'package:flutter/material.dart';

class CustomFormTextField extends StatefulWidget {
  CustomFormTextField({
    super.key,
    required this.hint,
    required this.keyboardType,
    this.eyeIconIsVisible = false,
    this.onSaved,
    this.maxLines = 1,
    required this.validator,
    required this.intialValue,
  });
  final String intialValue;
  int maxLines;
  final String hint;
  final TextInputType keyboardType;
  final bool eyeIconIsVisible;
  void Function(String?)? onSaved = (value) {};
  String? Function(String?) validator;
  @override
  State<CustomFormTextField> createState() => _CustomFormTextFieldState();
}

class _CustomFormTextFieldState extends State<CustomFormTextField> {
  late bool isObscure;

  @override
  void initState() {
    super.initState();
    isObscure = widget.eyeIconIsVisible; // Only obscure if eye icon is visible
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.intialValue,
      maxLines: widget.maxLines,
      onSaved: widget.onSaved,
      autovalidateMode: AutovalidateMode.disabled,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      obscureText: widget.eyeIconIsVisible ? isObscure : false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        suffixIcon: widget.eyeIconIsVisible
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                child: Icon(
                  isObscure
                      ? Icons.remove_red_eye_outlined
                      : Icons.visibility_off_outlined,
                  color: Colors.grey,
                  size: 24,
                ),
              )
            : null,
        hintText: widget.hint,
        filled: true,
        fillColor: const Color(0xFFFFFFFF),
        border: BuildBorder(),
        enabledBorder: BuildBorder(),
        focusedBorder: BuildBorder().copyWith(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 50, 139, 139),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder BuildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Color(0xFFE6E9E9), width: 1),
    );
  }
}
