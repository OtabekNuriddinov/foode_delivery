sealed class CommonLists{

  static List<Map<String, dynamic>> restaurants = [
    {
      'name': 'Lovy Food',
      'time': '10 mins',
      'iconUrl': "assets/icons/lovy_food_icon.png",
    },
    {
      'name': 'Cloudy Resto',
      'time': '14 mins',
      'iconUrl': "assets/icons/cloudy_resto_icon.png",
    },
    {
      'name': 'Circlo Resto',
      'time': '11 mins',
      'iconUrl': "assets/icons/circlo_resto.png",
    },
    {
      'name': 'Haty Food',
      'time': '16 mins',
      'iconUrl': "assets/icons/haty_food.png",
    },
    {
      'name': 'Hearthy Resto',
      'time': '18 mins',
      'iconUrl': "assets/icons/hearthy_resto.png",
    },
    {
      'name': 'Recto Resto',
      'time': '15 mins',
      'iconUrl': "assets/icons/recto_food.png",
    },
  ];

  static List<Map<String, dynamic>> menus = [
    {
      'imageUrl': 'assets/icons/original_salad.png',
      'name': 'Original Salad',
      'type': 'Lovy Food',
      'price': "\$8"
    },
    {
      'imageUrl': 'assets/icons/fresh_salad.png',
      'name': 'Fresh Salad',
      'type': 'Cloudy Resto',
      'price': "\$10"
    },
    {
      'imageUrl': 'assets/icons/yummy_ice_cream.png',
      'name': 'Yummie Ice Cream',
      'type': 'Circle resto',
      'price': "\$6"
    },
    {
      'imageUrl': 'assets/icons/vegan_special.png',
      'name': 'Vegan Special',
      'type': 'Haty Food',
      'price': "\$11"
    },
    {
      'imageUrl': 'assets/icons/mixed_pasta.png',
      'name': 'Mixed Pasta',
      'type': 'Recto Food',
      'price': "\$13"
    },
  ];
}