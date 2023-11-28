
import 'package:animation_ui_in_flutter/models/headphones_model.dart';
import 'package:flutter/material.dart';

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
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.600,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: headphones.length,
                itemBuilder: (context, index) {
                  return SlideTransition(
                    position: index % 2 == 0
                        ? _leftSlideAnimation
                        : _rightSlideAnimation,
                    child: InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailScreen(headphones: headphones[index]))),
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
                                  image: AssetImage(headphones[index].image),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  headphones[index].name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  headphones[index].price,
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
                    ),
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
