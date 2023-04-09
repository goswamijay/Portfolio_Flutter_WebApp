import 'package:flutter/material.dart';
import '../../Utils/constants.dart';
class Skill extends StatelessWidget {
  const Skill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Padding(
          padding:
           const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text('Skills',
              style: Theme.of(context).textTheme.subtitle2),
        ),
        Row(
          children: const [
            Expanded(
              child: AnimatedCircularProgressIndicator(
                  title: "Flutter", value1: 0.8),
            ),
            SizedBox(width: defaultPadding),
            Expanded(
              child: AnimatedCircularProgressIndicator(
                  title: "Android", value1: 0.7),
            ),
            SizedBox(width: defaultPadding),

            Expanded(
              child: AnimatedCircularProgressIndicator(
                  title: "Firebase", value1: 0.6),
            )
          ],
        )
      ],
    );
  }
}

class AnimatedCircularProgressIndicator extends StatelessWidget {
  const AnimatedCircularProgressIndicator(
      {Key? key, required this.title, required this.value1})
      : super(key: key);

  final String title;
  final double value1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              duration: defaultDuration,
              builder: (context, double value, child) => Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: value1,
                    color: primaryColor,
                    backgroundColor: darkColor,
                  ),
                  Center(
                      child: Text(
                        "${(value1 * 100).toInt()}%",
                        style: Theme.of(context).textTheme.subtitle2
                      ))
                ],
              )),
        ),
        const SizedBox(
          height: defaultPadding / 2,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle2,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}

