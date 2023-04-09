import 'package:flutter/material.dart';
import '../../Utils/constants.dart';

class Coding extends StatelessWidget {
  const Coding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text('Coding', style: Theme.of(context).textTheme.subtitle2),
        ),
        const AnimatedLinearProgressIndicator(
          title: "Dart",
          value1: 0.7,
        ),
        const AnimatedLinearProgressIndicator(
          title: "Java",
          value1: 0.8,
        ),
        const AnimatedLinearProgressIndicator(
          title: "HTML",
          value1: 0.8,
        ),
        const AnimatedLinearProgressIndicator(
          title: "CSS",
          value1: 0.7,
        ),
        const AnimatedLinearProgressIndicator(
          title: "JavaScript",
          value1: 0.6,
        ),
        const AnimatedLinearProgressIndicator(
          title: "Python",
          value1: 0.6,
        ),
      ],
    );
  }
}

class AnimatedLinearProgressIndicator extends StatelessWidget {
  const AnimatedLinearProgressIndicator(
      {Key? key, required this.title, required this.value1})
      : super(key: key);

  final String title;
  final double value1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: defaultDuration,
            builder: (context, double value, child) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text('${(value1 * 100).toInt()}%')
                  ],
                ),
                const SizedBox(
                  height: defaultPadding / 2,
                ),
                LinearProgressIndicator(
                  value: value1,
                  color: primaryColor,
                  backgroundColor: darkColor,
                ),
              ],
            )),
        const SizedBox(height: defaultPadding / 2),
      ],
    );
  }
}



