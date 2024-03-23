import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/Models/Searched_MealModel.dart';
import 'package:meals_app/Res_LayOut/LayOutCubit/Cubit.dart';
import 'package:meals_app/Res_LayOut/LayOutCubit/States.dart';
import 'MealDetails.dart';

class SearchedItem extends StatelessWidget {
  SearchedMeal searchedMeal;
  SearchedItem(this.searchedMeal,);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      builder: (BuildContext context, HomeStates state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.separated(
                itemBuilder: (context,index)=>Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    InkWell(
                      onTap: (){
                        cubit.Counter=1;
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>MealDetails(mealData: cubit.searchedMeal!,index: index,)));
                      },                  child: Container(
                      width: double.infinity,
                      height: 200.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35.0)
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(35.0),
                          child: Image(image: NetworkImage("${searchedMeal.meals[index].strMealThumb}"),fit: BoxFit.cover,)),
                    ),
                    ),
                    Container(
                      width: 300.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.0),
                              Colors.black.withOpacity(0.1),
                              Colors.black.withOpacity(0.2),
                              Colors.black.withOpacity(0.4),
                              Colors.black.withOpacity(0.5),
                              Colors.black.withOpacity(0.6),
                              Colors.black.withOpacity(0.7),
                              Colors.black.withOpacity(0.8),
                              Colors.black.withOpacity(0.9),

                            ]),

                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(top: 10.0,end: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [

                            Text("${searchedMeal.meals[index].strMeal}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 20.0
                              ),),
                            SizedBox(height: 8.0,),
                            Text("${searchedMeal.meals[index].strCategory}",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 20.0
                              ),),
                            SizedBox(height: 8.0,),
                            Text("${searchedMeal.meals[index].strArea}",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 20.0
                              ),),
                            SizedBox(height: 8.0,),
                            Text("${searchedMeal.meals[index].Rating}",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 20.0
                              ),),
                          ],
                        ),
                      ),

                    ),


                  ],
                ),
                separatorBuilder: (context,index)=>SizedBox(height: 30.0,),
                itemCount: searchedMeal.meals.length),
          ),
        );
      },
      listener: (BuildContext context, HomeStates state) {  },

    );
  }
}
