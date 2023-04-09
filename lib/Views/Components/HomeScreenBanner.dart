import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Utils/constants.dart';
import '../Responsive.dart';

class HomeScreenBanner extends StatefulWidget {
  const HomeScreenBanner({Key? key}) : super(key: key);

  @override
  State<HomeScreenBanner> createState() => _HomeScreenBannerState();
}

class _HomeScreenBannerState extends State<HomeScreenBanner> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: Responsive.isMobile(context) ?  2.3 : 3,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/icons/bg.jpeg',
            fit: BoxFit.cover,
          ),
          Container(
            color: darkColor.withOpacity(0.80),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Discover my Amazing \n Art Space!",
                  style: Responsive.isDesktop(context) ? Theme.of(context).textTheme.headline3!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ) :  Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              if(Responsive.isMobile(context)) const SizedBox(
                height: defaultPadding/2,
              ),
              DefaultTextStyle(
                maxLines: 1,
                style:   !Responsive.isMobile(context) ?Theme.of(context).textTheme.subtitle1! : Theme.of(context).textTheme.subtitle2!,
                child: Row(
                  children: const [
                    Text("I Build "),
                    Expanded(child: AnimatedText()),
                  ],
                ),
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              if(Responsive.isDesktop(context)  ) ElevatedButton(
                      onPressed: () => launch('https://github.com/goswamijay'),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding * 2, vertical: defaultPadding),
                  backgroundColor: primaryColor,
                ),
                child: const Text(
                  "EXPLORE NOW",
                  style: TextStyle(color: darkColor),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class AnimatedText extends StatelessWidget {
  const AnimatedText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        TyperAnimatedText(
          "responsive web and mobile app.",
          speed: const Duration(milliseconds: 60),
        ),
        TyperAnimatedText(
          "Instagram Reels Downloader app.",
          speed: const Duration(milliseconds: 60),
        ),
        TyperAnimatedText(
          "WhatsApp Status Downloader app.",
          speed: const Duration(milliseconds: 60),
        ),
      ],
    );
  }
}
