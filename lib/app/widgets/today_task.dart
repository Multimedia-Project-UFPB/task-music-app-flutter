import 'package:flutter/material.dart';
import 'package:task_music/app/widgets/custom_button.dart';

class TodayTask extends StatelessWidget {
  final String title;
  final String description;
  const TodayTask(
    Key? key,
    this.title,
    this.description,
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _query = MediaQuery.of(context);
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        width: _query.size.width * 0.9,
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 20,
                        left: 20,
                        top: 30,
                        bottom: 20,
                      ),
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, bottom: 5, right: 20),
                    child: Text(description,
                        style: Theme.of(context).textTheme.bodySmall),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  icon: Icons.close_rounded,
                  function: () {},
                ),
                CustomButton(
                  icon: Icons.play_arrow_outlined,
                  function: () {},
                ),
                CustomButton(
                  icon: Icons.check,
                  function: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
