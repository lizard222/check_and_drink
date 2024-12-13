import 'package:flutter/material.dart';
import 'bottom_navigation_bar.dart'; // Импортируйте ваш виджет нижней навигационной панели

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          //key: _formKey,
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('Избранное'),
              SizedBox(height: 200),

              // Поисковая строк
              SizedBox(height: 30),


            ],
          ),
        ),
       );
  }
}