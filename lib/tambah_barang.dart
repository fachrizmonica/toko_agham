//import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:toko_agham/koneksi.dart';


class TambahBarang extends StatefulWidget {
  final VoidCallback reloadData;
  TambahBarang(this.reloadData);
  @override
  _TambahBarangState createState() => _TambahBarangState();
}

class _TambahBarangState extends State<TambahBarang> {
  TextEditingController txtNama = TextEditingController();
  TextEditingController txtJenis = TextEditingController();
  TextEditingController txtHarga = TextEditingController();
  TextEditingController txtJumlah = TextEditingController();
  TextEditingController txtTanggal = TextEditingController();
  bool loading = false;

  TambahData()async{
    setState(() {
      loading = true;
    });

    String hasil = await KoneksiBarang.koneksi.InsertBarang(txtNama.text, txtJenis.text, txtHarga.text, txtJumlah.text, txtTanggal.text);
    setState(() {
      loading = false;
    });
    print(hasil);
    widget.reloadData();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Barang'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: txtNama,
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
            controller: txtJenis,
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
            controller: txtHarga,
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
            controller: txtJumlah,
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
            controller: txtTanggal,
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
          SizedBox(
            height: 10,
          ),
          // Container(
          //   padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(5.0),
          //     border: Border.all(
          //         color: Colors.green, style: BorderStyle.solid, width: 2.40),
          //   ),
          //   child: DropdownButton(
              
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
          // ),
          SizedBox(
            height: 25,
          ),
          RaisedButton(
          child: Text('Simpan'),
          textColor: Colors.white,
          color: Colors.green,
          onPressed: (){
            TambahData();
          },
          ),
        ],
      ),
    );
  }
}
