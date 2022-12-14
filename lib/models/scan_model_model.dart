import 'package:google_maps_flutter/google_maps_flutter.dart';

class ScanModelModel {

  int? id;
  String? tipo;
  String valor;

  ScanModelModel({
    this.id,
    this.tipo,
    required this.valor,

  }){
    if(this.valor.contains('http')){
      this.tipo = 'http';
    }else{
      this.tipo = 'geo';
    }
  }


  LatLng getLatLng(){

    final latLng = valor.substring(4).split(',');
    final lat = double.parse(latLng[0]);
    final lng = double.parse(latLng[1]);

    return LatLng(lat, lng);

  }


  factory ScanModelModel.fromJson(Map<String, dynamic> json) => ScanModelModel(
    id: json["id"],
    tipo: json["tipo"],
    valor: json["valor"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tipo": tipo,
    "valor": valor,
  };
}
