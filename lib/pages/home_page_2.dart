import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:tournoi/pages/home_page_1.dart';
import 'package:tournoi/pages/home_page.dart';
import 'package:tournoi/pages/detaille.dart';


class HomePage2 extends StatefulWidget{
   

  final int test1;
  final int test2;
  const HomePage2({super.key, this.test1 = 4, this.test2 = 2});
  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2>{

  late int dropdownvalue = widget.test1;
  late int dropdownvalue2 = widget.test2;
  bool _isDropDownDisabled   = false;
  
  // List of items in our dropdown menu
  final List<int> items = <int>[
    2,
    4,
    8,
  ];
   TextEditingController _customValueController = TextEditingController();


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
                "Choisir le nombre des Joueurs", // Replace with your desired text
                style: TextStyle(fontSize: 24, color: Colors.red), // Adjust the font size as per your requirement
              ),
               Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: _isDropDownDisabled,
                  onChanged: (value) {
                    setState(() {
                      _isDropDownDisabled = value!;
                    });
                  },
                ),
                Text('nombre précis de joueurs.'),
              ],
            ),
              if (_isDropDownDisabled)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: _customValueController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Donnez-moi un certain nombre de participants.',
                  ),
                ),
              ) else
            Container(
              margin: EdgeInsets.all(24),
              height: 50,
              width: 240,
              alignment: Alignment.center,
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
              value:dropdownvalue,
                            // Down Arrow Icon
                 isExpanded: false, //make true to take width of parent widget
                 underline: Container(), //empty line
                 style:  TextStyle(fontSize: 18, color: Colors.black),
              // Array list of items
              items: items.map((int item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item.toString()),
                );
              }).toList(),
              onChanged: (int? newValue) { 
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
              dropdownStyleData: DropdownStyleData(
              padding:  EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
              offset: Offset(0, -15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.white,
              ),
              )
            
            
            ),
            )
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Nombre du joueur par equipe',
                style: TextStyle(fontSize: 24, color: Colors.red)),
              ],
            ),
            Container(
              margin: EdgeInsets.all(24),
              height: 50,
              width: 240,
              alignment: Alignment.center,
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
              value:dropdownvalue2,
                            // Down Arrow Icon
                 isExpanded: false, //make true to take width of parent widget
                 underline: Container(), //empty line
                 style:  TextStyle(fontSize: 18, color: Colors.black),
              // Array list of items
              items: items.map((int item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item.toString()),
                );
              }).toList(),
              onChanged: (int? newValue) { 
                setState(() {
                  if(newValue! >=  dropdownvalue){
                   ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:Container(
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                        child: Row(
                          children: [
                            //const SizedBox(width: 48,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [ 
                                  SizedBox(height: 30,),
                                  //Text("error", style: TextStyle(fontSize: 18, color: Colors.white),),
                                  Text('Nombre pas disponible', style: TextStyle(fontSize: 18, color: Colors.white),maxLines: 2, overflow: TextOverflow.ellipsis,),
                                  
                                ],
                              ),
                            ),
                          ],
                        )),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      ));
                   dropdownvalue2 = 2;   
                  }
                  else{
                    dropdownvalue2 = newValue;
                  }
                  
                });
              },
              dropdownStyleData: DropdownStyleData(
              padding:  EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage1()));
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
                  child: const Text('Suivant',  style: TextStyle(fontSize: 18, color: Colors.white)),
                  onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(nombreJoueur: dropdownvalue, nombreJoueurParEquipe: dropdownvalue2,) ) );
                  },
                ),
              ),
            ),
         ],
       ),
   ),
            
            ],
            
        ),
    ));
  }
}