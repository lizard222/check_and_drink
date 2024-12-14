import 'package:check_and_drink/auth_windows/registration_window.dart';
import 'package:flutter/material.dart';
//import 'bottom_navigation_bar.dart'; 

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
              SizedBox(height: 10),
               Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 300),
                  IconButton(
                    icon: Icon(Icons.exit_to_app, color: Color.fromARGB(255, 128, 0, 32),size: 35.0,),
                    onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>RegistrationScreen()),
                      );
                      // Navigator.pop(context);
                    },
                  ),
                ],
                ),
   

              SizedBox(height: 30),
              Container(
                width: 130,
                height: 130,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 217, 217, 217), 
                ),
                child: const Icon(
                  Icons.person,
                  size: 80,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 30),


              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.person),
                    label: Text('Настройки профиля'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), 
                      minimumSize: Size(double.infinity, 60),
                      backgroundColor:Color.fromARGB(255, 128, 0, 32),
                      foregroundColor: Colors.white,  
                  ),
                  
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.settings),
                    label: Text('Настройки'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      minimumSize: Size(double.infinity, 60),
                      backgroundColor:Color.fromARGB(255, 128, 0, 32),
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
       );
  }
}