import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class InputButton extends StatelessWidget {
  final IconData icon;
  final void Function()? function;

  const InputButton({
    Key? key,
    required this.icon,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => IconButton(
        onPressed: function,
        icon: Icon(icon),
        iconSize: 25,
      ),
    );
  }
}
