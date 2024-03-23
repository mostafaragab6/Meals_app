import 'package:another_flushbar/flushbar.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:meals_app/Modules/Register/Register_Screen.dart';
import 'package:meals_app/Res_LayOut/LayOut.dart';
import '../../CacheHelper.dart';
import '../../Consts/Components.dart';
import '../../Res_LayOut/LayOutCubit/Cubit.dart';
import 'Cubit/Cubit.dart';
import 'Cubit/States.dart';

class ShopLogInScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passController = TextEditingController();

  bool isPass= false;
  IconData icon = Icons.visibility_off_outlined;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit,ShopLoginStates>(
        builder: (BuildContext context, ShopLoginStates state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('LOGIN',style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold
                      ),),
                      SizedBox(height: 15.0,),
                      Text('Login now to prowse our tasty meals',style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                      ),),
                      SizedBox(height:50.0,),
                      Center(child: Image(image: AssetImage('images/restaurant.png'),width: 100.0,height: 100.0,)),
                      SizedBox(height: 50.0,),

                      defaultForm(
                          controller: emailController,
                          prefix: Icons.email_outlined,
                          type: TextInputType.emailAddress,
                          label: "email address",
                          validate: (value){
                            if(value!.isEmpty){
                              return 'you must enter your email address ';
                            }
                          }),
                      SizedBox(height: 15.0,),
                      defaultForm(
                          controller: passController,
                          prefix: Icons.lock,
                          isPassword: ShopLoginCubit.get(context).isPass,
                          type: TextInputType.visiblePassword,
                          label: "Password",
                          validate: (value){
                            if(value!.isEmpty){
                              return 'you must enter your password ';
                            }
                          },
                          suffix: ShopLoginCubit.get(context).suffix,
                          onClick: (){
                            ShopLoginCubit.get(context).ChangePasswordVisibility();
                          }
                      ),
                      SizedBox(height: 20.0,),
                      ConditionalBuilder(
                        condition: state is! ShopLoginInLoadingState,
                        builder: (BuildContext context) =>  defaultButton(
                            text: 'LOGIN',
                            function: ()
                            {
                              if(formKey.currentState!.validate()){
                                ShopLoginCubit.get(context).UserData(
                                    email: emailController.value.text,
                                    password: passController.value.text);

                              }

                            },
                            color: Colors.green),
                        fallback: (BuildContext context) =>Center(child: SpinKitCircle(
                          color: Colors.green[800],
                        )),

                      ),
                      SizedBox(height: 15.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Not have an account?'),
                          TextButton(onPressed: (){
                            navigatTo(context, RegisterScreen());
                          }, child: Text("REGISTER",style: TextStyle(color: Colors.green[800]),))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(child: Image(image: AssetImage('images/search.png'),width: 30.0,height: 30.0,)),
                          SizedBox(width: 50.0,),
                          Center(child: Image(image: AssetImage('images/facebook.png'),width: 30.0,height: 30.0,)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        listener: (BuildContext context, ShopLoginStates state) {
          if(state is ShopLoginInSuccessState){

            if(state.loginModel.status){

              Flushbar(
                padding: EdgeInsets.all(30.0),
                backgroundColor: Colors.green.withOpacity(.5),
                icon: Icon(Icons.check_circle_outline,color: Colors.white,),
                margin: EdgeInsets.only(top: 30.0,right: 10.0,left: 10.0),
                message: '${state.loginModel.message}',
                duration: Duration(seconds: 4),
                flushbarPosition: FlushbarPosition.TOP,
                borderRadius: BorderRadius.circular(20.0),
                barBlur: 15,
                dismissDirection:FlushbarDismissDirection.HORIZONTAL ,
              )..show(context);

              CacheHelper.saveData(key: 'token', value: state.loginModel.data!.token).then((value) {
                token = state.loginModel.data!.token!;

                print(token);
                HomeCubit.get(context).GetUserData();
                HomeCubit.get(context).GetMeals();
                HomeCubit.get(context).GetBreakfastMeals();
                HomeCubit.get(context).GetChickenMeals();
                HomeCubit.get(context).GetDessertMeals();
                HomeCubit.get(context).GetLambMeals();
                HomeCubit.get(context).GetMiscellaneousMeals();
                HomeCubit.get(context).GetPastaMeals();
                HomeCubit.get(context).GetPorkMeals();
                HomeCubit.get(context).GetSeafoodMeals();
                HomeCubit.get(context).GetSideMeals();
                HomeCubit.get(context).GetStarterMeals();
                HomeCubit.get(context).GetVeganMeals();
                HomeCubit.get(context).GetVegetarianMeals();
                navigateAndFinish (context , ResLayOut());
              });


            }
            else {
              print(state.loginModel.message);
              Flushbar(
                padding: EdgeInsets.all(30.0),
                backgroundColor: Colors.red.withOpacity(.5),
                icon: Icon(Icons.close_rounded,color: Colors.white,),
                margin: EdgeInsets.only(top: 30.0,right: 10.0,left: 10.0),
                message: '${state.loginModel.message}',
                duration: Duration(seconds: 2),
                flushbarPosition: FlushbarPosition.TOP,
                borderRadius: BorderRadius.circular(20.0),
                barBlur: 15,
                dismissDirection:FlushbarDismissDirection.HORIZONTAL ,
              )..show(context);
            }
          }else if (state is ShopLoginInErrorState){
            Flushbar(
              padding: EdgeInsets.all(30.0),
              backgroundColor: Colors.red.withOpacity(.5),
              icon: Icon(Icons.close_rounded,color: Colors.white,),
              margin: EdgeInsets.only(top: 30.0,right: 10.0,left: 10.0),
              message: '${state.loginModel.message}',
              duration: Duration(seconds: 2),
              flushbarPosition: FlushbarPosition.TOP,
              borderRadius: BorderRadius.circular(20.0),
              barBlur: 15,
              dismissDirection:FlushbarDismissDirection.HORIZONTAL ,
            )..show(context);
          }
        },

      ),
    );
  }
}
