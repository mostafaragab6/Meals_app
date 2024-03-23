import '../../Models/LogOutModel.dart';
import '../../Models/LoginModel.dart';

abstract class HomeStates{}

class HomeInitialState extends HomeStates{}

class ChangeNavBarState extends HomeStates{}

class LoadingGetMeals extends HomeStates{}
class SuccessGetMeals extends HomeStates{}
class ErrorGetMeals extends HomeStates{
  String error ;
  ErrorGetMeals(this.error);
}

class LoadingGetSearchedMeals extends HomeStates{}
class SuccessGetSearchedMeals extends HomeStates{}
class ErrorGetSearchedMeals extends HomeStates{
  String error ;
  ErrorGetSearchedMeals(this.error);
}

class ChangeCounterState extends HomeStates{}

class AddToCartState extends HomeStates{}

class RemoveFromCartState extends HomeStates{}
class DeleteFromCartState extends HomeStates{}


class ShopLoadingGetUserDataState extends HomeStates {}

class ShopSuccessGetUserDataState extends HomeStates {
  final ShopLoginModel userData;

  ShopSuccessGetUserDataState(this.userData);
}

class ShopErrorGetUserDataState extends HomeStates {
  String error ;
  ShopErrorGetUserDataState(this.error);
}


class ShopLoadingLogOutState extends HomeStates {}

class ShopSuccessLogOutState extends HomeStates {
  final LogOutModel userData;

  ShopSuccessLogOutState(this.userData);
}

class ShopErrorLogOutState extends HomeStates {
  String error ;
  ShopErrorLogOutState(this.error);
}

class ShopLoadingUpdateState extends HomeStates {}

class ShopSuccessUpdateState extends HomeStates {
  final ShopLoginModel userData;

  ShopSuccessUpdateState(this.userData);
}

class ShopErrorUpdateState extends HomeStates {
  String error ;
  ShopErrorUpdateState(this.error);
}

class ChangeIndexState extends HomeStates {}
class ShopChangePassState extends HomeStates {}

class indIndex extends HomeStates {}