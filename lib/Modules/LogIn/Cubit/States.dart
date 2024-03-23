import '../../../Models/LoginModel.dart';

abstract class ShopLoginStates {}

class ShopLoginInitialState extends ShopLoginStates{}

class ShopLoginInLoadingState extends ShopLoginStates{

}
class ShopLoginInSuccessState extends ShopLoginStates
{
  ShopLoginModel loginModel ;
  ShopLoginInSuccessState(this.loginModel);
}
class ShopLoginInErrorState extends ShopLoginStates{
  final String error;
  ShopLoginModel loginModel ;

  ShopLoginInErrorState(this.error,this.loginModel);
}

class ShopLoginInChangePasswordState extends ShopLoginStates{}