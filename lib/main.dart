import 'package:animation_ui_in_flutter/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/products_list_sreen.dart';

void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => ProductProvider()),
          ],
          child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductsListScreen(),
    );
  }
}
