import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/CacheHelper.dart';
import 'package:meals_app/Modules/LogIn/LoginScreen.dart';
import 'package:meals_app/Modules/Prod_Screen.dart';
import 'package:meals_app/Res_LayOut/LayOut.dart';
import 'package:meals_app/Res_LayOut/LayOutCubit/Cubit.dart';
import 'package:meals_app/Res_LayOut/LayOutCubit/States.dart';

import 'Consts/Components.dart';
import 'DioHelper.dart';
import 'DioHelper1.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
await CacheHelper.init();
  DioHelper.init();
  DioHelper1.init();
  token = CacheHelper.GetData(key:'token');

  print(token);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit()..GetMeals()..GetBreakfastMeals()..GetChickenMeals()..GetDessertMeals()..GetLambMeals()..GetMiscellaneousMeals()..GetPastaMeals()..GetPorkMeals()..GetSeafoodMeals()..GetSideMeals()..GetStarterMeals()..GetVeganMeals()..GetVegetarianMeals()..GetUserData(),
      child: BlocConsumer<HomeCubit,HomeStates>(
        builder: (BuildContext context, HomeStates state) {
          return MaterialApp(

            theme: ThemeData(
              textTheme: TextTheme(
                labelMedium: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black
                )
              ),

              appBarTheme: AppBarTheme(
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0
                ),
                  elevation: 0.0,
                  backgroundColor: Colors.grey[100],
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.grey[100],
                    statusBarIconBrightness: Brightness.dark
              )
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.shifting,
                selectedItemColor: Colors.green,
                selectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20.0,

                )
              ),

            ),
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.light,
            home: token !=null? ResLayOut() : ShopLogInScreen(),
          );
        },
        listener: (BuildContext context, HomeStates state) {  },
      ),
    );
  }
}


