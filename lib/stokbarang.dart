import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:toko_agham/Editbarang.dart';
import 'package:toko_agham/detailbarang.dart';
import 'package:toko_agham/koneksi.dart';
//import 'package:toko_agham/tambah_barang.dart';



class Stokbarang extends StatefulWidget {
  @override
  _StokbarangState createState() => _StokbarangState();
}

class _StokbarangState extends State<Stokbarang> {

  List<DocumentSnapshot> dtbarang = List();
  bool loading = false;

  AmbilData()async{
    loading = true;
    dtbarang = await KoneksiBarang.koneksi.GetDataBarang();

    setState(() {
      loading = false;
    });
  }

  @override
  void initState(){
    super.initState();
    AmbilData();
  }
  
  HapusData(String idDocument){
    setState(() {
      loading = true;
    });
    KoneksiBarang.koneksi.HapusBarang(idDocument).then((_){
      AmbilData();
    });
  }
  GantiStatus(String idDocument, String status_barang){
    setState(() {
      loading = true;
    });
    KoneksiBarang.koneksi.GantiStatus(idDocument,status_barang).then((_){
      AmbilData();
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Stok Barang"),
      ),
      body: loading ? Center(child: CircularProgressIndicator(),)
      :ListView.builder(
        itemCount:dtbarang.length,
        itemBuilder:(context,index){
          final item = dtbarang[index];
          return ListTile(
            leading:FlutterLogo(),
            title: Text(item.data['nama_barang']),
            subtitle: Row(
              children: <Widget>[
                Expanded(
                  child: Text(item.data['jumlah_barang']),
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  iconSize: 18,
                  color: Colors.green,
                  onPressed: (){
                    Navigator.push(
                      context,
                    MaterialPageRoute(
                      builder: (context)=>Editbarang(
                        reloadData: AmbilData,
                        idDocument: item.documentID,
                        nama: item.data['nama_barang'],
                        jenis: item.data['jenis_barang'],
                        harga: item.data['harga_barang'],
                        jumlah: item.data['jumlah_barang'],
                        tanggal: item.data['tanggal_kadaluwarsa'],
                      )
                    )
                    );
                  },
                ),
                IconButton(
                  iconSize: 18,
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                  onPressed: (){
                    HapusData(item.documentID);
                  },
                ),
                IconButton(
                  iconSize: 18,
                  icon: Icon(Icons.refresh),
                  color: Colors.blue,
                  onPressed: (){
                    GantiStatus(item.documentID,item.data['status_barang']);
                  },
                ),
              ],
            ),
            onTap: (){
              Navigator.push(
                      context,
                    MaterialPageRoute(
                      builder: (context)=>Detailbarang(
                        reloadData: AmbilData,
                        idDocument: item.documentID,
                        nama: item.data['nama_barang'],
                        jenis: item.data['jenis_barang'],
                        harga: item.data['harga_barang'],
                        jumlah: item.data['jumlah_barang'],
                        tanggal: item.data['tanggal_kadaluwarsa'],
                      )
                    )
                    );
            },
            // onTap: (){
            //   Navigator.push(context,MaterialPageRoute(builder: (context)=>Detailbarang()));
            // },
          );
          
        },
        
      ),
    //   floatingActionButton: new FloatingActionButton(
        
    //   elevation: 0.0,
    //   child: new Icon(Icons.add),
    //   backgroundColor: Colors.green,
    //   onPressed: (){
    //     Navigator.push(context, MaterialPageRoute(builder: (context)=>TambahBarang(AmbilData)));
    //   },
    // ),
    // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}