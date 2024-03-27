import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:drscanner_ai/view/splash/view/splash_view.dart';
import 'core/base/state/base_state.dart';
import 'core/constants/app_constants.dart';
import 'core/init/language/language.dart';
import 'core/init/theme/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:
          const Size(375, 812), //IPhoneX (Invisionda seçili olan çözünürlük)
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus!.unfocus();
            }
          },
          child: GetMaterialApp(
            enableLog: kDebugMode,
            builder: (context, child) {
              SystemChrome.setSystemUIOverlayStyle(
                  Utility(context).theme.appBarTheme.systemOverlayStyle!);
              return Column(
                children: [
                  Expanded(
                    child: child ?? const SizedBox(),
                  ),
                ],
              );
            },
            locale: Get.deviceLocale,
            translations: Language(),
            title: ApplicationConstants.APPNAME,
            themeMode: ThemeMode.light,
            theme: ThemeManager.createTheme(AppThemeLight()),
            supportedLocales: const [
              Locale('ar', 'AR'),
              Locale('en', 'US'),
            ],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            // navigatorKey: NavigationService.instance.navigatorKey,
            // onGenerateRoute: NavigationRoute.instance.generateRoute,
            defaultTransition: Transition.fade,
            opaqueRoute: Get.isOpaqueRouteDefault,
            popGesture: Get.isPopGestureEnable,
            transitionDuration: Get.defaultTransitionDuration,
            home: const SplashView(),
          ),
        );
      },
    );
  }
}
