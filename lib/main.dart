import 'package:flutter/material.dart';
import 'package:prosodygame/model/data.dart';
import 'package:prosodygame/Widgets/start.dart';
import 'package:prosodygame/Widgets/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
import 'package:hexcolor/hexcolor.dart';

// Hello Programmer :)

void main() async {
  // Data
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Data().setMyMap();

  SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp
      ]
  );
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'first',
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: HexColor("#F9F0F1"),
            backgroundColor: HexColor("#E7BB8E"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // <-- Radius
            ),
          )),
    ),
    localizationsDelegates: const [
      GlobalCupertinoLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: const [
      Locale("ar", "KSA"), // OR Locale('ar', 'AE') OR Other RTL locales
    ],
    locale: const Locale("ar", "KSA"), // OR Locale('ar', 'AE') OR Other RTL locales,
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const Start(),
      '/home': (context) => const Home(),
    },
  ));
  Hive.close();
}
