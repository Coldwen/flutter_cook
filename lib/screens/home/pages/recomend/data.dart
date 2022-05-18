class Food {
  int key;
  String name;
  String? url;
  List<Food>? foods;

  Food(this.key, this.name, {this.url, this.foods});
}

List<Food> initFood() {
  List<Food> foods = [];
  foods.addAll([
    Food(1, '菜系', foods: [
      Food(1, '蔬菜', url: 'assets/category_vegetables.jpg'),
      Food(2, '沙拉', url: 'assets/category_salad.jpg'),
      Food(3, '小吃', url: 'assets/category_snack.jpg'),
      Food(4, '甜品', url: 'assets/category_sweetmeat.jpg'),
      Food(5, '便当', url: 'assets/category_bento.jpg'),
      Food(6, '蛋糕', url: 'assets/category_cake.jpg'),
    ]),
    Food(2, '菜式', foods: [
      Food(1, '川菜', url: 'assets/category_sichuan_food.jpg'),
      Food(2, '湘菜', url: 'assets/category_hunan_food.jpg'),
      Food(3, '鲁菜', url: 'assets/category_shangdong_food.jpg'),
      Food(4, '西餐', url: 'assets/category_western_food.jpg'),
      Food(5, '日式', url: 'assets/category_japanese_food.jpg'),
      Food(6, '韩式', url: 'assets/category_korean_food.jpg'),
    ]),
    Food(3, '食材', foods: [
      Food(1, '海鲜', url: 'assets/category_seafood.jpg'),
      Food(2, '水果', url: 'assets/category_fruit.jpg'),
      Food(3, '奶类', url: 'assets/category_milk.jpg'),
    ]),
    Food(4, '场景', foods: [
      Food(1, '哄娃', url: 'assets/category_coax_baby.jpg'),
      Food(2, '夏天', url: 'assets/category_summer.jpg'),
    ]),
  ]);

  return foods;
}
