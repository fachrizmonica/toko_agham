import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:toko_agham/Editbarang.dart';
import 'package:toko_agham/barang_keluar.dart';
import 'package:toko_agham/detailbarang.dart';
import 'package:toko_agham/infoaplikasi.dart';
import 'package:toko_agham/koneksi.dart';
import 'package:toko_agham/stokbarang.dart';
import 'package:toko_agham/tambah_barang.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko AGHAM',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'TOKO AGHAM'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: new Text("AGHAM"),
              accountEmail: new Text("Market"),
              currentAccountPicture: new CircleAvatar(
                radius: 50.0,
                // backgroundColor: const Color(0xFF778899),
                backgroundImage: NetworkImage("https://pngimage.net/wp-content/uploads/2018/06/logo-toko-png-5.png"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text('Stok Barang'),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => Stokbarang()));
              },
            ),
            ListTile(
              leading: Icon(Icons.storage),
              title: Text('Barang Keluar'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => BarangKeluar()));                
              },
            ),
            // // ListTile(
            // //   title: Text('item 2'),
            // //   trailing: Icon(Icons.chevron_right),
            //   onTap: (){

            //   },
            // ),
            ListTile(
              leading: Icon(Icons.perm_device_information),
              title: Text('Info Aplikasi'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Infoaplikasi()));                
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // body: ListView.separated(
      //   separatorBuilder: (context, index) {
      //     return Divider(
      //       color: Colors.grey,
      //     );
      //   },
      //   itemBuilder: (context, index) {
      //     return Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Text(androidVersions[index]),
      //     );
      //   },
      //   itemCount: androidVersions.length,
      // ),
      body: loading ? Center(child: CircularProgressIndicator())
      
      :ListView.builder(
        itemCount:dtbarang.length,
        itemBuilder:(context,index){
          final item = dtbarang[index];
          return ListTile(
            leading:FlutterLogo(),
            title: Text(item.data['nama_barang']),
            subtitle: Row(
              children: <Widget>[
                Text(item.data['harga_barang']),
                //Text(item.data['jenis_barang']),
              ],
            ),
            // onTap: (){
            //   Navigator.push(
            //           context,
            //         MaterialPageRoute(
            //           builder: (context)=>Detailbarang(
            //             reloadData: AmbilData,
            //             idDocument: item.documentID,
            //             nama: item.data['nama_barang'],
            //             jenis: item.data['jenis_barang'],
            //             harga: item.data['harga_barang'],
            //             jumlah: item.data['jumlah_barang'],
            //             tanggal: item.data['tanggal_kadaluwarsa'],
            //           )
            //         )
            //         );
            // },
          );
          
        },
        
      ),
      floatingActionButton: new FloatingActionButton(
        
      elevation: 0.0,
      child: new Icon(Icons.add),
      backgroundColor: Colors.green,
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>TambahBarang(AmbilData)));
      },
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
