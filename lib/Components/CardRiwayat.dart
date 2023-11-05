import 'package:flutter/material.dart';

Padding cardRiwayat(Size size, clr1, ttl,status, date, number, clr2 , ontp) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: InkWell(
      onTap: ontp,
      child: Stack(
        children: [
          Container(
            width: size.width * 0.9,
            height: 68,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 17,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: ShapeDecoration(
                        color: clr1,
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${number}',
                        style: TextStyle(
                          color: clr2,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 50,
            top: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${ttl}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '$status',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  '$date',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
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

Padding cardRiwayatSampah(Size size, clr1, ttl,status, date, number, clr2) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Stack(
      children: [
        Container(
          width: size.width * 0.9,
          height: 68,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 17,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: ShapeDecoration(
                      color: clr1,
                      shape: OvalBorder(),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${number}',
                      style: TextStyle(
                        color: clr2,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 50,
          top: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${ttl}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '$status Kg',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 13,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '$date',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 13,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
             
            ],
          ),
        ),
      ],
    ),
  );
}

Padding transactionCard(ttl, tgl, rp, hapus, Size size) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Stack(
      children: [
        Container(
          width: 342,
          height: 72,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 16,
                offset: Offset(0, 0),
                spreadRadius: -6,
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: Text(
                    ttl,
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1.15,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tgl,
                      style: TextStyle(
                        color: Color(0xFFA8A8A8),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      rp,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF1EB927),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 1.15,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          left: size.width * 0.765,
          top: size.height * 0.01,
          child: PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: hapus,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: Text(
                    "Hapus",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
            child: Icon(
              Icons.more_vert,
              size: 20,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    ),
  );
}


Padding transactionCard2(ttl,ttl2, hrg, tgl, rp, hapus, Size size) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Stack(
      children: [
        Container(
          width: 342,
          height: 95,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 16,
                offset: Offset(0, 0),
                spreadRadius: -6,
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    ttl,
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1.15,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    ttl2,
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1.15,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    hrg,
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1.15,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                    tgl,
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1.15,
                    ),
                  ),
                    Text(
                      rp,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF1EB927),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 1.15,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Padding contText(Size size, ttl, rp) {
  return Padding(
    padding: const EdgeInsets.only(top: 5, bottom: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: size.width * 0.87,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 0.20,
                strokeAlign: BorderSide.strokeAlignCenter,
                color: Color(0xFFA8A8A8),
              ),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
        Text(
          ttl,
          style: TextStyle(
            color: Color(0xFF333333),
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 5)),
        Text(
          rp,
          style: TextStyle(
            color: Color(0xFF333333),
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}