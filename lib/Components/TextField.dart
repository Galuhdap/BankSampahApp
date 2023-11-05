import 'package:flutter/material.dart';

Padding fieldText(Size size, ttl, lbl, e ,ctrl) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 19),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 5),
          child: Text(
            ttl,
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 13,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          width: size.width * 0.75,
          child: TextField(
            controller: ctrl,
            enabled: e,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 2.0,
                ),
              ),
              filled: true,
              fillColor: Color(0xFFE6F4F1),
              isDense: true,
            ),
            style: TextStyle(
              fontSize: 16.0,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        )
      ],
    ),
  );
}

Padding fieldText1(Size size, ttl,  e, txtController, key) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 19),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 5),
          child: Text(
            ttl,
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 13,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          width: size.width * 0.75,
          child: TextField(
            keyboardType: key,
            controller: txtController,
            enabled: e,
            decoration: InputDecoration(
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 2.0,
                ),
              ),
              filled: true,
              fillColor: Colors.white.withOpacity(0.5),
              isDense: true,
            ),
            style: TextStyle(
              fontSize: 16.0,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        )
      ],
    ),
  );
}

Padding fieldText2(Size size, ttl, e, txtController, key) {
  return Padding(
    padding: const EdgeInsets.only(left: 25, bottom: 19),
    //padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 5),
          child: Text(
            ttl,
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 13,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          width: size.width * 0.3,
          height: 50,
          child: TextField(
            controller: txtController,
            keyboardType: key,
            enabled: e,
            decoration: InputDecoration(
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 2.0,
                ),
              ),
              filled: true,
              fillColor: Colors.white.withOpacity(0.5),
              isDense: true,
            ),
            style: TextStyle(
              fontSize: 16.0,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        )
      ],
    ),
  );
}

Padding textField2(Size size, ttl, lbl, e) {
  return Padding(
    padding: const EdgeInsets.only(left: 28, bottom: 19, right: 28),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 5),
          child: Text(
            ttl,
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 13,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          width: size.width * 0.3,
          height: 50,
          child: TextField(
            enabled: e,
            decoration: InputDecoration(
              labelText: lbl,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 2.0,
                ),
              ),
              filled: true,
              fillColor: Color(0xFFE6F4F1),
              isDense: true,
            ),
            style: TextStyle(
              fontSize: 16.0,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        )
      ],
    ),
  );
}
