import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';

import 'BuildWithPriceCardWidget.dart';
import 'Model/Build.dart';
import 'Onboarding/OnboardingStep1.dart';
import 'Onboarding/OnboardingStep3.dart';
import 'Provider/BuildProvider.dart';
import 'Provider/LoginProvider.dart';
import 'Provider/UserProvider.dart';
import 'assetsPath.dart';
import 'color.dart';

class BuildScreen extends StatefulWidget {
  @override
  _BuildScreenState createState() => _BuildScreenState();
}

class _BuildScreenState extends State<BuildScreen> {
  final scrollController = ScrollController();
  final loginProvider = GetIt.I<LoginProvider>();
  final buildProvider = GetIt.I<BuildProvider>();

  bool isFABExtended = true;
  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.offset > 50) {
        if (isFABExtended == true)
          setState(() {
            isFABExtended = false;
          });
      } else {
        if (isFABExtended == false)
          setState(() {
            isFABExtended = true;
          });
      }
    });
    super.initState();
  }
 

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder<List<Build>>(
            future: buildProvider.getAllBuilds(),
            builder: (context, snapshot) {
              return CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.black,
                    expandedHeight: 90,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      background: Padding(
                        padding: const EdgeInsets.only(
                            top: 24.0, left: 16, bottom: 8),
                        child: Text(
                          "My Builds",
                          style: TextStyle(
                            fontFamily: "Righteous",
                            fontWeight: FontWeight.bold,
                            fontSize: 34,
                            letterSpacing: 1,
                            color: Color(0xff29bf7e),
                          ),
                        ),
                      ),
                    ),
                  ),
                  loginProvider.isUserLoggedIn
                      ? Builder(
                          builder: (context) {
                            if (!snapshot.hasData) {
                              List<Widget> shimmerList = [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.black,
                                    period: Duration(milliseconds: 1000),
                                    highlightColor: Colors.white10,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Container(
                                        height: 300,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ),
                              ];
                              for (int i = 0; i < 5; i++) {
                                shimmerList.add(shimmerList[0]);
                              }
                              return SliverToBoxAdapter(
                                child: Column(
                                  children: shimmerList,
                                ),
                              );
                            } else if (snapshot.hasData &&
                                snapshot.data.isEmpty) {
                              return SliverToBoxAdapter(
                                child: Container(
                                    height: 300,
                                    child: Center(
                                      child: Text(
                                        "You have not created any build yet ☹️.\nCreate one now!",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    )),
                              );
                            } else
                              return SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                    final build = snapshot.data[index];
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  OnboardingStep3(
                                                selectedBuild: build,
                                                onboardMode: false,
                                              ),
                                              settings: RouteSettings(name: "OnboardingStep3"),
                                            ));
                                      },
                                      child: BuildWithPriceCardWidget(
                                        createdbuild: build,
                                        isSelected: false,
                                      ),
                                    );
                                  },
                                  childCount: snapshot.data.length,
                                ),
                              );
                          },
                        )
                      : SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              SizedBox(
                                height: 100,
                              ),
                              Center(
                                child: Text(
                                  "It looks like you are not \nlogged in to see your build",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Center(
                                child: RaisedButton(
                                  color: primaryColor,
                                  onPressed: () async {
                                    if (await UserProvider(context).getUser !=
                                        null) {
                                      setState(() {});
                                    }
                                  },
                                  child: Text("Log in"),
                                ),
                              ),
                            ],
                          ),
                        ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 50,
                    ),
                  )
                ],
              );
            }),
        Padding(
          padding: const EdgeInsets.only(bottom: 70.0, right: 16),
          child: Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton.extended(
              isExtended: isFABExtended,
              backgroundColor: primaryColor,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OnboardingStep1(),
                      settings: RouteSettings(name: "OnboardingStep1"),
                    ));
              },
              label: isFABExtended
                  ? Text(
                      "Create Build",
                      style: TextStyle(color: Colors.white),
                    )
                  : SvgPicture.asset(
                      AssetBNB.aBuild,
                      color: Colors.white,
                      height: 24,
                      width: 24,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
