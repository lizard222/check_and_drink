import 'package:check_and_drink/auth_windows/registration_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'bottom_navigation_bar.dart'; 

class QrMoreInfoScreen extends StatefulWidget {
  @override
  _QrMoreInfoScreenState createState() => _QrMoreInfoScreenState();
}

class _QrMoreInfoScreenState extends State<QrMoreInfoScreen> {

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
                            text: '\n\nЯркие ноты белых цветов, цитрусов, \nперсиков и меда.', // Оставшаяся часть текста
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
                              text: '\n\nСбалансированная сладость с \nосвежающими фруктовыми нотами.', // Оставшаяся часть текста
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
                              text: '\n\nЭто вино прекрасно сочетается с:\n- фруктовыми десертами, например, \n- тартом с персиками или эклерами \n  с кремом;\n- мягкими сырами, такими как бри или \n  камамбер.', // Оставшаяся часть текста
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
                              text: '\n\n8-10°C ', // Оставшаяся часть текста
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
                              text: '\n\nMoscato dAsti\nMoscato di Pantelleria\nMuscat de Rivesaltes\nMuscat de Beaumes-de-Venise', // Оставшаяся часть текста
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


