import 'package:another_flushbar/flushbar.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:meals_app/Models/MealsModel.dart';
import 'package:meals_app/Models/Searched_MealModel.dart';
import 'package:meals_app/Res_LayOut/LayOutCubit/Cubit.dart';
import 'package:meals_app/Res_LayOut/LayOutCubit/States.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:url_launcher/url_launcher.dart';

class MealDetails extends StatelessWidget {

  SearchedMeal? mealData;
  MealsData? mealsData;
  int index;
  MealDetails({required this.mealData,this.index=0,this.mealsData});
  var panelConroller = PanelController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      builder: (BuildContext context, HomeStates state) {
        var cubit=HomeCubit.get(context);
        return Scaffold(

          body: ConditionalBuilder(
            condition: (mealsData!=null&&mealData!=null) || mealData!=null ,
            builder: (BuildContext context) {
              return Stack(
                children: [
                  
                  Container(
                      width: double.infinity,
                      height: 550.0,
                      child: mealsData!=null? Image(image: NetworkImage("${mealsData!.strMealThumb}"),fit: BoxFit.cover,) : Image(image: NetworkImage("${mealData!.meals[index].strMealThumb}"),fit: BoxFit.cover,)
                  ),
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Container(
                      color: Colors.black.withOpacity(0.3),
                        width: double.infinity,
                        height: 550.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: (){
                                  launchUrl(Uri.parse(mealData!.meals[index].strYoutube!));
                                },
                                child: Icon(Icons.play_arrow,size: 70.0,color: Colors.grey[500],)),
                            Text('Watch Video',
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[500]
                            ),)
                          ],
                        ),
                    ),
                  ),
                  DraggableScrollableSheet(
                    initialChildSize: 0.5,
                    minChildSize: 0.5,
                    maxChildSize: 1.0,
                    builder: (BuildContext context, ScrollController scrollController) =>
                    SingleChildScrollView(
                      controller:scrollController ,
                      physics:BouncingScrollPhysics() ,
                      child: Container(
                        decoration: BoxDecoration(

                            color:Colors.white,
                            borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(20.0),topEnd: Radius.circular(20.0))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child:mealsData!=null? Text("${mealsData!.strMeal}",
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.w700,
                                      ),) :
                                    Text("${mealData!.meals[index].strMeal}",
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.w700,
                                      ),),
                                  ),
                                  mealsData!=null? Text("\$${mealsData!.idMeal}.00",
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.green[800]
                                    ),):
                                  Text("\$${mealData!.meals[index].Price}.00",
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.green[800]
                                    ),),
                                ],
                              ),
                              SizedBox(height: 15.0,),

                              Row(
                                children: [
                                  Icon(Icons.location_on,color: Colors.grey[700],),
                                  SizedBox(width: 5.0,),
                                  Text('${mealData!.meals[index].strArea}',
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontSize: 19.0
                                    ),),
                                  Text(',  '),
                                  ConditionalBuilder(
                                    condition: mealData!.meals[index].strTags !=null,
                                    builder: (BuildContext context) {
                                      return  Expanded(
                                        child: Text('${mealData!.meals[index].strTags}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                            fontSize: 18.0,
                                          ),),
                                      );
                                    },
                                    fallback: (BuildContext context)=>Expanded(child: Text('')),

                                  ),

                                  Container(
                                    width: 60.0,
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0),
                                        color: Colors.green[800]
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        mealsData!=null? Text('${mealsData!.Rating}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600
                                          ),):Text('${mealData!.meals[index].Rating}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600
                                          ),),
                                        SizedBox(width: 3.0,),
                                        Image(image: AssetImage('icons/star.png'),width: 20.0,height: 18.0,color: Colors.white,)
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 30.0,),



                              SizedBox(height: 5.0,),
                              Text('Instructions :',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600
                                ),),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10.0)
                                ),
                                padding: EdgeInsetsDirectional.only(start: 7.0),
                                child: Expanded(child: Text('${mealData!.meals[index].strInstructions}')),
                              ),

                              SizedBox(height: 30.0,),
                              Text("Quantity",
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w400,
                                ),),
                              SizedBox(height: 20.0,),
                              Row(
                                children: [
                                  Container(
                                    width: 30.0,
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8.0),
                                        color: Colors.grey
                                    ),
                                    child: InkWell(
                                      onTap: (){
                                        cubit.Decrease();
                                      },
                                      child: Center(
                                        child: Text('-',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.white
                                          ),),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10.0,),
                                  Text('${cubit.Counter}',style: TextStyle(
                                      fontSize: 18.0
                                  ),),
                                  SizedBox(width: 10.0,),
                                  Container(
                                    //padding: EdgeInsetsDirectional.all(0.0),
                                    width: 30.0,
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8.0),
                                        color: Colors.green[800]
                                    ),
                                    child: InkWell(
                                      onTap: (){
                                        cubit.Increase();
                                      },
                                      child: Center(
                                        child: Text('+',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.white
                                          ),),
                                      ),
                                    ),
                                  )
                                ],
                              ),

                              SizedBox(height: 20.0,),
                              Center(
                                child: Container(
                                  width: 300.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: Colors.green
                                  ),
                                  child: MaterialButton(onPressed: (){
                                    cubit.AddItem(mealsData!);
                                    Flushbar(
                                      padding: EdgeInsets.all(30.0),
                                      backgroundColor: Colors.green.withOpacity(.5),
                                      icon: Icon(Icons.check_circle_outline,color: Colors.white,),
                                      margin: EdgeInsets.only(top: 30.0,right: 10.0,left: 10.0),
                                      message: 'Added Successfully',
                                      duration: Duration(seconds: 2),
                                      flushbarPosition: FlushbarPosition.TOP,
                                      borderRadius: BorderRadius.circular(20.0),
                                      barBlur: 15,
                                      dismissDirection:FlushbarDismissDirection.HORIZONTAL ,
                                    )..show(context);
                                  },
                                    child:
                                    Text('Add to cart',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.white
                                      ),),),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )



                  ),
                ],
              );

            },
            fallback: (BuildContext context) => Center(child: SpinKitCircle(
              color: Colors.green[800],
            )),

          ),

        );
      },
      listener: (BuildContext context, HomeStates state) {  },

    );
  }
}
