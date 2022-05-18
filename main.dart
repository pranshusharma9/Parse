import 'package:flutter/material.dart';
import 'package:kpmg_employees/login_page.dart';
import './welcome_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final keyApplicationID = 'mUKDLG0OEUhutWv07IHIu5wtQpOahnFmHiRHpNbK';
  final keyClientKey = 'OFqWIsbl0zjgsVkh4SsEc5L92zF2LJ68t6sRMTNR';
  final keyPrseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationID, keyPrseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);

  var firstObject = ParseObject('FirstClass')
    ..set(
        'message', 'Hey ! First message from Flutter. Parse is now connected');
  await firstObject.save();

  print('done');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Clean Code',
        home: AnimatedSplashScreen(
            duration: 1250,
            splash: 'assets/splashimage.png',
            nextScreen: LoginPage(),
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.topToBottom,
            animationDuration: Duration(seconds: 2),
            backgroundColor: Color(0xff122965)));
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}
