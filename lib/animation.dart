import 'dart:developer';

import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage>
    with SingleTickerProviderStateMixin {
  /* <<--------->> variables <<---------->> */
  late AnimationController _animationController;
  late Animation<Offset> _animatedOffset;
  int _selectedImageIndex = 0;
  final List<String> _productImages = <String>[
    "assets/image1.png",
    "assets/image2.png",
    "assets/image3.png",
  ];
  final _availableColors = const [
    Color(0xFF323234),
    Color(0xFFC4E5F4),
    Color(0xFFFDE7D2),
  ];

  /* <<--------->> methods <<---------->> */
  void initAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _animatedOffset = Tween<Offset>(
      begin: const Offset(0, .03),
      end: const Offset(.03, 0),
    ).animate(
      _animationController,
    );
  }

  /* <<--------->> init method <<---------->> */
  @override
  void initState() {
    initAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  /* <<--------->> build method <<---------->> */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              width: 400,
              child: Center(
                child: SlideTransition(
                  position: _animatedOffset,
                  child: Image.asset(
                    key: ValueKey<int>(_selectedImageIndex),
                    _productImages[_selectedImageIndex],
                  ),
                ),
              ),
            ),

            /* <<--------->> item available colors <<---------->> */
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _availableColors.asMap().entries.map(
                  (e) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () {
                          setState(() => _selectedImageIndex = e.key);
                        },
                        child: Material(
                          type: MaterialType.transparency,
                          child: CircleAvatar(
                            backgroundColor: e.value,
                            child: e.key == _selectedImageIndex
                                ? const Icon(
                                    Icons.check_rounded,
                                    size: 15,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /* <<--------->> title <<---------->> */
                            Text(
                              "Boat Rockerz 450R",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            /* <<--------->> description <<---------->> */
                            Text(
                              "Bluetooth Headphones",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      /* <<--------->> cart button <<---------->> */
                      CircleAvatar(
                        backgroundColor: Colors.blueGrey.withOpacity(0.1),
                        child: const Icon(Icons.shopping_bag),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  /* <<--------->> price section <<---------->> */
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "\$23,3",
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "\$21,7",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  /* <<--------->> purchase button <<---------->> */
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            const WidgetStatePropertyAll(Colors.black),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Purchase Now",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
