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
    aqi = json['aqi'];
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
    lon = json['lon'];
    lat = json['lat'];
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
    co = json['co'];
    no = json['no'];
    no2 = json['no2'];
    o3 = json['o3'];
    so2 = json['so2'];
    pm25 = json['pm2_5'];
    pm10 = json['pm10'];
    nh3 = json['nh3'];
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
