class Meal{
  String mealTime, name, imagePath, calories, currentDietPlan;

  Meal(
    {
      required this.mealTime, required this.name, required this.imagePath,
      required this.calories, required this.currentDietPlan,
    }
  );
  
  void setCurrentDietPlan(String x){
    currentDietPlan = x;
  }

}