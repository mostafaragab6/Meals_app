import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/Res_LayOut/LayOutCubit/Cubit.dart';
import 'package:meals_app/Res_LayOut/LayOutCubit/States.dart';

class ResLayOut extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      builder: (BuildContext context, HomeStates state) {
        var cubit = HomeCubit.get(context);
        return  Scaffold(

          backgroundColor:  Colors.grey[1],
          appBar: cubit.currentIndex !=3? AppBar(
            title: Row(
              children: [
                Text('Hey, ',),
                Text('Mostafa',
                  style: TextStyle(
                      color: Colors.green
                  ),),
              ],
            ),
            // actions: [
            //   CircleAvatar(
            //     radius: 15.0,
            //     child: Image(image: AssetImage('')),
            //   )
            // ],
          ) :null,

          body: Stack(
            children: [
              cubit.Screens[cubit.currentIndex],
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 15.0,end: 15.0,bottom: 20.0),
                child: Align(
                  alignment: Alignment(0.0,1.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: BottomNavigationBar(
                      backgroundColor: Colors.grey[400],
                      currentIndex: cubit.currentIndex,
                      onTap: (int index){
                        cubit.ChangeNavBar(index);
                      },
                      items: cubit.items,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
      listener: (BuildContext context, HomeStates state) {  },

    );
  }
}
