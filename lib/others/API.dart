import 'package:flutter/material.dart';

class api {
  int? id;
  String? baslik;
  String? aciklama;
  double? puan;
  int? sure;
  int? tarih;
  String? kategori;
  String? adres;
  String? resim;

  api(
      {this.id,
      this.baslik,
      this.aciklama,
      this.puan,
      this.sure,
      this.tarih,
      this.kategori,
      this.adres,
      this.resim});

  api.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    baslik = json['Baslik'];
    aciklama = json['Aciklama'];
    puan = json['Puan'];
    sure = json['Sure'];
    tarih = json['Tarih'];
    kategori = json['Kategori'];
    adres = json['Adres'];
    resim = json['Resim'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Baslik'] = this.baslik;
    data['Aciklama'] = this.aciklama;
    data['Puan'] = this.puan;
    data['Sure'] = this.sure;
    data['Tarih'] = this.tarih;
    data['Kategori'] = this.kategori;
    data['Adres'] = this.adres;
    data['Resim'] = this.resim;
    return data;
  }
}
