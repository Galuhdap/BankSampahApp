import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

import '../../../../Data/curentFormat.dart';
import '../../Models/LaporanSemuaModel.dart';
import '../../Models/UsersSuperAdminModel.dart';

class PdfLaporanSemuaInduk {
  //ini untuk pdf flutter
  Future<Uint8List> generate(LaporanSemua invoice) async {
    final pdf = Document();

    pdf.addPage(MultiPage(
      build: (context) => [
        buildHeader(invoice),
        SizedBox(height: 2 * PdfPageFormat.cm),
        buildTitle('Laporan Setor Sampah Nasabah'),
        buildTabelSetorNasabah(invoice),
        Divider(),

        SizedBox(height: 2 * PdfPageFormat.cm),
        buildTitle('Laporan Setor Sampah Bank Sampah Admin'),
        buildTabelSetorAdmin(invoice),
        Divider(),

        SizedBox(height: 2 * PdfPageFormat.cm),
        buildTitle('Laporan Penjualan Sampah Bank Sampah Induk'),
        buildTabelSusutInduk(invoice),
        Divider(),

        SizedBox(height: 2 * PdfPageFormat.cm),
        buildTitle('Laporan Tarik Saldo Nasabah'),
        buildTabelTarikDanaNasabah(invoice),
        Divider(),
        SizedBox(height: 2 * PdfPageFormat.cm),
        buildTitle('Laporan Tarik Saldo Bank Sampah Admin'),
        buildTabelTarikDanaAdmin(invoice),
        Divider(),
        // totals3(invoice),
        SizedBox(height: 2 * PdfPageFormat.cm),
        buildTitle('Laporan Pengguna Nasabah'),
        buildTabelPenggunaNasabah(invoice),
        Divider(),

        SizedBox(height: 2 * PdfPageFormat.cm),
        buildTitle('Laporan Pengguna Penimbang'),
        buildTabelPenggunaPenimbang(invoice),
        Divider(),

        SizedBox(height: 2 * PdfPageFormat.cm),
        buildTitle('Laporan Pengguna Bank Sampah Admin'),
        buildTabelPenggunaAdmin(invoice),
        Divider(),

        SizedBox(height: 2 * PdfPageFormat.cm),
        buildTitle('Laporan Tarik Keuntungan'),
        buildTabelTarikKeuntungan(invoice),
        Divider(),

        SizedBox(height: 2 * PdfPageFormat.cm),
        buildTitle('Laporan Catatan Pengeluaran'),
        buildTabelPengeluaran(invoice),
        Divider(),

        SizedBox(height: 2 * PdfPageFormat.cm),
        SizedBox(height: 2 * PdfPageFormat.cm),
        Divider(),

        buildTotals(invoice),
      ],
      // footer: (context) => buildFooter(invoice),
    ));

    return pdf.save();
  }

  //ini untuk header
  static Widget buildHeader(LaporanSemua invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1 * PdfPageFormat.cm),
          Center(
            child: buildJudul(invoice.userModel),
          ),
        ],
      );

  static Widget totals(LaporanSemua lprn) => Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            CurrencyFormat.convertToIdr(
                                lprn.all.pemblihanbahan, 0),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                      ]),
                )
              ],
            ),
          ),
        ],
      );
  static Widget totals2(LaporanSemua lprn) => Column(
        children: [
          Container(
            width: 475,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Text(CurrencyFormat.convertToIdr(lprn.all.pengeluaran, 0),
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              ],
            ),
          ),
        ],
      );
  static Widget totals3(LaporanSemua lprn) => Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(CurrencyFormat.convertToIdr(lprn.all.penjualan, 0),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13)),
                      ]),
                )
              ],
            ),
          ),
        ],
      );
//ini untuk judul
  static Widget buildJudul(UsersSuperAdmin users) => Column(
        children: [
          Text('Laporan Semua ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
          Text(users.namaSuperAdmin.toString(), style: TextStyle(fontSize: 18)),
          Text(users.alamat.toString(), style: TextStyle(fontSize: 15)),
          Text(
              DateFormat(' dd MMMM yyyy', 'id_ID')
                  .format(DateTime.now())
                  .toString(),
              style: TextStyle(fontSize: 15)),
        ],
      );

  // ini buat Judul
  static Widget buildTitle(ttl) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ttl,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
        ],
      );

  static Widget buildTabelPenggunaAdmin(LaporanSemua invoice) {
    final headers = [
      'Tanggal',
      'Kode BS',
      'Nama BS',
      'No Telp',
      'Berat',
      'Saldo',
    ];
    final data = invoice.itemsAdmin.map((item) {
      return [
        DateFormat(' dd MMMM yyyy', 'id_ID')
            .format(DateTime.parse(item.createdAt.toString())),
        item.kodeAdmin,
        item.namaBs,
        '${item.noTelp}',
        item.berat,
        CurrencyFormat.convertToIdr(item.saldo, 0),
        //   item.detailSampahBs![0].saldo,
      ];
    }).toList();

    return Table.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerRight,
        2: Alignment.centerRight,
        3: Alignment.centerRight,
        4: Alignment.centerRight,
        5: Alignment.centerRight,
        6: Alignment.centerRight,
        7: Alignment.centerRight,
        8: Alignment.centerRight,
      },
    );
  }

  static Widget buildTabelPenggunaPenimbang(LaporanSemua invoice) {
    final headers = [
      'Tanggal',
      'Kode Penimbang',
      'Nama Penimbang',
      'No Telp',
      'Alamat',
    ];
    final data = invoice.itemsPenimbang.map((item) {
      return [
        DateFormat(' dd MMMM yyyy', 'id_ID')
            .format(DateTime.parse(item.createdAt.toString())),
        item.kodePenimbang,
        item.namaPenimbang,
        item.noTelp,
        item.alamat
        //   item.detailSampahBs![0].saldo,
      ];
    }).toList();

    return Table.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerRight,
        2: Alignment.centerRight,
        3: Alignment.centerRight,
        4: Alignment.centerRight,
      },
    );
  }

  static Widget buildTabelPenggunaNasabah(LaporanSemua invoice) {
    final headers = [
      'Tanggal',
      'Kode',
      'Nama',
      'No Tlp',
      'Alamat',
      'Berat',
      'Saldo'
    ];
    final data = invoice.itemsNasabah.map((item) {
      return [
        DateFormat(' dd MMMM yyyy', 'id_ID')
            .format(DateTime.parse(item.createdAt.toString())),
        item.kodeNasabah,
        item.namaNasabah,
        item.noTelp,
        item.alamat,
        item.berat,
        CurrencyFormat.convertToIdr(item.saldo, 0),
        //   item.detailSampahBs![0].saldo,
      ];
    }).toList();

    return Table.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
      headerDecoration: BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerRight,
        2: Alignment.centerRight,
        3: Alignment.centerRight,
        4: Alignment.centerRight,
        5: Alignment.centerRight,
        6: Alignment.centerRight,
      },
    );
  }

  static Widget buildTabelSetorNasabah(LaporanSemua invoice) {
    final headers = [
      'Tanggal',
      'Kode Setor',
      'Nasabah',
      'Penimbang',
      'Barang',
      'berat',
      'total',
    ];
    final data = invoice.itemsSetorNasabah.map((item) {
      return [
        DateFormat(' dd MMMM yyyy', 'id_ID')
            .format(DateTime.parse(item.createdAt.toString())),
        item.kodeSetor,
        item.nasabah,
        item.penimbang,
        item.barang,
        item.berat,
        CurrencyFormat.convertToIdr(item.total, 0),

        //   item.detailSampahBs![0].saldo,
      ];
    }).toList();

    return Table.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
      headerDecoration: BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerRight,
        2: Alignment.centerRight,
        3: Alignment.centerRight,
        4: Alignment.centerRight,
        5: Alignment.centerRight,
        6: Alignment.centerRight,
      },
    );
  }

  static Widget buildTabelSetorAdmin(LaporanSemua invoice) {
    final headers = [
      'Tanggal',
      'Kode Setor',
      'Admin',
      'Barang',
      'berat',
      'harga',
    ];
    final data = invoice.itemsSetorAdmin.map((item) {
      return [
        DateFormat(' dd MMMM yyyy', 'id_ID')
            .format(DateTime.parse(item.createdAt.toString())),
        item.kodeSusutSampahBs,
        item.admin,
        item.barang,
        item.berat,
        CurrencyFormat.convertToIdr(item.harga, 0),

        //   item.detailSampahBs![0].saldo,
      ];
    }).toList();

    return Table.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerRight,
        2: Alignment.centerRight,
        3: Alignment.centerRight,
        4: Alignment.centerRight,
        5: Alignment.centerRight,
        6: Alignment.centerRight,
      },
    );
  }

  static Widget buildTabelSusutInduk(LaporanSemua invoice) {
    final headers = [
      'Tanggal',
      'KS',
      'NP',
      'Barang',
      'berat',
      'harga',
      'total',
    ];
    final data = invoice.itemsSusutSampahInduk.map((item) {
      return [
        DateFormat(' dd MMMM yyyy', 'id_ID')
            .format(DateTime.parse(item.createdAt.toString())),
        item.kodeSusutInduk,
        item.namaPembeli,
        item.barang,
        item.berat,
        CurrencyFormat.convertToIdr(item.harga, 0),
        CurrencyFormat.convertToIdr(item.total, 0),
        //   item.detailSampahBs![0].saldo,
      ];
    }).toList();

    return Table.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
      headerDecoration: BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerRight,
        1: Alignment.centerRight,
        2: Alignment.centerRight,
        3: Alignment.centerRight,
        4: Alignment.centerRight,
        5: Alignment.centerRight,
        6: Alignment.centerRight,
        7: Alignment.centerRight,
      },
    );
  }

  static Widget buildTabelTarikDanaAdmin(LaporanSemua invoice) {
    final headers = [
      'Tanggal',
      'Nomer Invoice',
      'Admin',
      'Jumlah Penarikan',
    ];
    final data = invoice.itemspenarikanDanaAdmin.map((item) {
      return [
        DateFormat(' dd MMMM yyyy', 'id_ID')
            .format(DateTime.parse(item.createdAt.toString())),
        item.nomorInvoice,
        item.namaAdmin,
        CurrencyFormat.convertToIdr(item.jumlahPenarikan, 0),

        //   item.detailSampahBs![0].saldo,
      ];
    }).toList();

    return Table.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerRight,
        2: Alignment.centerRight,
        3: Alignment.centerRight,
        4: Alignment.centerRight,
      },
    );
  }

  static Widget buildTabelTarikDanaNasabah(LaporanSemua invoice) {
    final headers = [
      'Tanggal',
      'Nomer Invoice',
      'Nasabah',
      'Admin',
      'Jumlah Penarikan',
    ];
    final data = invoice.itemspenarikanDanaNasabah.map((item) {
      return [
        DateFormat(' dd MMMM yyyy', 'id_ID')
            .format(DateTime.parse(item.createdAt.toString())),
        item.nomorInvoice,
        item.namaNasabah,
        item.namaAdmin,
        CurrencyFormat.convertToIdr(item.jumlahPenarikan, 0),
        //   item.detailSampahBs![0].saldo,
      ];
    }).toList();

    return Table.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerRight,
        2: Alignment.centerRight,
        3: Alignment.centerRight,
        4: Alignment.centerRight,
      },
    );
  }

  static Widget buildTabelPengeluaran(LaporanSemua invoice) {
    final headers = [
      'Tanggal',
      'Kode ',
      'Nama',
      'Uang Keluar',
      'Catatan',
    ];
    final data = invoice.itemsCatatPengeluaran.map((item) {
      return [
        DateFormat(' dd MMMM yyyy', 'id_ID')
            .format(DateTime.parse(item.createdAt.toString())),
        item.kodePengeluaran,
        item.namaPengeluaran,
        CurrencyFormat.convertToIdr(item.harga, 0),
         item.catatan,
        //   item.detailSampahBs![0].saldo,
      ];
    }).toList();

    return Table.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerRight,
        2: Alignment.centerRight,
        3: Alignment.centerRight,
        4: Alignment.centerRight,
      },
    );
  }

  static Widget buildTabelTarikKeuntungan(LaporanSemua invoice) {
    final headers = [
      'Tanggal',
      'Nomer Invoice',
      'Admin',
      'Jumlah Penarikan',
    ];
    final data = invoice.itemstarikKeuntungan.map((item) {
      return [
        DateFormat(' dd MMMM yyyy', 'id_ID')
            .format(DateTime.parse(item.createdAt.toString())),
        item.nomorInvoice,
        item.kodeAdmin,
        CurrencyFormat.convertToIdr(item.jumlahPenarikan, 0),
        //   item.detailSampahBs![0].saldo,
      ];
    }).toList();

    return Table.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerRight,
        2: Alignment.centerRight,
        3: Alignment.centerRight,
        4: Alignment.centerRight,
      },
    );
  }

// //ini untuk kaki
//   static Widget buildFooter(LaporanSemua invoice) => Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Divider(),
//           SizedBox(height: 2 * PdfPageFormat.mm),
//           buildSimpleText(
//               title: 'Address', value: invoice.userModel.alamat.toString()),
//           SizedBox(height: 1 * PdfPageFormat.mm),
//         ],
//       );

  static buildSimpleText({
    required String title,
    required String value,
  }) {
    final style = TextStyle(fontWeight: FontWeight.bold);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        Text(title, style: style),
        SizedBox(width: 2 * PdfPageFormat.mm),
        Text(value),
      ],
    );
  }

  static Widget buildTotals(LaporanSemua invoice) {
    return Container(
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(
                  title: 'Saldo Keuntungan',
                  value: CurrencyFormat.convertToIdr(invoice.all.kas, 0),
                  unite: true,
                ),
                buildText(
                  title: 'Saldo Penjualan',
                  value: CurrencyFormat.convertToIdr(invoice.all.kas, 0),
                  unite: true,
                ),
                buildText(
                  title: 'Total Penjualan Sampah Induk',
                  value: '${invoice.all.pemblihanbahan} Kg',
                  unite: true,
                ),
                buildText(
                  title: 'Total Sampah Masuk',
                  value: '${invoice.all.pengeluaran} Kg',
                  unite: true,
                ),
                // buildText(
                //   title: 'Total Sampah',
                //   value: '${invoice.all.penjualan} Kg',
                //   unite: true,
                // ),
                // Divider(),
                // buildText(
                //   title: 'Total Keseluruhan',
                //   titleStyle: TextStyle(
                //     fontSize: 14,
                //     fontWeight: FontWeight.bold,
                //   ),
                //   value: CurrencyFormat.convertToIdr(invoice.all.total, 0),
                //   unite: true,
                // ),
                SizedBox(height: 2 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
                SizedBox(height: 0.5 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static buildText({
    required String title,
    required String value,
    double width = double.infinity,
    TextStyle? titleStyle,
    bool unite = false,
  }) {
    final style = titleStyle ?? TextStyle(fontWeight: FontWeight.bold);

    return Container(
      width: width,
      child: Row(
        children: [
          Expanded(child: Text(title, style: style)),
          Text(value, style: unite ? style : null),
        ],
      ),
    );
  }
}
