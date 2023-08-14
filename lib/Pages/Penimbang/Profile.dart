import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfilePenimbang extends StatefulWidget {
  const ProfilePenimbang({super.key});

  @override
  State<ProfilePenimbang> createState() => _ProfilePenimbangState();
}

class _ProfilePenimbangState extends State<ProfilePenimbang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("PageProfilePenimbang"),
        ),
      ),
    );
  }
}