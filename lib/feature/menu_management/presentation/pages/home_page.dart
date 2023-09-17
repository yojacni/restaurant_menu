import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu, color: Colors.black),
        ),
        title: const Text('Menu', style: TextStyle(color: Colors.black)),
      ),
      body: _buildBody(),
    );
  }
}

Widget _buildBody() {
  return const ItemContainer(
    width: 300,
    height: 100,
    borderRadius: 40,
  );
}

class ItemContainer extends StatelessWidget {
  const ItemContainer({
    required this.width,
    required this.height,
    super.key,
    this.color,
    this.borderRadius,
  });

  final double width;
  final double height;
  final Color? color;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F1F1),
          borderRadius: BorderRadius.circular(borderRadius ?? 40),
        ),
      ),
    );
  }
}
