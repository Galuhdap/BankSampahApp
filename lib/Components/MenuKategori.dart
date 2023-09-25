import 'package:flutter/material.dart';

Padding menuKategori(p) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: p
    ),
  );
}

InkWell subMenu(Size size, img, txt, ontp) {
  return InkWell(
    onTap: ontp,
    child: Container(
      width: size.width * 0.38,
      height: size.height * 0.18,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: [
          BoxShadow(
            color: Color.fromARGB(40, 58, 19, 19),
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
    ),
  );
}
