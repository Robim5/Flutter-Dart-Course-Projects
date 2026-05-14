import 'package:flutter/material.dart';
import 'package:tracker_app/widgets/expenses.dart';
import 'package:tracker_app/app_theme.dart';
import 'package:flutter/services.dart';

void main() {
  /*WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    fn,
  ) {*/
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false, // remove the debug banner
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.system,
        home: const Expenses(),
      ),
    );
  //});
}
