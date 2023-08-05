import 'package:flutter/material.dart';

class PoinCard extends StatefulWidget {
  const PoinCard({super.key});

  @override
  State<PoinCard> createState() => _PoinCardState();
}

class _PoinCardState extends State<PoinCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 384,
        height: 196,
        color: Colors.black,
      ),
    );
  }
}