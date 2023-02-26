class MemberData {
  int? returnCode;
  String? returnMessage;
  String? memberCode;
  String? memberID;
  String? memberName;
  String? vipTag;
  String? pregnantTag;
  String? childTag;
  int? emoneyAmount;
  int? points;
  int? thisYearPoints;
  int? thisYearAmount;

  MemberData(
      {this.returnCode,
        this.returnMessage,
        this.memberCode,
        this.memberID,
        this.memberName,
        this.vipTag,
        this.pregnantTag,
        this.childTag,
        this.emoneyAmount,
        this.points,
        this.thisYearPoints,
        this.thisYearAmount});

  MemberData.fromJson(Map<String, dynamic> json) {
    returnCode = json['ReturnCode'];
    returnMessage = json['ReturnMessage'];
    memberCode = json['MemberCode'];
    memberID = json['MemberID'];
    memberName = json['MemberName'];
    vipTag = json['VipTag'];
    pregnantTag = json['PregnantTag'];
    childTag = json['ChildTag'];
    emoneyAmount = json['EmoneyAmount'];
    points = json['Points'];
    thisYearPoints = json['ThisYearPoints'];
    thisYearAmount = json['ThisYearAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ReturnCode'] = returnCode;
    data['ReturnMessage'] = returnMessage;
    data['MemberCode'] = memberCode;
    data['MemberID'] = memberID;
    data['MemberName'] = memberName;
    data['VipTag'] = vipTag;
    data['PregnantTag'] = pregnantTag;
    data['ChildTag'] = childTag;
    data['EmoneyAmount'] = emoneyAmount;
    data['Points'] = points;
    data['ThisYearPoints'] = thisYearPoints;
    data['ThisYearAmount'] = thisYearAmount;
    return data;
  }
}
