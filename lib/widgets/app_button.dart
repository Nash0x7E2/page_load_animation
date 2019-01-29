import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: Colors.black54,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34.0, vertical: 8.0),
        child: Text(
          "Visit",
          style: TextStyle(
              color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),
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
    );
  }
}
