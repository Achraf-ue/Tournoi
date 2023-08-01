import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:tournoi/pages/home_page_2.dart';
import 'package:tournoi/pages/home_page_1.dart';


class detaille extends StatefulWidget{
  final int nombreJoueur;
  final int nombreJoueurParEquipe;
  final String typeTournoi;
  const detaille({super.key,
   required this.nombreJoueur,
    required this.nombreJoueurParEquipe,
     required this.typeTournoi
     });



  @override
  State<detaille> createState() => _Homedetaille();
}

class _Homedetaille extends State<detaille>{


  @override
  Widget build(BuildContext context){
    return   Scaffold(
      backgroundColor: const Color.fromRGBO(254, 201, 24, 1),
      body:  Center(
        child: Column( 
           children: [
              Image.asset(
                'lib/images/logo.png', // Adjust the height as per your requirement
              ), // Add spacing between image and text
               Text(
                'Nombre des joueurs : ' + widget.nombreJoueur.toString(), // Replace with your desired text
                style: TextStyle(fontSize: 24, color: Colors.red), // Adjust the font size as per your requirement
              ),
              const SizedBox(height: 20),
              Text(
                'Nombre des joueurs par equipe :'+widget.nombreJoueurParEquipe.toString(), // Replace with your desired text
                style: TextStyle(fontSize: 24, color: Colors.red), // Adjust the font size as per your requirement
              ),
              const SizedBox(height: 20),
              Text(
                'Type de tournoi : ' + widget.typeTournoi, // Replace with your desired text
                style: TextStyle(fontSize: 24, color: Colors.red), // Adjust the font size as per your requirement
              ),
              ]
        ),
    ));
}
}