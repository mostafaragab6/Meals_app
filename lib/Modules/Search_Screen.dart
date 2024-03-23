import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:meals_app/Models/Searched_MealModel.dart';
import 'package:meals_app/Res_LayOut/LayOutCubit/Cubit.dart';
import 'package:meals_app/Res_LayOut/LayOutCubit/States.dart';
import 'MealDetails.dart';

class SearchedItem extends StatelessWidget {


  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      builder: (BuildContext context, HomeStates state) {
        var cubit = HomeCubit.get(context);
        return  Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                onChanged: (value){
                  cubit.GetSearchedMeals(name: value);
                },
                keyboardType: TextInputType.text,
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search your meal...',
                  hintStyle: TextStyle(
                      color: Colors.grey[400]
                  ),
                  filled: true,
                  fillColor: Colors.white,

                  suffixIcon: Icon(Icons.search),

                  focusedBorder: OutlineInputBorder(

                      borderSide: BorderSide(

                          color: Colors.white

                      ),

                      borderRadius: BorderRadius.circular(40.0)

                  ),

                  enabledBorder: OutlineInputBorder(

                      borderSide: BorderSide(

                          color: Colors.white

                      ),

                      borderRadius: BorderRadius.circular(20.0)

                  ),

                ),


              ),
            ),
            ConditionalBuilder(
              condition: searchController.text.isNotEmpty, 
              builder: (BuildContext context) { 
                return ConditionalBuilder(
                  condition: cubit.searchedMeal!=null,
                  builder: (BuildContext context) {
                    return Expanded(
                      child: Padding(
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
                                      child: Image(image: NetworkImage("${cubit.searchedMeal!.meals[index].strMealThumb}"),fit: BoxFit.cover,)),
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

                                        Text("${cubit.searchedMeal!.meals[index].strMeal}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 20.0
                                          ),),
                                        SizedBox(height: 8.0,),
                                        Text("${cubit.searchedMeal!.meals[index].strCategory}",
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 20.0
                                          ),),
                                        SizedBox(height: 8.0,),
                                        Text("${cubit.searchedMeal!.meals[index].strArea}",
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 20.0
                                          ),),
                                        SizedBox(height: 8.0,),
                                        Text("${cubit.searchedMeal!.meals[index].Rating}",
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
                            itemCount: cubit.searchedMeal!.meals.length),
                      ),
                    );
                  },
                  fallback: (BuildContext context) => Center(
                    child: SpinKitCircle(
                      color: Colors.green[800],
                    ),
                  )

                );
              },
              fallback: (BuildContext context) =>Center(),
               
            ),
          ],
        );

      },
      listener: (BuildContext context, HomeStates state) {  },

    );
  }
}
