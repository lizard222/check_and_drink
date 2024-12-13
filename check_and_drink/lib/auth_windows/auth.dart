import 'package:check_and_drink/auth_windows/registration_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Регистрация/Вход',
        theme: ThemeData(
      
          scaffoldBackgroundColor: const Color.fromARGB(255, 250, 243, 224), 
        ),
        home: RegistrationScreen(),
      ),
    );
  }
}
