import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/DioHelper.dart';
import 'package:meals_app/DioHelper1.dart';
import 'package:meals_app/Models/MealsModel.dart';
import 'package:meals_app/Models/Searched_MealModel.dart';
import 'package:meals_app/Modules/Cart_Screen.dart';
import 'package:meals_app/Modules/Search_Screen.dart';
import 'package:meals_app/Modules/Prod_Screen.dart';
import 'package:meals_app/Modules/Profile_Screen.dart';
import 'package:meals_app/Res_LayOut/LayOutCubit/States.dart';

import '../../Consts/Components.dart';
import '../../Models/LogOutModel.dart';
import '../../Models/LoginModel.dart';
import '../../Models/ProfileModel.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit(): super (HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int totalPrice =0;

  List<Widget> Screens=[
    ProdScreen(),
    SearchedItem(),
    CartScreen(),
    ProfileScreen()
  ];
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Image(image: AssetImage('icons/home.png'),color: Colors.grey[700],width: 25.0,height: 25.0,),label: "_"),
    BottomNavigationBarItem(icon: Image(image: AssetImage('icons/loupe.png'),color: Colors.grey[700],width: 25.0,height: 25.0,),label: "_"),
    BottomNavigationBarItem(icon: Image(image: AssetImage('icons/shopping-cart.png'),color: Colors.grey[700],width: 25.0,height: 25.0),label: "_"),
    BottomNavigationBarItem(icon: Image(image: AssetImage('icons/user.png'),color: Colors.grey[700],width: 25.0,height: 25.0),label: "_"),
  ];


  int currentIndex=0;
  void ChangeNavBar(int index){
    currentIndex = index;
    emit(ChangeNavBarState());
  }

  Random random = Random();


  MealsModel? Beef;
  void GetMeals(){

    emit(LoadingGetMeals());
    DioHelper.GetData(
        url: "json/v1/1/filter.php?c=Beef"
    ).then((value) {
      Beef = MealsModel.fromJson(value.data);
      print(Beef!.meals[1].strMeal);
      print(Beef!.meals[2].strMeal);
      int randomNumber;
      double num;
      Beef!.meals.forEach((element){
        randomNumber = random.nextInt(21) + 10;
        num = random.nextDouble() * (5 - 1) + 1;
        element.idMeal=randomNumber;
        element.Rating=num.toString().substring(0,3);

      });

      emit(SuccessGetMeals());
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetMeals(error.toString()));
    });
  }
  MealsModel? Chicken;
  void GetChickenMeals(){

    emit(LoadingGetMeals());
    DioHelper.GetData(
        url: "json/v1/1/filter.php?c=Chicken"
    ).then((value) {
      Chicken = MealsModel.fromJson(value.data);
      print(Chicken!.meals[1].strMeal);
      print(Chicken!.meals[2].strMeal);
      int randomNumber;
      double num;
      Chicken!.meals.forEach((element){
        randomNumber = random.nextInt(21) + 10;
        num = random.nextDouble() * (5 - 1) + 1;
        element.idMeal=randomNumber;
        element.Rating=num.toString().substring(0,3);

      });

      emit(SuccessGetMeals());
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetMeals(error.toString()));
    });
  }
  MealsModel? Dessert;
  void GetDessertMeals(){

    emit(LoadingGetMeals());
    DioHelper.GetData(
        url: "json/v1/1/filter.php?c=Dessert"
    ).then((value) {
      Dessert = MealsModel.fromJson(value.data);
      print(Dessert!.meals[1].strMeal);
      print(Dessert!.meals[2].strMeal);
      int randomNumber;
      double num;
      Dessert!.meals.forEach((element){
        randomNumber = random.nextInt(21) + 10;
        num = random.nextDouble() * (5 - 1) + 1;
        element.idMeal=randomNumber;
        element.Rating=num.toString().substring(0,3);

      });

      emit(SuccessGetMeals());
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetMeals(error.toString()));
    });
  }
  MealsModel? Lamb;
  void GetLambMeals(){

    emit(LoadingGetMeals());
    DioHelper.GetData(
        url: "json/v1/1/filter.php?c=Lamb"
    ).then((value) {
      Lamb = MealsModel.fromJson(value.data);
      print(Lamb!.meals[1].strMeal);
      print(Lamb!.meals[2].strMeal);
      int randomNumber;
      double num;
      Lamb!.meals.forEach((element){
        randomNumber = random.nextInt(21) + 10;
        num = random.nextDouble() * (5 - 1) + 1;
        element.idMeal=randomNumber;
        element.Rating=num.toString().substring(0,3);

      });

      emit(SuccessGetMeals());
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetMeals(error.toString()));
    });
  }
  MealsModel? Miscellaneous;
  void GetMiscellaneousMeals(){

    emit(LoadingGetMeals());
    DioHelper.GetData(
        url: "json/v1/1/filter.php?c=Miscellaneous"
    ).then((value) {
      Miscellaneous = MealsModel.fromJson(value.data);
      print(Miscellaneous!.meals[1].strMeal);
      print(Miscellaneous!.meals[2].strMeal);
      int randomNumber;
      double num;
      Miscellaneous!.meals.forEach((element){
        randomNumber = random.nextInt(21) + 10;
        num = random.nextDouble() * (5 - 1) + 1;
        element.idMeal=randomNumber;
        element.Rating=num.toString().substring(0,3);

      });

      emit(SuccessGetMeals());
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetMeals(error.toString()));
    });
  }
  MealsModel? Pasta;
  void GetPastaMeals(){

    emit(LoadingGetMeals());
    DioHelper.GetData(
        url: "json/v1/1/filter.php?c=Pasta"
    ).then((value) {
      Pasta = MealsModel.fromJson(value.data);
      print(Pasta!.meals[1].strMeal);
      print(Pasta!.meals[2].strMeal);
      int randomNumber;
      double num;
      Pasta!.meals.forEach((element){
        randomNumber = random.nextInt(21) + 10;
        num = random.nextDouble() * (5 - 1) + 1;
        element.idMeal=randomNumber;
        element.Rating=num.toString().substring(0,3);

      });

      emit(SuccessGetMeals());
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetMeals(error.toString()));
    });
  }
  MealsModel? Pork;
  void GetPorkMeals(){

    emit(LoadingGetMeals());
    DioHelper.GetData(
        url: "json/v1/1/filter.php?c=Pork"
    ).then((value) {
      Pork = MealsModel.fromJson(value.data);
      print(Pork!.meals[1].strMeal);
      print(Pork!.meals[2].strMeal);
      int randomNumber;
      double num;
      Pork!.meals.forEach((element){
        randomNumber = random.nextInt(21) + 10;
        num = random.nextDouble() * (5 - 1) + 1;
        element.idMeal=randomNumber;
        element.Rating=num.toString().substring(0,3);

      });

      emit(SuccessGetMeals());
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetMeals(error.toString()));
    });
  }
  MealsModel? Seafood;
  void GetSeafoodMeals(){

    emit(LoadingGetMeals());
    DioHelper.GetData(
        url: "json/v1/1/filter.php?c=Seafood"
    ).then((value) {
      Seafood = MealsModel.fromJson(value.data);
      print(Seafood!.meals[1].strMeal);
      print(Seafood!.meals[2].strMeal);
      int randomNumber;
      double num;
      Seafood!.meals.forEach((element){
        randomNumber = random.nextInt(21) + 10;
        num = random.nextDouble() * (5 - 1) + 1;
        element.idMeal=randomNumber;
        element.Rating=num.toString().substring(0,3);

      });

      emit(SuccessGetMeals());
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetMeals(error.toString()));
    });
  }
  MealsModel? Side;
  void GetSideMeals(){

    emit(LoadingGetMeals());
    DioHelper.GetData(
        url: "json/v1/1/filter.php?c=Side"
    ).then((value) {
      Side = MealsModel.fromJson(value.data);
      print(Side!.meals[1].strMeal);
      print(Side!.meals[2].strMeal);
      int randomNumber;
      double num;
      Side!.meals.forEach((element){
        randomNumber = random.nextInt(21) + 10;
        num = random.nextDouble() * (5 - 1) + 1;
        element.idMeal=randomNumber;
        element.Rating=num.toString().substring(0,3);

      });

      emit(SuccessGetMeals());
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetMeals(error.toString()));
    });
  }
  MealsModel? Starter;
  void GetStarterMeals(){

    emit(LoadingGetMeals());
    DioHelper.GetData(
        url: "json/v1/1/filter.php?c=Starter"
    ).then((value) {
      Starter = MealsModel.fromJson(value.data);
      print(Starter!.meals[1].strMeal);
      print(Starter!.meals[2].strMeal);
      int randomNumber;
      double num;
      Starter!.meals.forEach((element){
        randomNumber = random.nextInt(21) + 10;
        num = random.nextDouble() * (5 - 1) + 1;
        element.idMeal=randomNumber;
        element.Rating=num.toString().substring(0,3);

      });

      emit(SuccessGetMeals());
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetMeals(error.toString()));
    });
  }
  MealsModel? Vegan;
  void GetVeganMeals(){

    emit(LoadingGetMeals());
    DioHelper.GetData(
        url: "json/v1/1/filter.php?c=Vegan"
    ).then((value) {
      Vegan = MealsModel.fromJson(value.data);
      print(Vegan!.meals[1].strMeal);
      print(Vegan!.meals[2].strMeal);
      int randomNumber;
      double num;
      Vegan!.meals.forEach((element){
        randomNumber = random.nextInt(21) + 10;
        num = random.nextDouble() * (5 - 1) + 1;
        element.idMeal=randomNumber;
        element.Rating=num.toString().substring(0,3);

      });

      emit(SuccessGetMeals());
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetMeals(error.toString()));
    });
  }
  MealsModel? Vegetarian;
  void GetVegetarianMeals(){

    emit(LoadingGetMeals());
    DioHelper.GetData(
        url: "json/v1/1/filter.php?c=Vegetarian"
    ).then((value) {
      Vegetarian = MealsModel.fromJson(value.data);
      print(Vegetarian!.meals[1].strMeal);
      print(Vegetarian!.meals[2].strMeal);
      int randomNumber;
      double num;
      Vegetarian!.meals.forEach((element){
        randomNumber = random.nextInt(21) + 10;
        num = random.nextDouble() * (5 - 1) + 1;
        element.idMeal=randomNumber;
        element.Rating=num.toString().substring(0,3);

      });

      emit(SuccessGetMeals());
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetMeals(error.toString()));
    });
  }
  MealsModel? Breakfast;
  void GetBreakfastMeals(){

    emit(LoadingGetMeals());
    DioHelper.GetData(
        url: "json/v1/1/filter.php?c=Breakfast"
    ).then((value) {
      Breakfast = MealsModel.fromJson(value.data);
      print(Breakfast!.meals[1].strMeal);
      print(Breakfast!.meals[2].strMeal);
      int randomNumber;
      double num;
      Breakfast!.meals.forEach((element){
        randomNumber = random.nextInt(21) + 10;
        num = random.nextDouble() * (5 - 1) + 1;
        element.idMeal=randomNumber;
        element.Rating=num.toString().substring(0,3);

      });

      emit(SuccessGetMeals());
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetMeals(error.toString()));
    });
  }


  int ind =0;
  void tabInd(int index){
    ind = index;
    emit(ChangeIndexState());
  }
  SearchedMeal? searchedMeal;
  void GetSearchedMeals({required String name}){

    emit(LoadingGetSearchedMeals());
    DioHelper.GetData(
        url: "json/v1/1/search.php?s=${name}"
    ).then((value) {
      searchedMeal = SearchedMeal.fromJson(value.data);
      double num;
      int randomNumber;

      searchedMeal!.meals.forEach((element){
        randomNumber = random.nextInt(21) + 10;
        num = random.nextDouble() * (5-3) +3;
        element.Rating=num.toString().substring(0,3);
        element.Price=randomNumber;

      });

      emit(SuccessGetSearchedMeals());
    }).catchError((error){
      print(error.toString());
      emit(ErrorGetSearchedMeals(error.toString()));
    });
  }




  int Counter = 1;
  void Increase(){
    Counter++;
    emit(ChangeCounterState());
  }
  void Decrease(){
    if(Counter >1){
    Counter--;
    }
    emit(ChangeCounterState());
  }


  Map<MealsData,int>cartItem={};
  List<MealsData> Citem = [];
  bool inCart=false;
  void AddItem(MealsData sMeal){

   cartItem.forEach((key, value) {
     if(key.strMeal == sMeal.strMeal){
       print(cartItem[key]);
       cartItem[key]=cartItem[key]!+Counter;
       totalPrice+=sMeal.idMeal!*Counter;
       print('do not add');
       inCart = true;
       emit(AddToCartState());
     }
   });

   if(!inCart){
     Citem.add(sMeal);
     cartItem.addAll({
       sMeal : Counter
     });
     totalPrice+=sMeal.idMeal!*Counter;
     print('add');
     print(cartItem[sMeal]);
     emit(AddToCartState());

   }
   inCart = false;
  }

  void AddOldItem(MealsData sMeal) {

      cartItem[sMeal] = cartItem[sMeal]!+ 1;
      totalPrice+=sMeal.idMeal!;
      emit(RemoveFromCartState());

  }
  void RemoveOldItem(MealsData sMeal) {
    if (cartItem[sMeal]! > 1) {
      cartItem[sMeal] = cartItem[sMeal]! - 1;
      totalPrice-=sMeal.idMeal!;
      emit(RemoveFromCartState());
    }
  }

  void DeleteItem(MealsData sMeal) {
    totalPrice-=(sMeal.idMeal!*cartItem[sMeal]!);
    Citem.remove(sMeal);
    cartItem.remove(sMeal);
    emit(DeleteFromCartState());
  }





  ShopUserProfileModel? userData;
  void GetUserData(){
    emit(ShopLoadingGetUserDataState());
    DioHelper1.GetData(
      url: 'profile',
      token: token,
    ).then((value) {
      userData=ShopUserProfileModel.fromJson(value.data);

      print(userData!.data!.name);
      emit(ShopSuccessGetUserDataState(value.data));

    }).catchError((Error){
      print(Error.toString());
      emit(ShopErrorGetUserDataState(Error.toString()));
    });

  }


  LogOutModel? logOutData;
  void LogOut(){

    emit(ShopLoadingLogOutState());
    DioHelper1.PostData(
        url: 'logout',
        data: {
          'fcm_token':token
        }).then((value) {

      logOutData =LogOutModel.fromJson(value.data);
      emit(ShopSuccessLogOutState(logOutData!));

    }).catchError((onError){
      print(onError.toString());
      emit(ShopErrorLogOutState(onError.toString()));
    });

  }

  ShopLoginModel? updatedData;
  void UpdateData({
    required String name,
    required String email,
    required String phone,
    String? password,
    String? image,
  }){

    emit(ShopLoadingUpdateState());

    DioHelper1.PutData(
      url: "update-profile",
      data: {
        "name":name,
        "email":email,
        "phone":phone,
        "password":password,
        "image":image
      },
      token: token,
    ).then((value) {
      updatedData=ShopLoginModel.fromJson(value.data);
      emit(ShopSuccessUpdateState(updatedData!));

    }).catchError((Error){
      print(Error.toString());
      emit(ShopErrorUpdateState(Error));
    });
  }

  bool isPass = true;
  IconData suffix = Icons.visibility_off_outlined;
  void ChangePasswordVisibility(){
    isPass=!isPass;
    isPass? suffix = Icons.visibility_off_outlined : suffix = Icons.visibility_outlined;
    emit(ShopChangePassState());
  }

  int initialIndex=0;
  void inIndex(int index){
   initialIndex =index;
   emit(indIndex());
  }

}