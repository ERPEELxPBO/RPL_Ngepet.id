import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final VisualDensity? visualDensity;
  final Color activeColor;

  const CustomCheckbox({
    required this.value,
    required this.onChanged,
    this.visualDensity,
    this.activeColor = Colors.blue, // Sesuaikan dengan warna pilihan Anda
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onChanged != null) {
          onChanged!(!value);
        }
      },
      child: Container(
        width: 18,
        height: 18,
        decoration: BoxDecoration(
          color: value ? activeColor : Colors.transparent,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 1.0,
            color: value ? activeColor : Colors.black,
          ),
        ),
        child: value
            ? Icon(
                Icons.check,
                size: 12,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
