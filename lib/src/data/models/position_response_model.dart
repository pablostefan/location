class PositionResponseModel {
  final String query;
  final String status;
  final String country;
  final String countryCode;
  final String region;
  final String regionName;
  final String city;
  final String zip;
  final double latitude;
  final double longitude;
  final String timezone;
  final String isp;
  final String org;
  final String as;

  PositionResponseModel({
    required this.query,
    required this.status,
    required this.country,
    required this.countryCode,
    required this.region,
    required this.regionName,
    required this.city,
    required this.zip,
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.isp,
    required this.org,
    required this.as,
  });

  factory PositionResponseModel.fromJson(Map<String, dynamic> json) {
    return PositionResponseModel(
        query: json['query'],
        status: json['status'],
        country: json['country'],
        countryCode: json['countryCode'],
        region: json['region'],
        regionName: json['regionName'],
        city: json['city'],
        zip: json['zip'],
        latitude: json['lat'],
        longitude: json['lon'],
        timezone: json['timezone'],
        isp: json['isp'],
        org: json['org'],
        as: json['as']);
  }
}
