import 'package:flutter/material.dart';

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
      textTranslation = Tween(
        begin: Offset(0.0, 1.0),
        end: Offset(0.0, 0.0),
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.34, 0.84, curve: Curves.ease),
        ),
      );
      buttonTranslation = Tween(
        begin: Offset(0.0, 1.0),
        end: Offset(0.0, 0.5),
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.67, 1.0, curve: Curves.easeIn),
        ),
      );

      imageOpacity = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.0, 0.67, curve: Curves.easeIn),
        ),
      );
      textOpacity = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.34, 0.84, curve: Curves.linear),
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
              child: FadeTransition(
                opacity: imageOpacity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Image.asset(
                    "assets/new_york.jpeg",
                    height: 300.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: FractionalTranslation(
                translation: textTranslation.value,
                child: FadeTransition(
                  opacity: textOpacity,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, right: 12.0, top: 44.0),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras non lorem non justo congue feugiat ut a enim. Ut et sem nec lacus aliquet gravida. Mauris viverra lectus nec vulputate placerat. Nullam sit amet blandit massa, volutpat blandit arcu. Vivamus eu tellus tincidunt, vestibulum neque eu, sagittis neque. Phasellus vitae rutrum magna, eu finibus mi. Suspendisse eget laoreet metus. In mattis dui vitae vestibulum molestie. Curabitur bibendum ut purus in faucibus.",
                      style: Theme
                          .of(context)
                          .textTheme
                          .body2,
                    ),
                  ),
                ),
              ),
            ),
            FractionalTranslation(
              translation: buttonTranslation.value,
              child: FadeTransition(
                opacity: buttonOpacity,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  color: Colors.black54,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 34.0, vertical: 8.0),
                    child: Text(
                      "Visit",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  onPressed: () {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "You pushed the button ",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Colors.black54,
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 44.0),
          ],
        );
      },
    );
  }
}
