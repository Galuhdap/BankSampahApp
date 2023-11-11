import 'package:flutter/material.dart';

Padding menuKategori(p) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: p),
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

Padding menuKategori1(p) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: p),
  );
}

InkWell subMenu1(Size size, img, txt1, txt, ontp, clr) {
  return InkWell(
    onTap: ontp,
    child: Container(
      width: size.width * 0.435,
      height: size.height * 0.10,
      decoration: ShapeDecoration(
        color: clr,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        shadows: [
          BoxShadow(
            color: Color.fromARGB(40, 58, 19, 19),
            blurRadius: 17,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset(img, width: 40,height: 40,),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 10), // Sesuaikan dengan jarak yang Anda inginkan
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  txt1,
                  style: TextStyle(
                    color: Color.fromARGB(255, 252, 252, 252),
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  txt,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
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
