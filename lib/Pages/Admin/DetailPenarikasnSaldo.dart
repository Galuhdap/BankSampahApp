import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Data/curentFormat.dart';
import 'controller/userController.dart';

class DetailPenarikanSaldoScreen extends StatefulWidget {
  // final String namatransaksi;
  // final String namapembeli;
  // final String tanggal;
  // final String pembayaran;
  // final String kode_invoice;
  // final String hutang;

  // final int subtotal;
  // final int ongkir;
  // final int lain;
  // final int potongan;
  // final int total;
  final String kode_invoice;
  final String kode_nasabah;
  final String kode_admin;
  final int jumlah_penarikan;
  DetailPenarikanSaldoScreen({
    super.key,
    required this.kode_invoice,
    required this.jumlah_penarikan,
    required this.kode_admin,
    required this.kode_nasabah,
    // required this.namatransaksi,
    // required this.namapembeli,
    // required this.tanggal,
    // required this.pembayaran,
    // required this.subtotal,
    // required this.ongkir,
    // required this.potongan,
    // required this.lain,
    // required this.total,
    // required this.kode_invoice,
    // required this.hutang,
  });

  @override
  State<DetailPenarikanSaldoScreen> createState() =>
      _DetailPenarikanSaldoScreenState();
}

class _DetailPenarikanSaldoScreenState
    extends State<DetailPenarikanSaldoScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Column(
              children: [
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
                  height: size.height * 0.03,
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
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: InkWell(
                    onTap: () async {
                      // var total = widget.penjualanModel!.pembayaran_awal! + widget.penjualanModel!.total!;
                      // TransaksiController().konfirmasiPembayaran(widget.penjualanModel!.kode_invoice, total);
                      //   Navigator.pop(context);
                      UserControllerAdmin().konfirmasi(
                          nomor_invoice: widget.kode_invoice,
                          kode_admin: widget.kode_admin,
                          kode_nasabah: widget.kode_nasabah,
                          jumlah_penarikan: widget.jumlah_penarikan);
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 327,
                      height: 45,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 38, vertical: 10),
                      decoration: ShapeDecoration(
                        color: Color(0xFF3F51B5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Konfirmasi',
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
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: InkWell(
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 327,
                      height: 45,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 38, vertical: 10),
                      decoration: ShapeDecoration(
                        color: Color.fromARGB(255, 189, 0, 0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Batal',
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
        ),
      ),
    );
  }

  Padding totals(txt, hrg) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            txt,
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            hrg,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }

  Padding detail(ttl, pcs, total) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ttl,
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '${pcs} x',
                style: TextStyle(
                  color: Color(0xFFA8A8A8),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          Text(
            total,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }

  Column text(Size size, ttl, value) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ttl,
              style: TextStyle(
                color: Color(0xFFA8A8A8),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Container(
            width: size.width * 0.8,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 0.50,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: Color(0xFFA8A8A8),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
