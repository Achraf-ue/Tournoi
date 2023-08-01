import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:tournoi/pages/home_page.dart';
import 'package:tournoi/pages/home_page_2.dart';

class HomePage1 extends StatefulWidget{
  const HomePage1({super.key});



  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1>{


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
              const Text(
                'Bienvenu sur Smile Tournoi ', // Replace with your desired text
                style: TextStyle(fontSize: 24, color: Colors.red), // Adjust the font size as per your requirement
              ),
              const SizedBox(height: 10),
              Image.asset(
                'lib/images/joueur.png', // Adjust the height as per your requirement
              ),
              Expanded(
              child: Center(
              
                child: ElevatedButton(
                  style:   ElevatedButton.styleFrom(
                      primary: Colors.red, //background color of button
                      elevation: 3, //elevation of button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                      ),
                      padding: EdgeInsets.all(20) //content padding inside button/background color of button
                      ),
                  child: const Text('Lanser une tournoi',  style: TextStyle(fontSize: 24, color: Colors.white)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage2() ) );
                  },
                ),
              ),
            ),
         ],     
        ),
    ));
  }
}