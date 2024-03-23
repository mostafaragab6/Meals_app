import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../CacheHelper.dart';
import '../Consts/Components.dart';
import '../Res_LayOut/LayOutCubit/Cubit.dart';
import '../Res_LayOut/LayOutCubit/States.dart';
import 'LogIn/LoginScreen.dart';
import 'Updates/Choose_Update_Screen.dart';
class ProfileScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      builder: (BuildContext context, HomeStates state) {
        var cubit=HomeCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.userData !=null,
          builder: (BuildContext context) {
            return SafeArea(
              child: Column(

                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top: 70.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 80.0,
                          child: Image(image: AssetImage("images/user.png"),width: 100.0,height: 100.0,),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Text('${cubit.userData!.data!.name}',
                        style:TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ) ,),
                      Text('${cubit.userData!.data!.email}',
                        style: TextStyle(
                            color: Colors.grey[600]
                        ),),
                      SizedBox(height: 10.0,),
                    ],
                  ),




                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,

                      children: [
                        Icon(Icons.security_update),
                        SizedBox(width: 10.0,),
                        Expanded(
                          child: TextButton(
                              onPressed: (){

                               navigatTo(context, UpdateScreen());

                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Update",
                                    style: TextStyle(
                                        color: Colors.black
                                    ),
                                  ),
                                ],
                              )),
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,

                      children: [
                        Icon(Icons.settings),
                        SizedBox(width: 10.0,),
                        Expanded(
                          child: TextButton(
                              onPressed: (){

                                //navigatTo(context, SettingsScreen());

                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Settings",
                                    style: TextStyle(
                                        color: Colors.black
                                    ),
                                  ),
                                ],
                              )),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,

                      children: [
                        Icon(Icons.logout),
                        SizedBox(width: 10.0,),
                        Expanded(
                          child: TextButton(
                              onPressed: (){
                                CacheHelper.deleteData(key: 'token'
                                ).then((value) {
                                  if(value){
                                    HomeCubit.get(context).userData=null;
                                    HomeCubit.get(context).Beef=null;
                                    HomeCubit.get(context).Breakfast=null;
                                    HomeCubit.get(context).Vegetarian=null;
                                    HomeCubit.get(context).Vegan=null;
                                    HomeCubit.get(context).Starter=null;
                                    HomeCubit.get(context).Side=null;
                                    HomeCubit.get(context).Seafood=null;
                                    HomeCubit.get(context).Pork=null;
                                    HomeCubit.get(context).Pasta=null;
                                    HomeCubit.get(context).Miscellaneous=null;
                                    HomeCubit.get(context).Chicken=null;
                                    HomeCubit.get(context).Dessert=null;
                                    HomeCubit.get(context).Lamb=null;
                                    HomeCubit.get(context).ind=0;
                                    HomeCubit.get(context).currentIndex=0;
                                    CacheHelper.deleteData(key: 'initIndex');
                                    navigateAndFinish(context, ShopLogInScreen());
                                  }
                                });

                                cubit.LogOut();

                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("LogOut",
                                    style: TextStyle(
                                        color: Colors.black
                                    ),
                                  ),
                                ],
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),

            );
          },
          fallback: (BuildContext context) {
            return Center(child: SpinKitCircle(
              color: Colors.green[800],
            ));
          },

        );
      },
      listener: (BuildContext context, HomeStates state) {  },

    );
  }
}



