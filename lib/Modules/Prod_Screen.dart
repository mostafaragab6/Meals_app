import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:meals_app/CacheHelper.dart';
import 'package:meals_app/Models/MealsModel.dart';
import 'package:meals_app/Modules/MealDetails.dart';
import 'package:meals_app/Res_LayOut/LayOutCubit/Cubit.dart';
import 'package:meals_app/Res_LayOut/LayOutCubit/States.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';



class ProdScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      builder: (BuildContext context, HomeStates state) {
        var cubit = HomeCubit.get(context);

        // MealsModel? mealsModel;
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
             children: [

               Padding(
                 padding: const EdgeInsetsDirectional.only(start: 12.0,top: 20.0),
                 child: Text('Delicious Food',
                 style: TextStyle(
                   fontSize: 20.0,
                   fontWeight: FontWeight.w600
                 )),
               ),

               Padding(
                 padding: const EdgeInsetsDirectional.symmetric(horizontal: 12.0),
                 child: Text('Discover and Get Great Food',
                     style: TextStyle(
                         fontSize: 15.0,
                         fontWeight: FontWeight.w300,
                       color: Colors.grey[600]
                     )),
               ),
               SizedBox(height: 20.0,),

               Padding(

                 padding: const EdgeInsetsDirectional.symmetric(horizontal: 12.0),

                 child: Container(

                   width: double.infinity,

                   child: ClipRRect(

                     borderRadius: BorderRadius.circular(20.0),

                     child: Image(image: AssetImage('images/download.png'),



                       fit: BoxFit.cover,

                     ),

                   ),

                 ),

               ),

               SizedBox(height: 20.0,),

               Padding(

                 padding: const EdgeInsetsDirectional.symmetric(horizontal: 12.0),

                 child: Text("Categories",

                   style: TextStyle(

                       fontSize: 25.0,

                       fontWeight: FontWeight.w600

                   ),),

               ),

               SizedBox(height: 20.0,),

               DefaultTabController(
                 initialIndex: CacheHelper.GetData(key: 'initIndex')!= null ?CacheHelper.GetData(key: 'initIndex') :0,
                   length: 13,
                   animationDuration: Duration(seconds: 2),
                   child:

                   TabBar(
                     physics: BouncingScrollPhysics(),
                     unselectedLabelColor: Colors.black,
                     labelColor: Colors.green,
                     indicatorColor: Colors.green,
                     onTap: (index){
                       CacheHelper.saveData(key: 'initIndex', value: index);
                       cubit.tabInd(index);
                       },

                     isScrollable:true,

                     tabs: [

                       Tab(child: Text('Beef',

                         style: TextStyle(

                         ),),),

                       Tab(child: Text('Chicken',

                         style: TextStyle(

                         ),),),

                       Tab(child: Text('Dessert',

                         style: TextStyle(

                         ),),),

                       Tab(child: Text('Lamb',

                         style: TextStyle(

                         ),),),

                       Tab(child: Text('Miscellaneous',

                         style: TextStyle(

                         ),),),

                       Tab(child: Text('Pasta',

                         style: TextStyle(

                         ),),),

                       Tab(child: Text('Pork',

                         style: TextStyle(

                         ),),),

                       Tab(child: Text('Seafood',

                         style: TextStyle(

                         ),),),

                       Tab(child: Text('Side',

                         style: TextStyle(

                         ),),),

                       Tab(child: Text('Starter',

                         style: TextStyle(

                         ),),),

                       Tab(child: Text('Vegan',

                         style: TextStyle(

                         ),),),

                       Tab(child: Text('Vegetarian',

                         style: TextStyle(

                         ),),),

                       Tab(child: Text('Breakfast',

                         style: TextStyle(

                         ),),),



                     ],)

               ),

               SizedBox(height: 10.0,),

               ConditionalBuilder(
                   condition:  cubit.Beef!=null &&cubit.Beef!=null &&cubit.Chicken!=null &&cubit.Dessert!=null &&cubit.Lamb!=null &&cubit.Miscellaneous!=null&&cubit.Pasta!=null&&cubit.Pork!=null &&cubit.Seafood!=null &&cubit.Side!=null &&cubit.Starter!=null &&cubit.Vegan!=null &&cubit.Vegetarian!=null &&cubit.Breakfast!=null ,
                   builder: (context) {
                     List<MealsModel> mealsModel=[cubit.Beef!,cubit.Chicken!,cubit.Dessert!,cubit.Lamb!,cubit.Miscellaneous!,cubit.Pasta!,cubit.Pork!,cubit.Seafood!,cubit.Side!,cubit.Starter!,cubit.Vegan!,cubit.Vegetarian!,cubit.Breakfast!];

                     return BuildItem(mealsModel[cubit.ind], cubit, context);
                   },
                   fallback: (context)=> Center(child: SpinKitCircle(
                     color: Colors.green[800],
                   ))),
             ],
          ),
        );
      },
      listener: (BuildContext context, HomeStates state) {  },

    );
  }
}

var panelConroller = PanelController();

Widget BuildItem(MealsModel model, HomeCubit cubit,context)=> Padding(

                    padding: const EdgeInsets.all(10.0),

                    child: GridView.count(

                      shrinkWrap: true,

                      physics: NeverScrollableScrollPhysics(),

                      crossAxisCount: 2,

                      mainAxisSpacing: 0,

                      crossAxisSpacing: 10,

                      childAspectRatio: 1/1.7,

                      children: List.generate(model.meals.length, (index) => Column(

                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          Container(

                            width: 250.0,

                            height: 190.0,

                            child: ClipRRect(

                                borderRadius: BorderRadius.circular(20.0),

                                child: InkWell(

                                    onTap: (){

                                      cubit.searchedMeal=null;

                                      cubit.GetSearchedMeals(name: model.meals[index].strMeal!);

                                      cubit.Counter=1;

                                      Navigator.push(context, MaterialPageRoute(builder:(context)=>MealDetails(mealData: cubit.searchedMeal,mealsData: model.meals[index],)));

                                    },

                                    child:
                                        Stack(
                                          alignment: AlignmentDirectional.topEnd,
                                          children: [
                                            CachedNetworkImage(imageUrl: '${model.meals[index].strMealThumb}',fit: BoxFit.cover,
                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                            ),
                                            InkWell(
                                              onTap: (){

                                                cubit.searchedMeal = null;
                                                cubit.GetSearchedMeals(name: model.meals[index].strMeal!);
                                                cubit.Counter=1;

                                                Navigator.push(context, MaterialPageRoute(builder:(context)=>MealDetails(mealData: cubit.searchedMeal,mealsData: model.meals[index],)));
                                              },
                                              child: Container(

                                                  width: 40.0,

                                                  height: 35.0,

                                                  decoration: BoxDecoration(

                                                      color: Colors.green.withOpacity(0.7),

                                                      borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),bottomLeft: Radius.circular(20.0))

                                                  ),

                                                  child: Icon(Icons.menu,color: Colors.white,)

                                              ),
                                            )
                                          ],
                                        ),
                                        )),

                          ),

                          SizedBox(height: 10.0,),

                          Padding(

                            padding: const EdgeInsetsDirectional.only(start: 6.0),

                            child: Text("${model.meals[index].strMeal}",

                              maxLines: 1,

                              style: TextStyle(

                                fontSize: 16.0,

                                fontWeight: FontWeight.w700,

                                overflow: TextOverflow.ellipsis,

                              ),



                            ),

                          ),

                          SizedBox(height: 10.0,),

                          Padding(

                            padding: const EdgeInsetsDirectional.only(start: 6.0,end: 6.0),

                            child: Row(

                              children: [

                                Text("\$ ${model.meals[index].idMeal}.00",

                                  style: TextStyle(

                                      fontSize: 22.0,
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.w600

                                  ),),

                                Spacer(),

                                Container(
                                  width: 60.0,
                                  height: 25.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Colors.green[800]
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('${model.meals[index].Rating}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600
                                          ),),
                                      SizedBox(width: 3.0,),
                                      Image(image: AssetImage('icons/star.png'),width: 20.0,height: 18.0,color: Colors.white,)
                                    ],
                                  ),
                                )

                              ],

                            ),

                          ),



                        ],

                      )),

                    ),



           );

