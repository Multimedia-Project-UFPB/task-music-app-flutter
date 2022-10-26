import 'package:flutter/material.dart';
import 'package:task_music/app/widgets/input_button.dart';

class InputTime extends StatelessWidget {
  final int value;
  final void Function()? inc;
  final void Function()? dec;
  final Text tittle;

  const InputTime({
    Key? key,
    required this.value,
    this.inc,
    this.dec,
    required this.tittle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        tittle,
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputButton(
              function: dec,
              icon: Icons.arrow_downward_rounded,
            ),
            Text('$value min'),
            InputButton(
              function: inc,
              icon: Icons.arrow_upward_rounded,
            ),
          ],
        )
      ],
    );
  }
}
