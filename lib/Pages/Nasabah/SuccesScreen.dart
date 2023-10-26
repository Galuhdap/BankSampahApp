import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

import '../../Data/curentFormat.dart';

class SuccesScreen extends StatefulWidget {
  final String kode_invoice;
  final int jumlah_penarikan;
  final int biaya_admin;
  const SuccesScreen({super.key, required this.kode_invoice , required this.jumlah_penarikan , required this.biaya_admin});

  @override
  State<SuccesScreen> createState() => _SuccesScreenState();
}

class _SuccesScreenState extends State<SuccesScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/img/ceklist.png",
              width: 60,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              'PENARIKAN SUKSES',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            SizedBox(
              height: size.height * 0.028,
            ),
            Text(
              'NOMOR INVOICE :',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            SizedBox(
              height: size.height * 0.001,
            ),
            Text(
              widget.kode_invoice,
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 36,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Opacity(
              opacity: 0.80,
              child: Text(
                'Tunjukkan Nomer Invoice Ini\nKepada Admin Bank Sampah',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Opacity(
                    opacity: 0.40,
                    child: Text(
                      'Jumlah Penarikan : ',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                  Text(
                    CurrencyFormat.convertToIdr(widget.jumlah_penarikan, 0),
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: size.width * 0.83,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 0.50,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0xFFB4B4B4),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Opacity(
                    opacity: 0.40,
                    child: Text(
                      'Biaya Admin ',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                  Text(
                    CurrencyFormat.convertToIdr(widget.biaya_admin, 0),
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: size.width * 0.83,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 0.50,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0xFFB4B4B4),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Opacity(
                    opacity: 0.40,
                    child: Text(
                      'Tanggal',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                  Text(
                    DateFormat(' dd MMMM yyyy', 'id_ID').format(DateTime.now()),
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  )
                ],
              ),
            ),

            Container(
              width: size.width * 0.83,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 0.50,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0xFFB4B4B4),
                  ),
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: InkWell(
                onTap: () async {
                  // var total = widget.penjualanModel!.pembayaran_awal! + widget.penjualanModel!.total!;
                  // TransaksiController().konfirmasiPembayaran(widget.penjualanModel!.kode_invoice, total);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                   
                    
                },
                child: Container(
                  width: 327,
                  height: 45,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 38, vertical: 10),
                  decoration: ShapeDecoration(
                    color: Color(0xFF4CAF50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Kembali Ke Beranda',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 1.15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
