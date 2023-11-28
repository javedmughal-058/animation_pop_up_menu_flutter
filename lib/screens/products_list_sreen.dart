
import 'package:animation_ui_in_flutter/models/headphones_model.dart';
import 'package:animation_ui_in_flutter/providers/product_provider.dart';
import 'package:animation_ui_in_flutter/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product_detail_screen.dart';

class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({Key? key}) :super(key: key);

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _leftSlideAnimation;
  late Animation<Offset> _rightSlideAnimation;
  late Animation<Offset> _containerAnimation;
  late Animation<Offset> _sizedBoxAnimation;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _leftSlideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _rightSlideAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _containerAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _sizedBoxAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    ProductProvider productProvider = Provider.of<ProductProvider>(context);


    return Scaffold(
      backgroundColor: const Color(0xFFEBEBEB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SlideTransition(
                    position: _containerAnimation,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      child: const Text(
                        'Wireless\nHeadphones',
                        style: TextStyle(
                          fontSize: 24, // Adjust font size as needed
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: _sizedBoxAnimation,
                    child: SizedBox(
                      height: 10,
                      width: 80,
                      child: RotationTransition(
                        turns: const AlwaysStoppedAnimation(270 / 360),
                        child: Image.asset('assets/images/bose logo.png', fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ],
              ),
              productProvider.headphones.isEmpty
                  ? const Text('No Product Available')
                  : GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.600,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: productProvider.headphones.length,
                    itemBuilder: (context, index) {
                      return SlideTransition(
                        position: index % 2 == 0
                            ? _leftSlideAnimation
                            : _rightSlideAnimation,
                        child: buildListItems(context,size: size, index: index),
                      );
                    },
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
