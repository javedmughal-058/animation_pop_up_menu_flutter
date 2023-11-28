import 'package:animation_ui_in_flutter/models/headphones_model.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier {


  final headphones = [
    HeadphonesModel(
      name: 'QuietComfort 35 wireless headphones II',
      image: 'assets/images/headphone1.png',
      price: '\$449.99',
    ),
    HeadphonesModel(
      name: 'SoundLink® aroundear wireless headphones',
      image: 'assets/images/headphone2.png',
      price: '\$269.99',
    ),
    HeadphonesModel(
      name: 'Bose Noise Cancelling Headphones 700',
      image: 'assets/images/headphone3.png',
      price: '\$209.99',
    ),
    HeadphonesModel(
      name: 'QuietComfort 35 wireless headphones II',
      image: 'assets/images/headphone4.png',
      price: 'Coming Soon',
    ),
    HeadphonesModel(
      name: 'QuietComfort 35 wireless headphones II',
      image: 'assets/images/headphone1.png',
      price: '\$449.99',
    ),
    HeadphonesModel(
      name: 'SoundLink® aroundear wireless headphones',
      image: 'assets/images/headphone2.png',
      price: '\$269.99',
    ),
    HeadphonesModel(
      name: 'Bose Noise Cancelling Headphones 700',
      image: 'assets/images/headphone3.png',
      price: '\$209.99',
    ),
    HeadphonesModel(
      name: 'QuietComfort 35 wireless headphones II',
      image: 'assets/images/headphone4.png',
      price: 'Coming Soon',
    ),
  ];

  void removeHeadphone(int index) {
    headphones.removeAt(index);
    notifyListeners();
  }


}