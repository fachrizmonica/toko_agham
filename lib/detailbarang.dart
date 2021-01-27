import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:toko_agham/koneksi.dart';


class Detailbarang extends StatefulWidget {
  final VoidCallback reloadData;
  final String idDocument;
  String nama;
  String jenis;
  String harga;
  String jumlah;
  String tanggal;

  Detailbarang({
    this.reloadData,
    this.idDocument,
    this.nama,
    this.jenis,
    this.harga,
    this.jumlah,
    this.tanggal
  });

  @override
  _DetailbarangState createState() => _DetailbarangState();
}

class _DetailbarangState extends State<Detailbarang> {
  TextEditingController txtnama = TextEditingController();
  TextEditingController txtjenis = TextEditingController();
  TextEditingController txtharga = TextEditingController();
  TextEditingController txtjumlah = TextEditingController();
  TextEditingController txttanggal = TextEditingController();
  bool loading = false;


  @override
  void initState(){
    super.initState();

    txtnama.text = widget.nama;
    txtjenis.text = widget.jenis;
    txtharga.text = widget.harga;
    txtjumlah.text = widget.jumlah;
    txttanggal.text = widget.tanggal;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Detail Barang"),
      ),
      body:ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          TextField(
            enabled: false,
            controller: txtnama,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              hintText: 'Nama Barang',
              labelText: "Nama Barang",
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5.0),
                borderSide: new BorderSide(),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            enabled: false,
            controller: txtjenis,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              hintText: 'Jenis Barang',
              labelText: "Jenis Barang",
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5.0),
                borderSide: new BorderSide(),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            enabled: false,
            controller: txtharga,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              hintText: 'Harga Barang',
              labelText: "Harga Barang",
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5.0),
                borderSide: new BorderSide(),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            enabled: false,
            controller: txtjumlah,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              hintText: 'Jumlah Barang',
              labelText: "Jumlah Barang",
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5.0),
                borderSide: new BorderSide(),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            enabled: false,
            controller: txttanggal,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              hintText: 'Tanggal Kadaluwarsa',
              labelText: "Tanggal Kadaluarsa",
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5.0),
                borderSide: new BorderSide(),
              ),
            ),
          ),
          // DropdownButton(
          //   isExpanded: true,
          //     hint:Text("Pilih Jenis Barang"),
          //       items:[
          //         DropdownMenuItem(
          //           child:Text("laki laki"),
          //           value:"laki laki",
          //         ),
          //         DropdownMenuItem(
          //           child:Text("perempuan"),
          //           value:"perempuan",
          //         ),
          //       ],
          //       value:jeniskelamin,
          //       onChanged: (nilai){
          //         setState(() {
          //           jeniskelamin=nilai;
          //         });
          //         jeniskelamin=nilai;
          //       },
          //     ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}