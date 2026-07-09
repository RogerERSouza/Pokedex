import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/tela_home.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    const Pokedex(),
  );
}

class Pokedex extends StatelessWidget {

  const Pokedex({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: "Pokédex",

      theme: ThemeData(

        textTheme: GoogleFonts.poppinsTextTheme(),

        primarySwatch: Colors.red,

        appBarTheme: const AppBarTheme(

          centerTitle: true,

          elevation: 3,

          backgroundColor: Colors.red
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: 
          ElevatedButton.styleFrom(

            shape: RoundedRectangleBorder(

              borderRadius: BorderRadius.circular(12),
            ),

          padding: 
          const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
          ),
        ),
      ),

      home: const TelaHome()
    );
  }
}