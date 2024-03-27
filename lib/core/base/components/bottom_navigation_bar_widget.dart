// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:drscanner_ai/core/base/state/base_state.dart';
import 'package:drscanner_ai/core/constants/enums/setting_type_enum.dart';
import 'package:drscanner_ai/core/constants/image_constants.dart';
import 'package:drscanner_ai/core/init/theme/color/color_theme.dart';
import 'package:drscanner_ai/view/blog/view/blog_view.dart';
import 'package:drscanner_ai/view/home/view/home_view.dart';

import '../../../view/info/view/info_view.dart';
import '../../../view/onboarding/view/settings_view.dart';

GlobalKey<ScaffoldState> homeKey = GlobalKey<ScaffoldState>();
int? selectedIndex;
String _currentPage = "Page1";

Map<String, GlobalKey<NavigatorState>> navigatorKeys = {
  "Page1": GlobalKey<NavigatorState>(),
  "Page2": GlobalKey<NavigatorState>(),
};

class BottomNavigationBarView extends StatefulWidget {
  final int? selectedIndex;
  const BottomNavigationBarView({Key? key, this.selectedIndex})
      : super(key: key);

  @override
  State<BottomNavigationBarView> createState() =>
      _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  List<String> pageKeys = [
    "Page1",
    "Page2",
  ];

  void _selectTab(String tabItem, int index) {
    if (tabItem == _currentPage) {
      navigatorKeys[tabItem]?.currentState?.popUntil((route) => route.isFirst);
    } else {
      if (mounted) {
        setState(
          () {
            _currentPage = pageKeys[index];
            selectedIndex = index;
          },
        );
      }
    }
  }

  @override
  void initState() {
    if (mounted) {
      setState(
        () {
          selectedIndex = widget.selectedIndex ?? 0;
          _currentPage = pageKeys[widget.selectedIndex ?? 0];
          // selectedIndexAnimations(widget.selectedIndex ?? 0);
        },
      );
    }
    super.initState();
  }

  void onTabTapped(int index) {
    if (index == 0) {
      _selectTab(pageKeys[index], index);
      return;
    }
    if (index == 1) {
      _selectTab(pageKeys[index], index);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            await navigatorKeys[_currentPage]?.currentState?.maybePop();
        if (isFirstRouteInCurrentTab!) {
          if (_currentPage != "Page1") {
            _selectTab("Page1", 0);
            return false;
          } else {
            if (Platform.isIOS) {
              exit(0);
            } else {
              SystemNavigator.pop();
            }
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        key: homeKey,
        body: Stack(
          children: [
            _buildOffstageNavigator("Page1"),
            _buildOffstageNavigator("Page2"),
          ],
        ),
        bottomNavigationBar: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: Platform.isAndroid
                    ? Utility(context).dynamicWidthPixel(24)
                    : Utility(context).dynamicWidthPixel(38),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  bottomNavBarItems(
                    index: 0,
                    iconPath: ImageConstants.instance.svgPath.eye_btn,
                    title: 'scan'.tr,
                  ),
                  bottomNavBarItems(
                    index: 1,
                    iconPath: ImageConstants.instance.svgPath.blog,
                    title: 'blog'.tr,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomNavBarItems(
      {int? index, required String iconPath, String? title}) {
    return GestureDetector(
      onTap: () {
        onTabTapped(index!);
      },
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          SvgPicture.asset(
            iconPath,
            color:
                selectedIndex == index ? AppColors().green : AppColors().grey1,
            height: 30,
          ),
          Padding(
            padding:
                EdgeInsets.only(top: Utility(context).dynamicWidthPixel(64)),
            child: Text(
              title!.tr,
              style: TextStyle(
                fontWeight: selectedIndex == index
                    ? FontWeight.w600
                    : FontWeight.normal,
                color: selectedIndex == index
                    ? AppColors().green
                    : AppColors().grey1,
                fontSize: Utility(context).dynamicTextSize(13.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildOffstageNavigator(String tabItem) {
  return Offstage(
    offstage: _currentPage != tabItem,
    child: TabNavigator(
      navigatorKey: navigatorKeys[tabItem],
      tabItem: tabItem,
    ),
  );
}

class TabNavigator extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState>? navigatorKey;
  final String? tabItem;

  @override
  Widget build(BuildContext context) {
    Widget? child;
    if (tabItem == "Page1") {
      child = const HomeView();
    } else if (tabItem == "Page2") {
      child = const BlogView();
    }

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child!);
      },
    );
  }
}
