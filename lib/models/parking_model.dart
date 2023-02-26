class Parking {
  int? returnCode;
  String? returnMessage;
  List<Occupancy>? occupancy;

  Parking({this.returnCode, this.returnMessage, this.occupancy});

  Parking.fromJson(Map<String, dynamic> json) {
    returnCode = json['ReturnCode'];
    returnMessage = json['ReturnMessage'];
    if (json['Occupancy'] != null) {
      occupancy = <Occupancy>[];
      json['Occupancy'].forEach((v) {
        occupancy!.add(Occupancy.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ReturnCode'] = returnCode;
    data['ReturnMessage'] = returnMessage;
    if (occupancy != null) {
      data['Occupancy'] = occupancy!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Occupancy {
  String? placeName;
  int? totalPlace;
  int? freePlace;

  Occupancy({this.placeName, this.totalPlace, this.freePlace});

  Occupancy.fromJson(Map<String, dynamic> json) {
    placeName = json['PlaceName'];
    totalPlace = json['TotalPlace'];
    freePlace = json['FreePlace'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['PlaceName'] = placeName;
    data['TotalPlace'] = totalPlace;
    data['FreePlace'] = freePlace;
    return data;
  }
}