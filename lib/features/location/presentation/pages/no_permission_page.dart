import 'package:flutter/material.dart';

/// MaterialApp that launches when permissions still being searched, or denied forever.
class NoPermissionPage extends StatelessWidget {
  const NoPermissionPage({
    Key? key,
    bool hasCheckedPermissions = true,
  })  : _hasCheckedPermissions = hasCheckedPermissions,
        super(key: key);

  final bool _hasCheckedPermissions;

  @override
  Widget build(BuildContext context) {
    Widget outWidget;
    // Splash screen mode
    if (!_hasCheckedPermissions) {
      outWidget = const Image(
        image: AssetImage('images/splash.png'),
        alignment: Alignment.center,
        fit: BoxFit.contain,
      );
    } else {
      outWidget = const Text(
        'Location permissions permanently denied!\n'
        'Please reinstall app and provide permissions!',
        style: TextStyle(
          color: Colors.red,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      );
    }
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: outWidget),
      ),
    );
  }
}
