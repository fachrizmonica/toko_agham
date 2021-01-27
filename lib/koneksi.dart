import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class KoneksiBarang{
  static KoneksiBarang koneksi = KoneksiBarang();

  //deklarasi koneksi antar firebase
  CollectionReference db = Firestore.instance.collection("barang");

  Future<List<DocumentSnapshot>> GetDataBarang()async{
    QuerySnapshot result = await db.where('status_barang', isEqualTo: 'barang masuk').getDocuments();
    return result.documents;
  }
  Future<List<DocumentSnapshot>> GetDataBarangKeluar()async{
    QuerySnapshot result = await db.where('status_barang', isEqualTo: 'barang keluar').getDocuments();
    return result.documents;
  }
  Future<String> InsertBarang(String nama, String jenis, String harga, String jumlah, String tanggal_kadaluwarsa)async{
    Map<String,dynamic>data={
      "nama_barang":nama,
      "jenis_barang":jenis,
      "harga_barang":harga,
      "jumlah_barang":jumlah,
      "status_barang":"barang masuk",
      "tanggal_kadaluwarsa":tanggal_kadaluwarsa
    };
    DocumentReference dokumen = await db.add(data);
    return dokumen.documentID;
  }
  Future UpdateBarang(String id, String nama, String jenis, String harga, String jumlah, String tanggal_kadaluwarsa)async{
    Map<String,dynamic>data={
     "nama_barang":nama,
      "jenis_barang":jenis,
      "harga_barang":harga,
      "jumlah_barang":jumlah,
      "tanggal_kadaluwarsa":tanggal_kadaluwarsa 
    };
    await db.document(id).updateData(data);
  }

  Future HapusBarang(String id)async{
    await db.document(id).delete();
  }
  Future GantiStatus(String id, String status_barang)async{
    String status;
    if (status_barang=='barang masuk'){
      status="barang keluar";
    }else if(status_barang=='barang keluar'){
      status="barang masuk";
    }
      Map<String,dynamic> data = {
        "status_barang":status,
      };
      await db.document(id).updateData(data);
  }
}