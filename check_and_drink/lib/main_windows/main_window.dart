import 'package:check_and_drink/filter_windows.dart/filter_window.dart';
import 'package:check_and_drink/main_windows/bottom_navigation_bar.dart';
import 'package:check_and_drink/main_windows/favorites_window.dart';
import 'package:check_and_drink/qr_windows/qr_first_window.dart';
import 'package:check_and_drink/result_windows/search_result_window.dart';
import 'package:flutter/material.dart';


class MainWindowScreen extends StatefulWidget {
  @override
  _MainWindowScreenState createState() => _MainWindowScreenState();
}

class _MainWindowScreenState extends State<MainWindowScreen> {
      final TextEditingController _searchController = TextEditingController(); //Controller for search

  @override
  void dispose() {
    _searchController.dispose(); // Dispose controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return 
       Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          //key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              SizedBox(height: 200),

              // Поисковая строка
              TextFormField(
                   controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Поиск...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide:  const BorderSide(color: Colors.grey, width: 1),
                  ),
                   filled: true,
                  fillColor: Colors.white,
                ),
                onFieldSubmitted: (text) {
                  if (text.trim().toLowerCase() == "franziskaner"){
                    print(text.trim());
                     Navigator.push(
                       context,
                       MaterialPageRoute(
                         builder: (context) => SearchResultScreen(),
                       ),
                     );
                  }
                  else if (text.trim().isNotEmpty && text.trim().toLowerCase() != "franziskaner") {
                     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('В нашей базе напитков нет такого напитка')));
                   } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Введите текст для поиска')));
                   }
                   
                },
              ),
              SizedBox(height: 20),

              // Кнопки поиска
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QrFirstScreen()),
                  );
                },
                    icon: Icon(Icons.qr_code_scanner),
                    label: Text('Поиск по QR-коду'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), 
                      minimumSize: Size(double.infinity, 60),
                      backgroundColor:Color.fromARGB(255, 128, 0, 32),
                      foregroundColor: Colors.white,  
                  ),
                  
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                                        Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FilterScreen()),
                  );
                    },
                    icon: Icon(Icons.filter_list),
                    label: Text('Поиск по фильтрам'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      minimumSize: Size(double.infinity, 60),
                      backgroundColor:Color.fromARGB(255, 128, 0, 32),
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),


            ],
          ),
        ),
       );
 
  }
}

