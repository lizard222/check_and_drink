import 'package:flutter/material.dart';
import 'bottom_navigation_bar.dart'; // Импортируйте ваш виджет нижней навигационной панели

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          //key: _formKey,
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('Личный кабинет'),
              SizedBox(height: 200),

              // Поисковая строк
              SizedBox(height: 30),


            ],
          ),
        ),
       );
  }
}