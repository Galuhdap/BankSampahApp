import 'package:flutter/material.dart';

Row menuKategori(p) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: p
  );
}

Container subMenu(img, txt) {
  return Container(
    width: 150,
    height: 160,
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      shadows: [
        BoxShadow(
          color: Color(0x28000000),
          blurRadius: 17,
          offset: Offset(0, 0),
          spreadRadius: 0,
        )
      ],
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            img,
            width: 70,
            height: 70,
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          Text(
            txt,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    ),
  );
}
