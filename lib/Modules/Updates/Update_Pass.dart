import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Res_LayOut/LayOutCubit/Cubit.dart';
import '../../Res_LayOut/LayOutCubit/States.dart';

class UpdatePass extends StatelessWidget {

  var newPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      builder: (BuildContext context, HomeStates state) {
        var cubit =HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Edit Name'),
          ),
          body: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: cubit.isPass,
                decoration: InputDecoration(
                  label: Text('Old password'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  suffixIcon: IconButton( onPressed: () {
                    cubit.ChangePasswordVisibility();
                  }, icon: Icon(cubit.suffix),),

                ),
                validator: (value){
                  if(value!.isEmpty){
                    return "Write your old password";
                  }
                },

              ),
              SizedBox(height: 10.0,),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: cubit.isPass,
                decoration: InputDecoration(
                  label: Text('New password'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  suffixIcon: IconButton( onPressed: () {
                    cubit.ChangePasswordVisibility();
                  }, icon: Icon(cubit.suffix),),

                ),
                validator: (value){
                  if(value!.isEmpty){
                    return "Write your new password";
                  }
                },

              ),
              SizedBox(height: 10.0,),

              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: newPass,
                obscureText: cubit.isPass,
                decoration: InputDecoration(
                  label: Text('New password'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  suffixIcon: IconButton( onPressed: () {
                    cubit.ChangePasswordVisibility();
                  }, icon: Icon(cubit.suffix),),

                ),
                validator: (value){
                  if(value!.isEmpty){
                    return "Write your new password";
                  }
                },

              ),
              Container(
                width: double.infinity,
                height: 50.0,
                child: MaterialButton(onPressed: (){

                  cubit.UpdateData(name: cubit.userData!.data!.name!, email: cubit.userData!.data!.email!, phone: cubit.userData!.data!.phone!,password: newPass.text);
                }),
              )
            ],
          ),
        );
      },
      listener: (BuildContext context, HomeStates state) {
        if(state is ShopSuccessUpdateState){
          if(state.userData.status){

            HomeCubit.get(context).GetUserData();
          }
        }
      },

    );
  }
}
