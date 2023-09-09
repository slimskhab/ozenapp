class Food {
  int? foodId;
  String? foodName;
  String? foodCategory;
  String? foodCalories;
  String? foodProtein;
  String? foodCarbs;
  String? foodFat;

  Food(
      {this.foodId,
        this.foodName,
        this.foodCategory,
        this.foodCalories,
        this.foodProtein,
        this.foodCarbs,
        this.foodFat});

  Food.fromJson(Map<String, dynamic> json) {
    foodId = json['food_id'];
    foodName = json['food_name'];
    foodCategory = json['food_category'];
    foodCalories = json['food_calories'];
    foodProtein = json['food_protein'];
    foodCarbs = json['food_carbs'];
    foodFat = json['food_fat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['food_id'] = this.foodId;
    data['food_name'] = this.foodName;
    data['food_category'] = this.foodCategory;
    data['food_calories'] = this.foodCalories;
    data['food_protein'] = this.foodProtein;
    data['food_carbs'] = this.foodCarbs;
    data['food_fat'] = this.foodFat;
    return data;
  }
}