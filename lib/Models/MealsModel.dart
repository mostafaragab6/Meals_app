class MealsModel{
  MealsModel(){}
  List<MealsData> meals=[];
  
  MealsModel.fromJson(Map<String,dynamic>json){

  json['meals'].forEach((element){
    meals.add(MealsData.fromJson(element));
  })  ;
  }
}

class MealsData{
  String? strMeal;
  String? strMealThumb;
  int? idMeal;
  String? Rating;

  MealsData.fromJson(Map<String,dynamic>json){
    strMeal=json["strMeal"];
    strMealThumb=json["strMealThumb"];
  }

}