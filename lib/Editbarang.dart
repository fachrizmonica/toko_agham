//import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toko_agham/koneksi.dart';


class Editbarang extends StatefulWidget {
  final VoidCallback reloadData;
  final String idDocument;
  String nama;
  String jenis;
  String harga;
  String jumlah;
  String tanggal;

  Editbarang({
    this.reloadData,
    this.idDocument,
    this.nama,
    this.jenis,
    this.harga,
    this.jumlah,
    this.tanggal
  });

  @override
  _EditbarangState createState() => _EditbarangState();
}

class _EditbarangState extends State<Editbarang> {
  TextEditingController txtnama = TextEditingController();
  TextEditingController txtjenis = TextEditingController();
  TextEditingController txtharga = TextEditingController();
  TextEditingController txtjumlah = TextEditingController();
  TextEditingController txttanggal = TextEditingController();
  bool loading = false;

  Editbarang(){
    setState(() {
      loading = true;
    });

    KoneksiBarang.koneksi.UpdateBarang(
      widget.idDocument, txtnama.text, txtjenis.text, txtharga.text, txtjumlah.text, txttanggal.text,).then((_){
        setState(() {
          loading = false;
        });
        widget.reloadData();
        Navigator.pop(context);
      });
  }

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
        title:Text("Edit Barang"),
      ),
      body:ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          TextField(
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
          FloatingActionButton.extended(
            onPressed: () {
              Editbarang();
            },
            icon: Icon(Icons.save),
            label: Text("Save"),
          ),
        ],
      ),
    );
  }
}