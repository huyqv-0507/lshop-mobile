import 'package:json_annotation/json_annotation.dart';

part 'laptop.g.dart';

@JsonSerializable()
class Laptop {
  int laptopId;
  String laptopName;
  dynamic quantity;
  dynamic price;
  String seriesCPU;
  String displayScreen;
  String graphicCard;
  String storage;
  String ram;
  dynamic weight;
  String imageUrl;
  dynamic brandId;

  Laptop(
      this.laptopId,
      this.laptopName,
      this.quantity,
      this.price,
      this.seriesCPU,
      this.displayScreen,
      this.graphicCard,
      this.storage,
      this.ram,
      this.weight,
      this.imageUrl,
      this.brandId);

  factory Laptop.fromJson(Map<String, dynamic> json) => _$LaptopFromJson(json);
  Map<String, dynamic> toJson() => _$LaptopToJson(this);
}
