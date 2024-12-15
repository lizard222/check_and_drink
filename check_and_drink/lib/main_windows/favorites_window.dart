import 'package:flutter/material.dart';
import 'bottom_navigation_bar.dart'; // Импортируйте ваш виджет нижней навигационной панели

List<String> favoriteDrinks = [];
List<bool> favoriteDrinksStatus = [];

void addFavorite(String drinkName){

  if (!favoriteDrinks.contains(drinkName)){
    favoriteDrinks.add(drinkName);
    favoriteDrinksStatus.add(true);
  }  
  // print(favoriteDrinks);
  // print(favoriteDrinksStatus);
}

void removeFavorite(int index){
      favoriteDrinksStatus.removeAt(index);
      favoriteDrinks.removeAt(index);
}

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen();

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {


  void removeFavorite(int index) {
    setState(() {
      favoriteDrinksStatus.removeAt(index);
      favoriteDrinks.removeAt(index);
    });
  }

   bool get _hasFavoriteItems => favoriteDrinks.asMap().entries.any((entry) => favoriteDrinksStatus[entry.key]);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Избранное", style: TextStyle(color: Color.fromARGB(255, 128, 0, 32))), 
        backgroundColor: Color(0xFFFFF3E0),  
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 128, 0, 32),
          size: 30.0,
        ),
          automaticallyImplyLeading: false,
          centerTitle: true,
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: !favoriteDrinks.isEmpty
        ? ListView.builder(
          itemCount: favoriteDrinks.length,
          itemBuilder: (context, index) {
            return favoriteDrinksStatus[index] ?  _buildFavoriteItem(context, favoriteDrinks[index], index) : SizedBox();
          },
        ) 
        : const Center(child: Text("У вас пока нет избранных напитков", style: TextStyle(fontSize: 18))),
      ),
    );
  }

   Widget _buildFavoriteItem(BuildContext context, String drinkName, int index) {
    return  Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red.shade400, width: 2),
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
              Text(
                drinkName,
                style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),
            Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
               ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade400,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                  ),
                  onPressed: () {
                      removeFavorite(index);
                  },
                  child: const Text("Удалить"),
                 ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade400,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                ),
                  onPressed: () {
                      print('Подробнее $drinkName');
                   },
                 child: const Text("Подробнее"),
             ),
           ],
         ),
       ]
       ),
    );
  }
}