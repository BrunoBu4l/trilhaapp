import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:trilhaapp/pages/login_page.dart';
import 'package:trilhaapp/pages/main_page.dart';

//import 'pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //retira a faixa do Banner "DEBUG"
      theme: ThemeData(
        primarySwatch: Colors.orange,
        textTheme:
            GoogleFonts.robotoTextTheme(), //texto geral de toda a aplicação
      ),
      home: const MainPage(),
    );
  }
}
