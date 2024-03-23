import 'package:another_flushbar/flushbar.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/Res_LayOut/LayOut.dart';
import 'package:meals_app/Res_LayOut/LayOutCubit/Cubit.dart';

import '../../CacheHelper.dart';
import '../../Consts/Components.dart';
import '../Login/LoginScreen.dart';
import 'cubit/Cubit.dart';
import 'cubit/States.dart';

class RegisterScreen extends StatefulWidget {

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {


  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPass = true;

  IconData icon = Icons.visibility_off;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit,ShopRegisterStates>(
        builder: (BuildContext context,  state) {
          return Scaffold(
            backgroundColor: Colors.grey[200],
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [

                      Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 55.0, vertical: 130.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                          width: 300.0,
                          height: 650.0,
                          child: Form(
                            key: formKey,
                            child: Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 15.0, end: 15.0, top: 30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Register",
                                    style: TextStyle(
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey[700]
                                    ),),
                                  SizedBox(height: 15.0,),
                                  Text("Sign Up to prowse our meals",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.grey[500]
                                    ),),
                                  SizedBox(height: 20.0,),
                                  defaultForm(controller: nameController,
                                      prefix: Icons.person,
                                      type: TextInputType.text,
                                      label: "First Name",
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return "PLease enter your first name";
                                        }
                                      }
                                  ),
                                  SizedBox(height: 15.0,),
                                  defaultForm(controller: emailController,
                                      prefix: Icons.email_outlined,
                                      type: TextInputType.emailAddress,
                                      label: "Email Address",
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return "PLease enter your email";
                                        }
                                      }
                                  ), SizedBox(height: 15.0,),
                                  defaultForm(controller: passController,
                                      prefix: Icons.lock,
                                      type: TextInputType.visiblePassword,
                                      label: "Password",
                                      isPassword: isPass,
                                      suffix:
                                      isPass ? icon = Icons.visibility_off : icon =
                                          Icons.visibility,
                                      onClick: () {
                                        setState(() {
                                          isPass = !isPass;
                                        });
                                      },
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return "PLease enter your password";
                                        }
                                      }
                                  ), SizedBox(height: 15.0,),
                                  defaultForm(controller: phoneController,
                                      prefix: Icons.phone,
                                      type: TextInputType.phone,
                                      label: "Phone",
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return "PLease enter your phone number";
                                        }
                                      }
                                  ),
                                  SizedBox(height: 20.0,),
                                  ConditionalBuilder(
                                    condition: state is! ShopRegisterLoadingState,
                                    builder: (BuildContext context) =>  defaultButton(
                                        text: 'REGISTER',
                                        function: ()
                                        {
                                          if(formKey.currentState!.validate()){
                                            ShopRegisterCubit.get(context).RegisterData(
                                                email: emailController.text,
                                                password: passController.text,
                                                name: nameController.text,
                                                phone: phoneController.text);

                                          }

                                        },
                                        color: Colors.green),
                                    fallback: (BuildContext context) =>Center(child: CircularProgressIndicator()),

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }, listener: (BuildContext context, ShopRegisterStates state) {
        if(state is ShopRegisterSuccessState){
          if(state.registerModel.status!){
            print(state.registerModel.message);
            print(state.registerModel.Info!.token);

            Flushbar(
              padding: EdgeInsets.all(30.0),
              backgroundColor: Colors.green.withOpacity(.5),
              icon: Icon(Icons.check_circle_outline,color: Colors.white,),
              margin: EdgeInsets.only(top: 30.0,right: 10.0,left: 10.0),
              message: '${state.registerModel.message}',
              duration: Duration(seconds: 3),
              flushbarPosition: FlushbarPosition.TOP,
              borderRadius: BorderRadius.circular(20.0),
              barBlur: 15,
              dismissDirection:FlushbarDismissDirection.HORIZONTAL ,
            )..show(context);
            CacheHelper.saveData(
                key: 'token',
                value: state.registerModel.Info!.token).then((value) {

              token=state.registerModel.Info!.token;
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


          }else{
            Flushbar(
              padding: EdgeInsets.all(30.0),
              backgroundColor: Colors.red.withOpacity(.5),
              icon: Icon(Icons.close_rounded,color: Colors.white,),
              margin: EdgeInsets.only(top: 30.0,right: 10.0,left: 10.0),
              message: '${state.registerModel.message}',
              duration: Duration(seconds: 3),
              flushbarPosition: FlushbarPosition.TOP,
              borderRadius: BorderRadius.circular(20.0),
              barBlur: 15,
              dismissDirection:FlushbarDismissDirection.HORIZONTAL ,
            )..show(context);
          }
        }
      },

      ),
    );
  }


}

