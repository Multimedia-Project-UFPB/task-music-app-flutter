import 'package:flutter/material.dart';

// Widget
import 'package:task_music/app/widgets/custom_button.dart';

class InputTime extends StatelessWidget {
  final int value;
  final void Function()? inc;
  final void Function()? dec;
  final String title;

  const InputTime({
    Key? key,
    required this.value,
    this.inc,
    this.dec,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              function: dec,
              icon: Icons.arrow_downward_rounded,
            ),
            Text(
              '$value min',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            CustomButton(
              function: inc,
              icon: Icons.arrow_upward_rounded,
            ),
          ],
        )
      ],
    );
  }
}
