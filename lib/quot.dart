import 'package:flutter/src/material/card.dart';

class quot {
  late String sId;
  late String sr;
  late String en;
  late String author;
  late Null source;
  late String numberOfVotes;
  late double rating;
  late String addedBy;
  late String id;

  quot({required this.sId,
    required this.sr,
    required this.en,
    required this.author,
    required this.source,
    required this.numberOfVotes,
    required this.rating,
    required this.addedBy,
    required this.id});


  quot.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    sr = json['sr'];
    en = json['en'];
    author = json['author'];
    source = json['source'];
    numberOfVotes = json['numberOfVotes'];
    rating = json['rating'];
    addedBy = json['addedBy'];
    id = json['id'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['sr'] = this.sr;
    data['en'] = this.en;
    data['author'] = this.author;
    data['source'] = this.source;
    data['numberOfVotes'] = this.numberOfVotes;
    data['rating'] = this.rating;
    data['addedBy'] = this.addedBy;
    data['id'] = this.id;
    return data;
  }


}