import 'package:check_and_drink/auth_windows/login_window.dart';
import 'package:check_and_drink/main_windows/main_menu.dart';
import 'package:check_and_drink/main_windows/main_window.dart';
import 'package:check_and_drink/main_windows/main_window.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 10),

              Text(
                'Регистрация',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 128, 0, 32)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),


              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.0), 
                   border: Border.all(
                    color: Colors.grey, 
                    width: 1.0, 
                  ),
                ),
                padding:  EdgeInsets.symmetric(vertical: 1, horizontal: 10), 
                child: TextFormField(
                  decoration: InputDecoration(hintText: 'Имя', border: InputBorder.none), //191, 191, 191
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите имя';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10),


              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.0), 
                   border: Border.all(
                    color: Colors.grey, 
                    width: 1.0, 
                  ),
                ),
                padding:  EdgeInsets.symmetric(vertical: 1, horizontal: 10), 
                child: TextFormField(
                  decoration: InputDecoration(hintText: 'Email', border: InputBorder.none), 
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите email';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10),


              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.0), 
                   border: Border.all(
                    color: Colors.grey, 
                    width: 1.0, 
                  ),
                ),
                padding:  EdgeInsets.symmetric(vertical: 1, horizontal: 10), 
                child: TextFormField(
                  decoration: InputDecoration(hintText: 'Пароль', border: InputBorder.none),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите пароль';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.0), 
                   border: Border.all(
                    color: Colors.grey, 
                    width: 1.0, 
                  ),
                ),
                padding:  EdgeInsets.symmetric(vertical: 1, horizontal: 10), 
                child: TextFormField(
                  decoration: InputDecoration(hintText: 'Повторите пароль', border: InputBorder.none),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, повторите пароль';
                    }
                    return null;
                  },
                ),
              ),


              SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 128, 0, 32),
                  foregroundColor: Colors.white, 
                  textStyle: TextStyle(fontSize: 20), 
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4), 
                  ),
                  shadowColor: Colors.grey,
                  elevation: 5,
                ),
                child: Text('Зарегистрироваться'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {

                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   const SnackBar(content: Text('Регистрация прошла успешно!')),
                    // );
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainMenuScreen()),
                  );
                  }
                },
                
              ),
              SizedBox(height: 10),


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
                child: Text('Войти'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}