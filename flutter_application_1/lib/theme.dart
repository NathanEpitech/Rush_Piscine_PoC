import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
);

final lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
);

class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData;

  ThemeNotifier(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData themeData) async {
    _themeData = themeData;
    notifyListeners();
  }
}

class FancyButton extends StatelessWidget {
  FancyButton({@required this.onPressed});

  final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return new RawMaterialButton(
      fillColor: Colors.deepPurple,
      splashColor: Colors.purple,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        child: Text("Add Project"),
      ),
      textStyle: TextStyle(color: Colors.white),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}

class FancyButton_2 extends StatelessWidget {
  FancyButton_2({@required this.onPressed});

  final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return new RawMaterialButton(
      fillColor: Colors.deepPurple,
      splashColor: Colors.purple,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        child: Text("Add Task"),
      ),
      textStyle: TextStyle(color: Colors.white),
      onPressed: onPressed,
      shape: const StadiumBorder(),
    );
  }
}
