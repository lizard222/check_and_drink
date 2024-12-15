import 'package:check_and_drink/auth_windows/registration_window.dart';
import 'package:check_and_drink/main_windows/favorites_window.dart';
import 'package:check_and_drink/main_windows/main_menu.dart';
import 'package:check_and_drink/main_windows/main_window.dart';
import 'package:check_and_drink/result_windows/qr_more_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
//import 'bottom_navigation_bar.dart'; 

class QrResultScreen extends StatefulWidget {
  
  
  @override
  _QrResultScreenState createState() => _QrResultScreenState(
  );
}

class _QrResultScreenState extends State<QrResultScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
      appBar: AppBar(
        title: Text("Chateau L’eclair Muscat", style: TextStyle(color: Color.fromARGB(255, 128, 0, 32))), 
        backgroundColor: Color(0xFFFFF3E0),  
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 128, 0, 32),
          size: 30.0,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.copy, color: Color.fromARGB(255, 128, 0, 32)),  
            onPressed: () {
              
              Clipboard.setData(ClipboardData(text: "Chateau L’eclair Muscat"));
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Название скопировано')));
            },
          ),
        ],
      ),
      body: Stack(
        children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                //key: _formKey,
                child: Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
              //SizedBox(height: 5),


              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 128, 0, 32), width: 2),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SizedBox(
                  width: 200, // Задайте нужную ширину
                  height: 300, // Задайте нужную высоту
                  child: Image.asset(
                    "lib/assets/images/drink1.png",
                  ),
                ),
              ),

              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 128, 0, 32), width: 2),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                  Text("Средняя цена:",
                          style: const TextStyle(fontSize: 16, color: Colors.black),
                        ),
                    const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      "750 руб.",
                      style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  )
                  ],
                ),
              ),

              SizedBox(height: 10),
              Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color.fromARGB(255, 128, 0, 32), width: 2),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                        Text("Производитель:",
                                style: const TextStyle(fontSize: 16, color: Colors.black),
                              ),
                          const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            "Франция",
                            style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        )
                        ],
                      ),
              ),

              SizedBox(height: 10),
              Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color.fromARGB(255, 128, 0, 32), width: 2),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                        Text("Преимущества:",
                                style: const TextStyle(fontSize: 16, color: Colors.black),
                              ),
                          const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            "Низкая цена",
                            style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        )
                        ],
                      ),
              ),
              
              SizedBox(height: 10),
 Container(
                    constraints: const BoxConstraints(
                    minWidth: 200,   
                    minHeight: 75,  
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 128, 0, 32), width: 2),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(fontSize: 16, color: Colors.black), // Базовый стиль
                          children: [
                            TextSpan(
                              text: 'Аналоги: ',
                               
                            ),
                            TextSpan(
                              text: ' Moscato dAsti\n                   Moscato di Pantelleria\n                   Muscat de Rivesaltes   ', 
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      ],
                    ),
                  ),
           

           SizedBox(height: 10),
         Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1.0), 
                  child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       SizedBox(
                        height: 50, 
                        width: 270,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 128, 0, 32),
                            foregroundColor: Colors.white,
                            textStyle: const TextStyle(fontSize: 20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)
                            ),
                          ),
                          onPressed: () {
                               Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>QrMoreInfoScreen()),
                        );
                          },
                          icon: const Icon(Icons.info_outline, color: Colors.white),
                          label: const Text('Подробнее'), 
                        ),
                      ),
                       const SizedBox(width: 10), // Расстояние между кнопками
                      SizedBox(
                         height: 50, 
                        child:  ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 251, 188, 5),
                            foregroundColor: Colors.white,
                            minimumSize: const Size(50, 25),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)
                            ),
                          ),
                          onPressed: () {
                            //addFavorite("Chateau L’eclair Muscat");
                            print("До ${favoriteDrinks}");
                            print("До ${favoriteDrinksStatus}");
                            if (favoriteDrinks.contains("Chateau L’eclair Muscat")){
                              int index = favoriteDrinks.indexOf("Chateau L’eclair Muscat");
                              removeFavorite(index);
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Напиток удален из избранного')));
                            }
                            else {
                              addFavorite("Chateau L’eclair Muscat");
                               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Напиток добавлен в избранное!')));
                            }
                            print("После ${favoriteDrinks}");
                            print("После ${favoriteDrinksStatus}");
                        },
                          child: const Icon(Icons.favorite),
                        ),
                      ),
                    ],
                  ),
              ),
              
              
              SizedBox(height: 5),
               ElevatedButton(
                 style: ElevatedButton.styleFrom(
                  
                  backgroundColor: Colors.white, 
                  foregroundColor: Color.fromARGB(255, 128, 0, 32), 
                  textStyle: TextStyle(fontSize: 20), 
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), 
                  side: BorderSide( 
                    color: Color.fromARGB(255, 128, 0, 32), 
                    width: 2, 
                  ),
                  shape: RoundedRectangleBorder( 
                    borderRadius: BorderRadius.circular(4),
                  ),
                  shadowColor: Colors.grey,
                  elevation: 5,
                ),
                child: Text('Закончить обзор'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainMenuScreen()),
                  );
                },
                
              ),

            ],
          ),
        ),
       )
        ]
      )
    );
  }
}


