import 'dart:io';
import 'package:check_and_drink/result_windows/filter_result_window.dart';
import 'package:check_and_drink/result_windows/qr_result_window.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:camera/camera.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String? _selectedUsage;
  String? _selectedCombination;
  String? _selectedAlcohol;
  String? _selectedAging;
  String? _selectedCountry;
  String? _selectedFeatures;
  String? _selectedPrice;

  final List<String> _usageOptions = [
    'Аперитив',
    'Вечеринка',
    'Праздник',
    'На каждый день'
  ];

  final List<String> _combinationOptions = [
    'С мясом',
    'С рыбой',
    'С сыром',
    'С десертами',
    'С закусками',
  ];

  final List<String> _alcoholOptions = [
    'Низкое (<10%)',
    'Среднее (10-20%)',
    'Высокое (>20%)',
  ];

  final List<String> _agingOptions = [
    'Молодые напитки',
    'Выдержанные',
  ];

  final List<String> _countryOptions = [
    'Италия',
    'Франция',
    'Испания',
    'Германия',
    'Россия',
  ];

  final List<String> _featuresOptions = [
    'Органическое',
    'Крафтовое',
    'Эксклюзивные  выпуски',
  ];

    final List<String> _priceOptions = [
    'Бюджетная (<500 руб.)',
    'Средняя (500-1500 руб.)',
    'Премиальная (>1500 руб.)',
  ];

  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
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
                  SizedBox(width: 70),
                  Center (
                    child: Text(
                      'Фильтры',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                      // textAlign: TextAlign.center,
                    ),
                  ),
                
                ],
            ),

               SizedBox(height: 10),

              _buildDropdown(
                        label: 'Особые случаи употребления',
                         value: _selectedUsage,
                        items: _usageOptions,
                         onChanged: (value) {
                           setState(() => _selectedUsage = value);
                         },

                      ),
                      SizedBox(height: 5),
                      _buildDropdown(
                        label: 'Пищевые сочетания',
                        value: _selectedCombination,
                        items: _combinationOptions,
                        onChanged: (value) {
                          setState(() => _selectedCombination = value);
                        },
                      ),
                      SizedBox(height: 5),
                      _buildDropdown(
                        label: 'Содержание алкоголя',
                        value: _selectedAlcohol,
                        items: _alcoholOptions,
                         onChanged: (value) {
                           setState(() => _selectedAlcohol = value);
                         },
                      ),
                      SizedBox(height: 5),
                      _buildDropdown(
                        label: 'Выдержка',
                        value: _selectedAging,
                        items: _agingOptions,
                         onChanged: (value) {
                           setState(() => _selectedAging = value);
                         },
                      ),
                      SizedBox(height: 5),
                      _buildDropdown(
                        label: 'Страна производства',
                         value: _selectedCountry,
                         items: _countryOptions,
                        onChanged: (value) {
                           setState(() => _selectedCountry = value);
                         },
                      ),
                      SizedBox(height: 5),
                      _buildDropdown(
                        label: 'Специальные категории',
                        value: _selectedFeatures,
                        items: _featuresOptions,
                         onChanged: (value) {
                           setState(() => _selectedFeatures = value);
                         },
                      ),
                      SizedBox(height: 5),
                      _buildDropdown(
                        label: 'Цена',
                        value: _selectedPrice,
                        items: _priceOptions,
                         onChanged: (value) {
                           setState(() => _selectedPrice = value);
                         },
                      ),

                SizedBox(height: 40),
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
                child: Text('Применить'),
                onPressed: () {
                  if (_selectedUsage != null ||
                      _selectedCombination != null ||
                      _selectedAlcohol != null ||
                      _selectedAging != null ||
                      _selectedCountry != null ||
                      _selectedFeatures != null ||
                      _selectedPrice != null){
                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>FilterResultScreen()),
                        );
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Заполните хотя бы одно поле')));
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
                child: Text('Сбросить фильтры'),
                onPressed: () {
                  _resetFilters();

                },
                
              ),
            


              SizedBox(height: 50),
             
            ],
          ),
        ),
      ),
    );
  }

Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Container(
       child: InputDecorator(
          decoration: InputDecoration(
            labelText: label,
             labelStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.white,
               border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          ),
          child: SizedBox(
            width: 100, 
            height: 20, 
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                onChanged: onChanged,
                items: items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item, style: const TextStyle(fontSize: 14)),
                  );
                }).toList(),
                iconSize: 20,
                 isDense: true, 
              ),
            ),
          ),
        ),
      ),
    );
  }



  void _resetFilters() {
    setState(() {
      _selectedUsage = null;
      _selectedCombination = null;
      _selectedAlcohol = null;
      _selectedAging = null;
      _selectedCountry = null;
      _selectedFeatures = null;
      _selectedPrice = null;
    });
  }
}




  


  