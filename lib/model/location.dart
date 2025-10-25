class Location {
  final String? name;
  final String? unitId;
  final String? locationCount;
  final bool? hasFaultCount;

  const Location({
    this.name,
    this.unitId,
    this.locationCount,
    this.hasFaultCount,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      unitId: json['unitId'],
      locationCount: json['locationCount'],
      hasFaultCount: json['hasFaultCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'unitId': unitId,
      'locationCount': locationCount,
      'hasFaultCount': hasFaultCount,
    };
  }
}
