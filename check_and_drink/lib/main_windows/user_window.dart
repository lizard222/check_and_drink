import 'package:check_and_drink/auth_windows/registration_window.dart';
import 'package:flutter/material.dart';

String _userName = "User1"; 
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 300),
                IconButton(
                  icon: Icon(
                    Icons.exit_to_app,
                    color: Color.fromARGB(255, 128, 0, 32),
                    size: 35.0,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegistrationScreen()),
                    );
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
            SizedBox(height: 10),
            Text(
              _userName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    _showEditNameDialog();
                  },
                  icon: Icon(Icons.person),
                  label: Text('Настройки профиля'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    minimumSize: Size(double.infinity, 60),
                    backgroundColor: Color.fromARGB(255, 128, 0, 32),
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
                    backgroundColor: Color.fromARGB(255, 128, 0, 32),
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

  void _showEditNameDialog() {
    final TextEditingController nameController = TextEditingController();

showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white, 
      title: Text(
        "Изменить имя",
        style: TextStyle(color: Colors.black), 
      ),
      content: TextField(
        controller: nameController,
        decoration: InputDecoration(
          labelText: "Новое имя",
          labelStyle: TextStyle(color: Colors.black), 
          border: OutlineInputBorder(),
        ),
      ),
      actions: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.white, 
              side: BorderSide(color: Color.fromARGB(255, 128, 0, 32), width: 2), 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), 
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop(); 
            },
            child: Text(
              "Отмена",
              style: TextStyle(
                color: Color.fromARGB(255, 128, 0, 32), 
                fontWeight: FontWeight.bold, 
              ),
            ),
          ),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 128, 0, 32), 
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), 
              ),
          ),
          onPressed: () {
            setState(() {
              _userName = nameController.text; 
            });
            Navigator.of(context).pop();
          },
          child: Text(
            "Сохранить",
            style: TextStyle(color: Colors.white), 
          ),
        ),
      ],
    );
  },
);

  }
}
