import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Res_LayOut/LayOutCubit/Cubit.dart';
import '../../Res_LayOut/LayOutCubit/States.dart';

class UpdateName extends StatelessWidget {

  var FnameController = TextEditingController();
  var LnameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      builder: (BuildContext context, HomeStates state) {
        var cubit =HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Edit Name'),
          ),
          body: Padding(
            padding: const EdgeInsetsDirectional.only(start: 15.0,end: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: FnameController,
                  decoration: InputDecoration(
                      label: Text('First Name'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)
                      )
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Write your first name";
                    }
                  },

                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: LnameController,
                  decoration: InputDecoration(
                      label: Text('Last Name'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)
                      )
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Write your Last name";
                    }
                  },

                ),
                SizedBox(height: 10.0,),

                Container(
                  width: double.infinity,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.green[800],
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: MaterialButton(onPressed: (){
                    String fullName=FnameController.text+LnameController.text;
                    cubit.UpdateData(name: fullName, email: cubit.userData!.data!.email!, phone: cubit.userData!.data!.phone!);
                  },
                    child: Text('Edit',
                    style: TextStyle(
                      color: Colors.white
                    ),),),
                )
              ],
            ),
          ),
        );
      },
      listener: (BuildContext context, HomeStates state) {
        if(state is ShopSuccessUpdateState){
          if(state.userData.status){

           Flushbar(
             padding: EdgeInsets.all(30.0),
             backgroundColor: Colors.green.withOpacity(.5),
             icon: Icon(Icons.check_circle_outline,color: Colors.white,),
             margin: EdgeInsets.only(top: 30.0,right: 10.0,left: 10.0),
             message: '${state.userData.message}',
             duration: Duration(seconds: 2),
             flushbarPosition: FlushbarPosition.TOP,
             borderRadius: BorderRadius.circular(20.0),
             barBlur: 15,
             dismissDirection:FlushbarDismissDirection.HORIZONTAL ,
           )..show(context);

            print(state.userData.message);
            HomeCubit.get(context).GetUserData();

          }else{
            print(state.userData.message);

            Flushbar(
              padding: EdgeInsets.all(30.0),
              backgroundColor: Colors.green.withOpacity(.5),
              icon: Icon(Icons.check_circle_outline,color: Colors.white,),
              margin: EdgeInsets.only(top: 30.0,right: 10.0,left: 10.0),
              message: '${state.userData.message}',
              duration: Duration(seconds: 2),
              flushbarPosition: FlushbarPosition.TOP,
              borderRadius: BorderRadius.circular(20.0),
              barBlur: 15,
              dismissDirection:FlushbarDismissDirection.HORIZONTAL ,
            )..show(context);
          }
        }
      },

    );
  }
}
