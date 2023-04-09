import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../Utils/constants.dart';
class Knowledge extends StatelessWidget {
  const Knowledge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child:
              Text('Knowledge', style: Theme.of(context).textTheme.subtitle2),
        ),
        const KnowledgeText(
          title: 'Flutter,dart',
        ),
        const KnowledgeText(
          title: 'State Management',
        ),
        const KnowledgeText(
          title: 'GIT Knowledge',
        ),
      ],
    );
  }
}

class KnowledgeText extends StatelessWidget {
  const KnowledgeText({Key? key , required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(defaultPadding/4),
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/check.svg'),
          const SizedBox(width: defaultPadding / 2,),
          Text(title)
        ],
      ),
    );
  }
}

