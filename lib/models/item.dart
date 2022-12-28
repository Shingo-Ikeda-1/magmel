import 'dart:io' as io;

class Item {
  final String name;
  final String unit;
  final int price;
  final String image;

  Item(
      {required this.name,
      required this.unit,
      required this.price,
      required this.image});

  Map toJson() {
    return {
      'name': name,
      'unit': unit,
      'price': price,
      'image': image,
    };
  }
}

List<Item> products = [
  Item(
      name: 'Apple',
      unit: 'Kg',
      price: 20,
      image: r'assets\images\art_painting\bridge-gd34aa2fdd_1920.jpg'),
  Item(
      name: 'Mango',
      unit: 'Doz',
      price: 30,
      image: r'assets\images\art_painting\fruit-g3729c9fee_1920.jpg'),
  Item(
      name: 'Banana',
      unit: 'Doz',
      price: 10,
      image: r'assets\images\art_painting\girl-g93a65cf69_1920.jpg'),
  Item(
      name: 'Grapes',
      unit: 'Kg',
      price: 8,
      image: r'assets\images\art_painting\hd-wallpaper-g210bb7cf7_1920.jpg'),
  Item(
      name: 'Water Melon',
      unit: 'Kg',
      price: 25,
      image: r'assets\images\art_painting\painting-ge237bb34c_1920.jpg'),
  Item(name: 'Kiwi', unit: 'Pc', price: 40, image: 'assets/images/kiwi.png'),
  Item(
      name: 'Orange',
      unit: 'Doz',
      price: 15,
      image: r'assets\images\art_painting\watercolor-gb85e93fd8_1280.png'),
  Item(name: 'Peach', unit: 'Pc', price: 8, image: 'assets/images/peach.png'),
  Item(
      name: 'Strawberry',
      unit: 'Box',
      price: 12,
      image: r'assets\images\art_painting\color-gc05769b05_1920.jpg'),
  Item(
      name: 'Fruit Basket',
      unit: 'Kg',
      price: 55,
      image: r'assets\images\art_painting\wall-g6a0f4538e_1280.jpg'),
];
