import 'package:another_flushbar/flushbar.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:meals_app/Models/Searched_MealModel.dart';
import 'package:meals_app/Res_LayOut/LayOutCubit/Cubit.dart';
import 'package:meals_app/Res_LayOut/LayOutCubit/States.dart';

import '../Models/MealsModel.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      builder: (BuildContext context, HomeStates state) {

        var cubit=HomeCubit.get(context);


        return ConditionalBuilder(
          condition: cubit.Citem.isNotEmpty,
          builder: (BuildContext context) {
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context,index)=> BuildItem(cubit,cubit.Citem[index]),
                      separatorBuilder:(context,index)=> SizedBox(height: 0.0,),
                      itemCount: cubit.Citem.length),
                ),

                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20.0,bottom: 30.0),
                  child: Row(
                    children: [
                      Text('Total Price: ',
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600
                        ),),
                      Text('\$${cubit.totalPrice}.00',
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w400
                        ),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 95.0,start: 20.0,end: 20.0),
                  child: Container(
                    width: double.infinity,
                    height: 70.0,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(50.0)
                    ),
                    child: MaterialButton(onPressed: (){},
                      child: Text('Check out',style:
                      TextStyle(
                          color: Colors.white
                      ),),),
                  ),
                ),
              ],
            );
          },
          fallback: (BuildContext context) {
            return Center(child: Image(image: AssetImage("images/cart.png"),width: 300.0,height: 300.0,));
          },

        );
      },
      listener: (BuildContext context, HomeStates state) {
        if(state is DeleteFromCartState){
          Flushbar(
            padding: EdgeInsets.all(30.0),
            backgroundColor: Colors.red.withOpacity(.5),
            icon: Icon(Icons.close_rounded,color: Colors.white,),
            margin: EdgeInsets.only(top: 30.0,right: 10.0,left: 10.0),
            message: 'Deleted Successfully',
            duration: Duration(seconds: 2),
            flushbarPosition: FlushbarPosition.TOP,
            borderRadius: BorderRadius.circular(20.0),
            barBlur: 15,
            dismissDirection:FlushbarDismissDirection.HORIZONTAL ,
          )..show(context);
        }
      },

    );
  }
}

Widget BuildItem (HomeCubit cubit,MealsData mealData)=>Slidable(
  endActionPane: ActionPane(
      motion: const StretchMotion(),
      children: [
        SlidableAction(
            onPressed: (vlaue){
              cubit.DeleteItem(mealData);
            },
          backgroundColor: Colors.red,
          icon: Icons.delete,
          label: 'Delete',
          spacing: 2,
        )
      ]),
  child:   Padding(

    padding: const EdgeInsets.all(15.0),

    child: Column(

      children: [

        Container(

          width: double.infinity,

          height: 120.0,

          decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(20.0),

              color: Colors.white

          ),

          child: Padding(

            padding: const EdgeInsets.all(8.0),

            child: Row(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                ClipOval(child: Image(image: NetworkImage('${mealData.strMealThumb}'))),

                SizedBox(width: 10.0,),

                Expanded(

                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,

                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      Padding(

                        padding: const EdgeInsetsDirectional.only(end: 8.0),

                        child: Row(

                          children: [

                            Expanded(

                              child: Text('${mealData.strMeal}',

                                maxLines: 1,

                                overflow: TextOverflow.ellipsis,

                                style: TextStyle(



                                    fontSize: 15.0,

                                    fontWeight: FontWeight.w600

                                ),),

                            ),

                            SizedBox(width: 15.0,),

                            Text('\$${mealData.idMeal! * cubit.cartItem[mealData]!}.00',

                                style: TextStyle(

                                    fontSize: 15.0,

                                    fontWeight: FontWeight.w600

                                ),),

                          ],

                        ),

                      ),



                      SizedBox(height: 30.0,),

                      Row(

                        children: [

                          InkWell(

                            onTap: (){

                              cubit.RemoveOldItem(mealData);

                            },

                            child: ClipOval(

                              child: Container(

                                  color: Colors.grey,

                                  child: Icon(Icons.arrow_drop_down)),

                            )

                          ),

                          SizedBox(width: 5.0,),

                          Text('${cubit.cartItem[mealData]}',

                            style: TextStyle(

                                fontSize: 15.0,

                                fontWeight: FontWeight.w600

                            ),),

                          SizedBox(width: 5.0,),

                          InkWell(

                            onTap: (){

                              cubit.AddOldItem(mealData);

                            },

                            child: ClipOval(

                              child: Container(

                                  color: Colors.grey,

                                  child: Icon(Icons.arrow_drop_up)),

                            )

                          )

                        ],

                      ),

                      //

                    ],),

                ),





              ],

            ),

          ),

        ),

      ],

    ),

  ),
);