import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Utils/constants.dart';
import 'Components/Coding.dart';
import 'Components/Knowledge.dart';
import 'Components/MyInfo.dart';
import 'Components/Skills.dart';
class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const MyInfo(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  const AreaInfoText(title: "Residence", text: "India"),
                  const AreaInfoText(title: "City", text: "Una(Diu),Gujarat"),
                  const AreaInfoText(title: "Age", text: "22"),
                  const Skill(),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  const Coding(),
                  const Knowledge(),
                  const Divider(),
                  TextButton(
                      onPressed:
                            () => launch('https://drive.google.com/file/d/1N-DaSY9emc6ormfa55Ga5pi4PMW929j0/view'),

                      child: FittedBox(
                        child: Row(
                          children: [
                            Text(
                              "Download CV",
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color),
                            ),
                            const SizedBox(width: defaultPadding / 2),
                            SvgPicture.asset('assets/icons/download.svg')
                          ],
                        ),
                      )),
                  Container(
                    margin: const EdgeInsets.only(top: defaultPadding),
                    color: const Color(0xFF24242E),
                    child: Row(
                      children: [
                        const Spacer(),
                        IconButton(
                          onPressed: () => launch('https://www.linkedin.com/in/jay-goswami-420405192/'),
                          icon: SvgPicture.asset("assets/icons/linkedin.svg"),
                        ),
                        IconButton(
                          onPressed: () => launch('https://github.com/goswamijay'),
                          icon: SvgPicture.asset("assets/icons/github.svg"),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset("assets/icons/twitter.svg"),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}