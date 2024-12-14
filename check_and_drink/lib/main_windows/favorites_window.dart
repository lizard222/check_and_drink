import 'package:flutter/material.dart';
import 'bottom_navigation_bar.dart'; // Импортируйте ваш виджет нижней навигационной панели

class FavoritesScreen extends StatefulWidget {
  //final String? initialDrink;
  
  const FavoritesScreen();//{this.initialDrink}
  // List<String> favoriteDrinks = [];
  // List<bool> favoriteDrinksStatus = [];
  // final Function(String) addFavorite;
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {

  List<String> favoriteDrinks = [];
  List<bool> favoriteDrinksStatus = [];
  
  // @override
  // void initState() {
  //   super.initState();
  //   if (widget.initialDrink != null) {
  //     favoriteDrinks.add(widget.initialDrink!);
  //     favoriteDrinksStatus.add(true);
  //   }
  // }

  void addFavorite(String drinkName) {
    setState(() {
      favoriteDrinks.add(drinkName);
       favoriteDrinksStatus.add(true);
    });
  }

  void removeFavorite(int index) {
    setState(() {
      favoriteDrinksStatus[index] = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: favoriteDrinks.length,
          itemBuilder: (context, index) {
            return favoriteDrinksStatus[index] ?  _buildFavoriteItem(context, favoriteDrinks[index], index) : SizedBox();
          },
        ),
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