import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:society/admin/create_socity.dart';
import 'package:society/admin/flat_expension.dart';

import 'package:society/admin/restation_from.dart';
import 'package:society/login/login_screen.dart';
import 'package:society/other/deshboard/members_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      // theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      debugShowCheckedModeBanner: false,
      // home: AuthPage(),
      // home: MyHomePage(),
      // home: SelecteRole(),
      // home: MainPage(),
      // home: SocietyAdmin(), ;;;
      // home: SocietyMembersLists(),
      // home: MembersDetailsScreen(),
      // home: SplashScreen(),
      // home: DynamicTextFieldPage(),
      // home: SocityRestitation(),
      // home: FlatExpension(),
      home: CreateSociety(),
      // home: LogINScreen(),
    );
  }
}
