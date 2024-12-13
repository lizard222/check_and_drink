import 'package:check_and_drink/main_windows/main_menu.dart';
import 'package:check_and_drink/main_windows/main_window.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
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
               Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 128, 0, 32),size: 35.0,),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 100),
                  Center (
                    child: Text(
                      'Вход',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 128, 0, 32)),
                      // textAlign: TextAlign.center,
                    ),
                  ),
                
                ],
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Обработка входа
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   const SnackBar(content: Text('Вход выполнен успешно!')),
                    // );
                     Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainMenuScreen()),
                  );
                  }
                },
                child: Text('Войти'),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: (){}, 
                child: Text('Забыли пароль?', style: TextStyle(color: Color.fromARGB(255, 128, 0, 32)))
              )
            ],
          ),
        ),
      ),
    );
  }
}
