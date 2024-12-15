import 'package:check_and_drink/filter_windows.dart/filter_window.dart';
import 'package:check_and_drink/main_windows/bottom_navigation_bar.dart';
import 'package:check_and_drink/main_windows/favorites_window.dart';
import 'package:check_and_drink/qr_windows/qr_first_window.dart';
import 'package:check_and_drink/result_windows/search_result_window.dart';
import 'package:flutter/material.dart';


List<String> _searchHistory = ["Franziskaner", "Captain Morgan"];
class MainWindowScreen extends StatefulWidget {
  @override
  _MainWindowScreenState createState() => _MainWindowScreenState();
}

class _MainWindowScreenState extends State<MainWindowScreen> {
      final TextEditingController _searchController = TextEditingController(); //Controller for search
      
      final FocusNode _searchFocusNode = FocusNode();
      OverlayEntry? _overlayEntry;
      

    @override
  void initState() {
    super.initState();
    _searchFocusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _searchController.dispose(); // Dispose controller
    
    _searchFocusNode.removeListener(_handleFocusChange);
    
    _searchFocusNode.dispose();
    super.dispose();
  }

    void _handleFocusChange() {
    if (_searchFocusNode.hasFocus) {
        _showSearchHistory();
    } else {
        _removeSearchHistory();
    }
  }

    void _addSearchQuery(String query) {
      if (query.trim().isNotEmpty && !_searchHistory.contains(query)) {
        setState(() {
          _searchHistory.add(query);
          if (_searchHistory.length > 5) {
              _searchHistory.removeAt(0);
          }
        });
      }
  }
  void _removeSearchHistory() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  void _showSearchHistory() {
     _overlayEntry = _createOverlayEntry();
     Overlay.of(context).insert(_overlayEntry!);
  }

    final GlobalKey _textFieldKey = GlobalKey();
  
  OverlayEntry _createOverlayEntry() {
    RenderBox? renderBox = _textFieldKey.currentContext?.findRenderObject() as RenderBox?;
    var size = renderBox?.size;
    var offset = renderBox?.localToGlobal(Offset.zero);
    return OverlayEntry(builder: (context) => Positioned(
        left: offset?.dx,
        top: offset!.dy + size!.height,
        width: size.width,
        child:  Material(
          elevation: 4.0,
          borderRadius: BorderRadius.circular(25),
          // borderRadius: const BorderRadius.only(
          //     topLeft: Radius.circular(25),
          //     topRight: Radius.circular(25),
          //     bottomLeft: Radius.circular(25),
          //     bottomRight: Radius.circular(25),
          // ),
         child: Container(
            constraints:  const BoxConstraints(maxHeight: 200),
            decoration:  BoxDecoration(
              color: Colors.white,
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(25)
            ),
            child: _searchHistory.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: _searchHistory.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_searchHistory[index]),
                        onTap: () {
                            _searchController.text = _searchHistory[index];
                            _removeSearchHistory();
                            _searchFocusNode.unfocus();
                        },
                      );
                    },
                  )
                : const Center(child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Нет истории поиска', style: TextStyle(color: Colors.grey)),
                )),
           ),
       )
    ),
    );
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
                 key: _textFieldKey,
                controller: _searchController,
                focusNode: _searchFocusNode,
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
                   _addSearchQuery(text);
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
                    MaterialPageRoute(builder: (context) => const QrFirstScreen()),
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

