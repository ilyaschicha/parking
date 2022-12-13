import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firedart/firedart.dart';

class Spote {
  late String? id;
  late String? name;

  late bool? state;
  Spote({
    this.id,
    this.state,
  });
  List<Spote> fromList(List<Map<String, dynamic>> list) {
    List<Spote> l = [];
    for (Map<String, dynamic> e in list) {
      l.add(Spote.fromJson(e));
    }
    return l;
  }

  Spote.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    state = json['state'];
  }

  // factory Spote.fromDocument(DocumentSnapshot doc) {
  //   Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  //   return Spote.fromJson(data);
  // }

  factory Spote.fromDocument({DocumentSnapshot? doc1, Document? doc2}) {
    if (doc1 != null) {
      Map<String, dynamic> data = doc1.data() as Map<String, dynamic>;
      data["id"] = doc1["id"];
      return Spote.fromJson(data);
    } else {
      Map<String, dynamic> data = doc2!.map;
      data["id"] = doc2.map["id"];
      return Spote.fromJson(data);
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['state'] = state;
    return data;
  }
}
