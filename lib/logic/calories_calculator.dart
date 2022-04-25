class CaloriesCalculator{
  int height;
  int weight;
  int age;
  String condition;
  CaloriesCalculator([this.height = 0, this.weight = 0, this.age = 0, this.condition = '']);
  CaloriesCalculator.n(this.height, this.weight, this.age, this.condition);

  void setHeight(int h){
    height = h;
  }
  void setAge(int a){
    age = a;
  }
  void setweight(int w){
    weight = w;
  }
  void setCondition(String cond){
    condition = cond;
  }
  double calculator(){
    double bmr = 655 + (9.6 * weight) + (1.8 * height) + (4.7 * age);
    if(condition == 'Sedentary'){
      return bmr * 1.2;
    }
    else if(condition == 'Lightly Active'){
      return bmr * 1.375;
    }
    else if(condition == 'Moderately Active'){
      return bmr * 1.55;
    }
    else if(condition == 'Very Active'){
      return bmr * 1.725;
    }
    else if(condition == 'Extra Active'){
      return bmr * 1.9;
    }
    return 0;
  }
}