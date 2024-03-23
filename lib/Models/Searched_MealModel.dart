class SearchedMeal{

  List<MealData>meals=[];

  SearchedMeal.fromJson(Map<String,dynamic>json){
    json["meals"].forEach((element){
      meals.add(MealData.fromJson(element));
    });
  }
}

class MealData{

  String? idMeal;
  String? strMeal;
  String? strCategory;
  String? strArea;
  String? strMealThumb;
  String? strTags;
  String? strYoutube;
  String? strInstructions;
  String? Rating;
  int? Price;

  MealData.fromJson(Map<String,dynamic>json){
    idMeal= json["idMeal"];
    strMeal=json["strMeal"];
    strCategory=json["strCategory"];
    strArea=json["strArea"];
    strInstructions = json["strInstructions"];
    strMealThumb=json["strMealThumb"];
    strTags=json["strTags"];
    strYoutube=json["strYoutube"];
  }
}