import '../../domain/entities/location.dart';

class LocationModel extends Location{
  LocationModel({
    required super.lat,
    required super.long,
    required super.street,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      lat: json['latitude']?.toDouble() ?? 0.0,
      long: json['longitude']?.toDouble() ?? 0.0,
      street: json['street']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': lat,
      'longitude': long,
      'street': street
    };
  }

}