
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/DioHelper1.dart';

import '../../../Models/LoginModel.dart';
import 'States.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>{

  ShopLoginCubit(): super (ShopLoginInitialState());

  static ShopLoginCubit get(context)=> BlocProvider.of(context);


  late ShopLoginModel loginModel;
  void UserData({required String email,required String password}){
    emit(ShopLoginInLoadingState());

    DioHelper1.PostData(
        url: 'login',
        data: {
          'email':email,
          'password':password
        }
    ).then((value) {

      loginModel = ShopLoginModel.fromJson(value.data);
      print(loginModel.data!.phone);
      emit(ShopLoginInSuccessState(loginModel));
    }).catchError((error){

      emit(ShopLoginInErrorState(error.toString(),loginModel));
    });
  }

  bool isPass = true;
  IconData suffix = Icons.visibility_off_outlined;
  void ChangePasswordVisibility(){
    isPass=!isPass;
    isPass? suffix = Icons.visibility_off_outlined : suffix = Icons.visibility_outlined;
    emit(ShopLoginInChangePasswordState());
  }

}