import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:tournoi/pages/detaille.dart';
import 'package:tournoi/pages/home_page_2.dart';
import 'package:tournoi/pages/home_page_1.dart';


class HomePage extends StatefulWidget{


  final int nombreJoueur;
  final int nombreJoueurParEquipe;
  const HomePage({super.key,  required this.nombreJoueur, required this.nombreJoueurParEquipe });



  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  String dropdownvalue = 'Elimination';   
  
  // List of items in our dropdown menu
  var items = [    
    'Elimination',
    'Classement',
  ];


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
                'Choisir le type de tournoi', // Replace with your desired text
                style: TextStyle(fontSize: 24, color: Colors.red), // Adjust the font size as per your requirement
              ),
              const SizedBox(height: 10),
              Image.asset(
                'lib/images/joueur.png', // Adjust the height as per your requirement
              ),
             /* Expanded(
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
                  onPressed: () {},
                ),
              ),
            ),*/
            const SizedBox(height: 100),
            Container(
              margin: EdgeInsets.all(24),
              height: 50,
              width: 200,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                 color:Colors.white, //background color of dropdown button
                 border: Border.all(color: Colors.black38, width:3), //border of dropdown button
                 borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
                 boxShadow: <BoxShadow>[ //apply shadow on Dropdown button
                 BoxShadow(
                 color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                 blurRadius: 20) //blur radius of shadow
          ]
                 
            ),
            child : DropdownButtonHideUnderline(
            
            child: DropdownButton2(
              // Initial Value
              
              value: dropdownvalue,
                            // Down Arrow Icon
                 isExpanded: false, //make true to take width of parent widget
                 underline: Container(), //empty line
                 style:  TextStyle(fontSize: 18, color: Colors.black),
              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) { 
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
              dropdownStyleData: DropdownStyleData(
              padding:  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              offset: Offset(0, -15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.white,
              ),
              )
            ),
            )
            ),
            Center(
       child: Row(
         children: <Widget>[
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
                  child: const Text('Routeur',  style: TextStyle(fontSize: 18, color: Colors.white)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage2(test1: widget.nombreJoueur, test2: widget.nombreJoueurParEquipe,) ) );
                  },
                ),
              ),
            ),
           Expanded(
             child: Container(
               height: 100,
             ),
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
                  child:  Text('Suivant / '+widget.nombreJoueur.toString()+"/"+widget.nombreJoueurParEquipe.toString(),  style: TextStyle(fontSize: 18, color: Colors.white)),
                  onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)
                      => detaille(nombreJoueur: 8, nombreJoueurParEquipe: 2,
                       typeTournoi: "Elimination".toString(),) ) );
                  },
                ),
              ),
            ),
         ],
       ),
   )
            ],
            
        ),
    ));
  }
}