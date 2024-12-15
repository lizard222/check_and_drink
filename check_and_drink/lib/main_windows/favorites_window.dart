import 'package:check_and_drink/result_windows/filter_result_window.dart';
import 'package:check_and_drink/result_windows/qr_result_window.dart';
import 'package:check_and_drink/result_windows/search_result_window.dart';
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
    String imagePath = '';

    if (drinkName == 'Franziskaner') {
      imagePath = 'lib/assets/images/drink3.png'; 
    } else if (drinkName == 'Chateau L’eclair Muscat') {
      imagePath = 'lib/assets/images/drink1.png';
    } else if (drinkName == 'Fess Parker Ashley’s') {
      imagePath = 'lib/assets/images/drink2.png';
    } 


return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 128, 0, 32), width: 2),
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
            children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox( 
                          height: 80,
                          child: Image.asset(
                              imagePath,
                              fit: BoxFit.contain, 
                          ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                          drinkName,
                          style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        

                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(color: Color.fromARGB(255, 128, 0, 32)),
                              backgroundColor: Color.fromARGB(255, 128, 0, 32),
                              foregroundColor: Colors.white,
                              minimumSize: const Size(100, 50), 
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0) 
                              ),
                            ),
                            onPressed: () {
                                if (drinkName == 'Franziskaner'){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SearchResultScreen(),
                                        ),
                                    );
                                }
                                else if (drinkName == 'Chateau L’eclair Muscat'){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => QrResultScreen(),
                                      ),
                                    );
                                }
                                else if (drinkName == 'Fess Parker Ashley’s'){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FilterResultScreen(),
                                      ),
                                    );
                                }
                                print('Подробнее $drinkName');
                            },
                            child: const Text(
                                'Подробнее',
                            ),
                        ),
                                                const SizedBox(height: 10),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(color: Color.fromARGB(255, 128, 0, 32)),
                              backgroundColor: Colors.white,
                              foregroundColor: Color.fromARGB(255, 128, 0, 32),
                              minimumSize: const Size(120, 50), 
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0) 
                               ),
                            ),
                            onPressed: () {
                                removeFavorite(index);
                            },
                            child: const Text(
                                'Удалить',
                            ),
                        ),
                    ],
                ),
            ],
        ),
    );
}

}