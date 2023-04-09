import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

import '../../Utils/constants.dart';

class MyInfo extends StatelessWidget {
  const MyInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final service = FlutterBackgroundService();

    return  AspectRatio(aspectRatio: 1.23,child: Container(
      color: const Color(0xFF242430),
      child: Column(
        children:  [
          const Spacer(flex: 2),
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/87259343?v=4'),
          ),
          const Spacer(),
          Text("Jay Goswami",style: Theme.of(context).textTheme.subtitle2,),
           const Text("Working as intern at a \n Cybercom Creation Company",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500,height: 1.5,color: Colors.white60),),
          const Spacer(flex: 2),

        ],
      ),
    ),);
  }
}

class AreaInfoText extends StatelessWidget {
  const AreaInfoText({Key? key, required this.title, required this.text})
      : super(key: key);
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

