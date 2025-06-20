class Location{
  final double lat;
  final double long;
  final String street;

  const Location({
    required this.lat,
    required this.long,
    required this.street,
  });

  Location copyWith({
    double? lat,
    double? long,
    String? street,
  }) {
    return Location(
      lat: lat ?? this.lat,
      long: long ?? this.long,
      street: street ?? this.street,
    );
  }
}