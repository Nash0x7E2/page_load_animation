import 'package:flutter/material.dart';
import 'package:page_load_animation/widgets/app_button.dart';
import 'package:page_load_animation/widgets/app_text.dart';
import 'package:page_load_animation/widgets/header_widget.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Page Load Animation",
      onGenerateRoute: (RouteSettings settings) {
        if (settings.isInitialRoute) {
          return AnimationsPlayground.route();
        }
        return null;
      },
      theme: ThemeData(
        textTheme: TextTheme(
          body2: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
            fontSize: 16.0,
          ),
        ),
      ),
    ),
  );
}

class AnimationsPlayground extends StatelessWidget {
  static Route<dynamic> route() {
    return PageRouteBuilder(
      transitionDuration: const Duration(seconds: 6),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return AnimationsPlayground();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CoolAnimatedApp(),
    );
  }
}

class CoolAnimatedApp extends StatefulWidget {
  @override
  _CoolAnimatedAppState createState() => _CoolAnimatedAppState();
}

class _CoolAnimatedAppState extends State<CoolAnimatedApp> {
  Animation<double> controller;
  Animation<Offset> imageTranslation;
  Animation<Offset> textTranslation;
  Animation<Offset> buttonTranslation;
  Animation<double> imageOpacity;
  Animation<double> textOpacity;
  Animation<double> buttonOpacity;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (controller == null) {
      controller = ModalRoute.of(context).animation;
      imageTranslation = Tween(
        begin: Offset(0.0, 1.0),
        end: Offset(0.0, 0.0),
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.0, 0.67, curve: Curves.fastOutSlowIn),
        ),
      );
      imageOpacity = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.0, 0.67, curve: Curves.easeIn),
        ),
      );
      textTranslation = Tween(
        begin: Offset(0.0, 1.0),
        end: Offset(0.0, 0.0),
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.34, 0.84, curve: Curves.ease),
        ),
      );
      textOpacity = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.34, 0.84, curve: Curves.linear),
        ),
      );
      buttonTranslation = Tween(
        begin: Offset(0.0, 1.0),
        end: Offset(0.0, 0.0),
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.67, 1.0, curve: Curves.easeIn),
        ),
      );
      buttonOpacity = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.67, 1.0, curve: Curves.easeIn),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Column(
          children: <Widget>[
            FractionalTranslation(
              translation: imageTranslation.value,
              child: HeaderImage(),
            ),
            Expanded(
              child: FractionalTranslation(
                translation: textTranslation.value,
                child: AppText(),
              ),
            ),
            FractionalTranslation(
              translation: buttonTranslation.value,
              child: new Button(),
            ),
            SizedBox(height: 34.0),
          ],
        );
      },
    );
  }
}

