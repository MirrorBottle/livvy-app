class Subdistrict {
  String id;
  String name;
  String longitude;
  String latitude;

  Subdistrict({
    required this.id,
    required this.name,
    required this.longitude,
    required this.latitude
  });

  factory Subdistrict.fromJson(Map<String, dynamic> _json) {
    return Subdistrict(
      id: _json['id'],
      name: _json['nama'],
      longitude: _json['longitude'],
      latitude: _json['latitude'],
    );
  }
}