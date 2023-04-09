import 'package:flutter/material.dart';
import 'package:portfolio_jay/Utils/constants.dart';
import '../Utils/Recommendations.dart';
import '../Utils/project.dart';
import 'Components/HomeScreenBanner.dart';
import 'Components/ProjectCard.dart';
import 'Components/recommendation_card.dart';
import 'Responsive.dart';
import 'SideMenu.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: const SideMenu(),
      appBar: Responsive.isDesktop(context)
          ? null
          : AppBar(
              backgroundColor: bgColor,
              leading: Builder(
                builder: (context) => IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(Icons.menu)),
              )),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxHeight: maxWidth),
          child: Row(
            children: [
              if (Responsive.isDesktop(context))
                const Expanded(flex: 2, child: SideMenu()),
              Responsive.isDesktop(context)
                  ? const SizedBox(
                      width: defaultPadding / 2,
                    )
                  : const SizedBox(
                      width: defaultPadding / 4,
                    ),
              Expanded(
                  flex: 7,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HomeScreenBanner(),
                        Text(
                          "My Projects:-",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(height: defaultPadding),
                        const Responsive(
                          mobile: ProjectsGridView(
                            crossAxisCount: 1,
                            childAspectRatio: 1.7,
                          ),
                          mobileLarge: ProjectsGridView(crossAxisCount: 2),
                          desktop: ProjectsGridView(
                            childAspectRatio: 1.1,
                          ),
                          tablet: ProjectsGridView(
                            childAspectRatio: 1.1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: defaultPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Recommendations",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              const SizedBox(height: defaultPadding),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(
                                    demo_recommendations.length,
                                    (index) => Padding(
                                      padding: const EdgeInsets.only(
                                          right: defaultPadding),
                                      child: RecommendationCard(
                                        recommendation:
                                            demo_recommendations[index],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}

class ProjectsGridView extends StatelessWidget {
  const ProjectsGridView({
    Key? key,
    this.crossAxisCount = 3,
    this.childAspectRatio = 1.3,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: demo_projects.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
      ),
      itemBuilder: (context, index) => ProjectCard(
        project: demo_projects[index],
      ),
    );
  }
}
