class PolusiUdara {
  AirPollution? airPollution;
  List<String>? recommendation;

  PolusiUdara({this.airPollution, this.recommendation});

  PolusiUdara.fromJson(Map<String, dynamic> json) {
    airPollution = AirPollution.fromJson(json['air_pollution']);
    recommendation = json['recommendation'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    return {
      'air_pollution': airPollution!.toString(),
      'recommendation': recommendation,
    };
  }
}

class AirPollution {
  Coord? coord;
  int? aqi;
  String? quality;
  Components? components;

  AirPollution({this.coord, this.aqi, this.quality, this.components});

  AirPollution.fromJson(Map<String, dynamic> json) {
    coord = Coord.fromJson(json['coord']);
    aqi = int.parse(json['aqi'].toString());
    quality = json['quality'];
    components = Components.fromJson(json['components']);
  }

  Map<String, dynamic> toJson() {
    return {
      'coord': coord!.toJson(),
      'aqi': aqi,
      'quality': quality,
      'components': components!.toJson(),
    };
  }
}

class Coord {
  double? lon;
  double? lat;

  Coord({this.lon, this.lat});

  Coord.fromJson(Map<String, dynamic> json) {
    lon = double.parse(json['lon'].toString());
    lat = double.parse(json['lat'].toString());
  }

  Map<String, dynamic> toJson() {
    return {
      'lon': lon,
      'lat': lat,
    };
  }
}

class Components {
  double? co;
  double? no;
  double? no2;
  double? o3;
  double? so2;
  double? pm25;
  double? pm10;
  double? nh3;

  Components(
      {this.co,
      this.no,
      this.no2,
      this.o3,
      this.so2,
      this.pm25,
      this.pm10,
      this.nh3});

  Components.fromJson(Map<String, dynamic> json) {
    co = double.parse(json['co'].toString());
    no = double.parse(json['no'].toString());
    no2 = double.parse(json['no2'].toString());
    o3 = double.parse(json['o3'].toString());
    so2 = double.parse(json['so2'].toString());
    pm25 = double.parse(json['pm2_5'].toString());
    pm10 = double.parse(json['pm10'].toString());
    nh3 = double.parse(json['nh3'].toString());
  }

  Map<String, dynamic> toJson() {
    return {
      'co': co,
      'no': no,
      'no2': no2,
      'o3': o3,
      'so2': so2,
      'pm2_5': pm25,
      'pm10': pm10,
      'nh3': nh3,
    };
  }
}
