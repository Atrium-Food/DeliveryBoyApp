class RankingModel {
  List<RankingCandidate> rankingCandidates;

  RankingModel({this.rankingCandidates});

  RankingModel.fromJson(Map<String, dynamic> json) {
    if (json['rankingCandidates'] != null) {
      rankingCandidates = [];
      json['rankingCandidates'].forEach((v) {
        rankingCandidates.add(new RankingCandidate.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.rankingCandidates != null) {
      data['rankingCandidates'] =
          this.rankingCandidates.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class RankingCandidate {
  String fName;
  String lName;
  String image;
  int runs;

  RankingCandidate({this.fName, this.lName, this.image, this.runs});

  RankingCandidate.fromJson(Map<String, dynamic> json) {
    fName = json['fName'];
    lName = json['lName'];
    image = json['image'];
    runs = json['runs'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();

    data['fName'] = this.fName;
    data['lName'] = this.lName;
    data['image'] = this.image;
    data['runs'] = this.runs;

    return data;
  }
}
