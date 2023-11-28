import 'package:animation_ui_in_flutter/providers/product_provider.dart';
import 'package:animation_ui_in_flutter/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:provider/provider.dart';

Widget buildListItems(BuildContext context, {required Size size, required int index}) => FocusedMenuHolder(
  menuWidth: MediaQuery.of(context).size.width * 0.50,
  openWithTap: false,
  menuItems: <FocusedMenuItem>[
    FocusedMenuItem(
        title: const Text("Open"),
        trailingIcon: const Icon(Icons.open_in_new),
        onPressed: ()=> Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductDetailScreen(headphones: Provider.of<ProductProvider>(context).headphones[index])))),
    FocusedMenuItem(
        title: const Text("Share"),
        trailingIcon: const Icon(Icons.share),
        onPressed: () {}),
    FocusedMenuItem(
        title: const Text("Favorite"),
        trailingIcon: const Icon(Icons.favorite_border),
        onPressed: () {}),
    FocusedMenuItem(
        backgroundColor: Colors.red,
        title: const Text(
          "Delete",
          style: TextStyle(color: Colors.white),
        ),
        trailingIcon: const Icon(Icons.delete, color: Colors.white),
        onPressed: () {
          Provider.of<ProductProvider>(context, listen: false).removeHeadphone(index);
        }),
  ],
  onPressed: ()=> Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProductDetailScreen(headphones: Provider.of<ProductProvider>(context).headphones[index]))),
  child: Container(
    margin: const EdgeInsets.all(10), // Consistent margin
    padding: const EdgeInsets.all(10), // Consistent padding
    width: size.width * 0.35,
    height: size.height * 0.45,
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(25)),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: size.height * 0.45 / 3,
          decoration: BoxDecoration(
            // color: Colors.red,
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage(Provider.of<ProductProvider>(context).headphones[index].image),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Provider.of<ProductProvider>(context).headphones[index].name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              Provider.of<ProductProvider>(context).headphones[index].price,
              style: const TextStyle(
                // color: Color(
                //     0xFFEBEBEB), // Adjust text color as needed
                  color: Colors.blue),
            ),
          ],
        ),
      ],
    ),
  ),
);