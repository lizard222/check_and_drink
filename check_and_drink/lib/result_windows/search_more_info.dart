import 'package:check_and_drink/auth_windows/registration_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'bottom_navigation_bar.dart'; 

class SearchMoreInfoScreen extends StatefulWidget {
  @override
  _SearchMoreInfoScreenState createState() => _SearchMoreInfoScreenState();
}

class _SearchMoreInfoScreenState extends State<SearchMoreInfoScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
      appBar: AppBar(
        title: Text("         Franziskaner", style: TextStyle(color: Color.fromARGB(255, 128, 0, 32))), 
        backgroundColor: Color(0xFFFFF3E0),  
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 128, 0, 32),
          size: 30.0,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.copy, color: Color.fromARGB(255, 128, 0, 32)),  
            onPressed: () {
              
              Clipboard.setData(ClipboardData(text: "Franziskaner"));
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



          

              Container(
                  constraints: const BoxConstraints(
                  minWidth: 200,   
                  minHeight: 85,  
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
                            text: 'Аромат',
                            style: TextStyle(fontWeight: FontWeight.bold), // Жирный стиль для "Аромат"
                          ),
                          TextSpan(
                            text: '\n\nОбладает богатым и комплексным  \nароматом: фрукты, специи.', // Оставшаяся часть текста
                          ),
                        ],
                      ),
                    ),
                    ],
                  ),
                ),

               const SizedBox(height: 10),
                Container(
                    constraints: const BoxConstraints(
                    minWidth: 200,   
                    minHeight: 85,  
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
                              text: 'Вкус',
                              style: TextStyle(fontWeight: FontWeight.bold), // Жирный стиль для "Аромат"
                            ),
                            TextSpan(
                              text: '\n\nВкус мягкий и сбалансированный, с\nзаметными фруктовыми акцентами.', // Оставшаяся часть текста
                            ),
                          ],
                        ),
                      ),
                      ],
                    ),
                  ),
                

                const SizedBox(height: 10),
                Container(
                    constraints: const BoxConstraints(
                    minWidth: 200,   
                    minHeight: 85,  
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
                              text: 'Гастрономические рекомендации',
                              style: TextStyle(fontWeight: FontWeight.bold), // Жирный стиль для "Аромат"
                            ),
                            TextSpan(
                              text: '\n\nЭто пиво прекрасно сочетается с:\n- мясом \n- закусками ', // Оставшаяся часть текста
                            ),
                          ],
                        ),
                      ),
                      ],
                    ),
                  ),
           


                              const SizedBox(height: 10),
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
                              text: 'Температура подачи',
                              style: TextStyle(fontWeight: FontWeight.bold), // Жирный стиль для "Аромат"
                            ),
                            TextSpan(
                              text: '\n\n6-8°C ', // Оставшаяся часть текста
                            ),
                          ],
                        ),
                      ),
                      ],
                    ),
                  ),

                           const SizedBox(height: 10),
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
                              text: 'Аналоги',
                              style: TextStyle(fontWeight: FontWeight.bold), // Жирный стиль для "Аромат"
                            ),
                            TextSpan(
                              text: '\n\nLeffe Blonde\nHoegaarden Witbier\nPaulaner Hefe-Weissbier\nErdinger Weissbier ', // Оставшаяся часть текста
                            ),
                          ],
                        ),
                      ),
                      ],
                    ),
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

