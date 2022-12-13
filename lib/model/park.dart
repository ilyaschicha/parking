import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firedart/firedart.dart';
import 'package:parking/model/spote.dart';

class Park {
  late String? id;
  late String? parkName;
  late String? location;
  late List<Spote>? spots;
  late String spotesNumber;

  Park({
    this.id,
    this.parkName,
    this.location,
    this.spots,
  });

  Park.fromJson(Map<String, dynamic>? json) {
    List<Spote> s = _listOfSpotes(json?['spots'] as List<Object?>?);
    id = json?['id'];
    parkName = json?['name'];
    spotesNumber = s.length.toString();
    spots = s;
  }

  List<Spote> _listOfSpotes(List<Object?>? list) {
    List<Spote> l = [];
    for (var element in list ?? []) {
      if (element != null) {
        l.add(Spote.fromJson(
            Map<String, dynamic>.from(element as Map<dynamic, dynamic>)));
      }
    }
    return l;
  }

  // factory Park.fromDocument(DocumentSnapshot doc) {
  //   Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  //   return Park.fromJson(data);
  // }
  factory Park.fromDocument({DocumentSnapshot? doc1, Document? doc2}) {
    if (doc1 != null) {
      Map<String, dynamic> data = doc1.data() as Map<String, dynamic>;
      data["id"] = doc1.id;
      return Park.fromJson(data);
    } else {
      Map<String, dynamic> data = doc2!.map;
      data["id"] = doc2.id;
      return Park.fromJson(data);
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['parkName'] = parkName;
    data['location'] = location;
    // TODO : to be change to a list of json
    data['spots'] = spots;
    return data;
  }
}
