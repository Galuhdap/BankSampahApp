import 'package:banksampah_application/Data/ColorsData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import '../../Components/AppBar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appbar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(children: [
                Container(
                  width: size.width * 0.9,
                  height: 196,
                  decoration: BoxDecoration(
                    color: color1,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Center(
                  child: Container(
                      width: 336,
                      height: 75,
                      decoration: BoxDecoration(
                        color: color2,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("data"),
                          Container(
                            width: 1,
                            height: 75,
                            color: Colors.black,
                          ),
                          Text("ssda")
                        ],
                      )),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
