import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final double? size;
  final void Function()? function;

  const CustomButton({
    Key? key,
    required this.icon,
    this.function,
    this.color,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => IconButton(
        onPressed: function,
        icon: Icon(
          icon,
          color: color,
          size: size,
        ),
        iconSize: 25,
      ),
    );
  }
}
