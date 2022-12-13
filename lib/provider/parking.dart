import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:firedart/firedart.dart' show Document, Page, Firestore;
import 'package:flutter/material.dart'
    show BuildContext, ChangeNotifier, TargetPlatform;
import 'package:parking/model/park.dart';
import 'package:parking/model/spote.dart';
import 'package:provider/provider.dart';

class ParkingProvider extends ChangeNotifier {
  static ParkingProvider? _instance;
  static ParkingProvider? get instance => _instance;
  static Future init(BuildContext context) async {
    _instance = Provider.of<ParkingProvider>(context, listen: false);
  }

  List<Spote>? spoteList;
  List<Park>? _parks;

  void updateParkDate(Park p) async {
    if (defaultTargetPlatform != TargetPlatform.windows) {
      await FirebaseFirestore.instance
          .collection("park")
          .doc(p.id)
          .update(p.toJson());
    } else {
      await Firestore.instance
          .collection('park')
          .document(p.id!)
          .update(p.toJson());
    }
  }

  Future addParkSpote(Park p, Spote s) async {
    if (defaultTargetPlatform != TargetPlatform.windows) {
      await FirebaseFirestore.instance
          .collection("park")
          .doc(p.id)
          .collection('spote')
          .doc()
          .set(s.toJson());
    } else {
      await Firestore.instance
          .collection('park')
          .document(p.id!)
          .collection('spote')
          .add(s.toJson());
    }
    notifyListeners();
  }

  void test() {
    FirebaseDatabase.instance
        .ref('usersnode/users')
        .orderByChild('userId')
        .equalTo("u1")
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        Map<dynamic, dynamic>? values =
            snapshot.value as Map<dynamic, dynamic>?;
        values?.forEach((key, value) {
          print(key);
        });
      } else {
        print('No data available.1');
      }
    });
  }

  Future streamParks() {
    if (defaultTargetPlatform != TargetPlatform.windows) {
      // DatabaseReference ref =
      // FirebaseDatabase.instance.ref("park").;
      // return ref.on;

      return FirebaseFirestore.instance.collection("park").get();
    } else {
      // return Firestore.instance.collection('park').stream;
      return Firestore.instance.collection('park').get();
    }
  }

  Stream<DatabaseEvent> getSpot() {
    // DatabaseReference ref = FirebaseDatabase.instance.ref("park");
    return FirebaseDatabase.instance.ref('park').onValue;
    // .listen((event) {
    //   print(event.snapshot.value);
    // });

    // get().then((snapshot) {
    //   if (snapshot.exists) {
    //     dynamic values = snapshot.value as List<Object?>;
    //     for (var key in values) {
    //       print(key);
    //     }
    //   }
    // });
    // ref.once().then((DataSnapshot snapshot) {
    //   _parks = _parseData(snapshot);
    // });
    // return ref.onValue.listen((event) {
    //   event.snapshot.children
    // });
  }

  Stream<DatabaseEvent> streamSpots(String id) {
    return FirebaseDatabase.instance.ref('park/$id').onValue;
    // if (defaultTargetPlatform != TargetPlatform.windows) {
    //   return FirebaseFirestore.instance
    //       .collection("park")
    //       .doc(id)
    //       .collection('spots')
    //       .snapshots();
    // } else {
    //   return Firestore.instance
    //       .collection('park')
    //       .document(id)
    //       .collection("spots")
    //       .stream;
    // }
  }

  Future getParkSpots(String id) async {
    Spote spoteModel;
    List<Spote> newSpoteList = [];
    if (defaultTargetPlatform != TargetPlatform.windows) {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("park")
          .doc(id)
          .collection('spote')
          .get();
      for (var element in querySnapshot.docs) {
        spoteModel = Spote.fromDocument(doc1: element);
        newSpoteList.add(spoteModel);
      }
      spoteList = newSpoteList;
      notifyListeners();
    } else {
      Page<Document> querySnapshot = await Firestore.instance
          .collection('park')
          .document(id)
          .collection("spote")
          .get();

      querySnapshot.map((element) {
        spoteModel = Spote.fromDocument(doc2: element);
        newSpoteList.add(spoteModel);
      });
      spoteList = newSpoteList;
      notifyListeners();
    }
  }

  List<Spote> getParkSpot({
    QuerySnapshot? querySnapshot,
    List<Document>? docs,
    dynamic list = const [],
  }) {
    Spote spoteModel;
    List<Spote> newSpoteList = [];

    Map<String, dynamic> mapOfMaps = {};

    mapOfMaps = Map<String, dynamic>.from(list as Map<dynamic, dynamic>);

    print("up");
    print(mapOfMaps["spots"]);
    print("down");
    for (var element in mapOfMaps["spots"]) {
      if (element != null) {
        spoteModel = Spote.fromJson(
            Map<String, dynamic>.from(element as Map<dynamic, dynamic>));
        newSpoteList.add(spoteModel);
      }
    }
    // list?.forEach((value) {
    //   if (value != null) {
    //

    //   }
    // });

    return newSpoteList;

    // if (querySnapshot == null) {
    //   for (var element in docs!) {
    //     spoteModel = Spote.fromDocument(doc2: element);
    //     newSpoteList.add(spoteModel);
    //   }
    // } else {
    // for (var element in querySnapshot.docs) {
    //   spoteModel = Spote.fromDocument(doc1: element);
    //   newSpoteList.add(spoteModel);
    // }
    // }
  }

  List<Spote> get parkSpoteList {
    return spoteList!;
  }

  List<Park> getPark({
    QuerySnapshot? querySnapshot,
    List<Document>? docs,
    dynamic list = const [],
  }) {
    List<Park> newParkList = [];
    Park? p;

    Map<String, dynamic> mapOfMaps = {};
    list?.forEach((value) {
      if (value != null) {
        mapOfMaps = Map<String, dynamic>.from(value as Map<dynamic, dynamic>);
        p = Park.fromJson(mapOfMaps);
        newParkList.add(p!);
      }
    });
    return newParkList;
  }

  Future getParks() async {
    List<Park> newParkList = [];
    Park? p;
    if (defaultTargetPlatform != TargetPlatform.windows) {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection("park").get();

      for (var element in querySnapshot.docs) {
        p = Park.fromDocument(doc1: element);
        newParkList.add(p);
      }
      _parks = newParkList;
      notifyListeners();
    } else {
      Page<Document> querySnapshot =
          await Firestore.instance.collection('park').get();
      querySnapshot.map((element) {
        p = Park.fromDocument(doc2: element);
        newParkList.add(p!);
      });
      _parks = newParkList;
      notifyListeners();
    }
  }

  List<Park>? get currentParkData {
    return _parks;
  }

  Future<void> deleteParkDate(Park p) async {
    if (defaultTargetPlatform != TargetPlatform.windows) {
      return await FirebaseFirestore.instance
          .collection("park")
          .doc(p.id)
          .delete();
    } else {
      return await Firestore.instance
          .collection('park')
          .document(p.id!)
          .delete();
    }
  }

  Future<void> deleteSpoteDate(Park p, String id) async {
    if (defaultTargetPlatform != TargetPlatform.windows) {
      return await FirebaseFirestore.instance
          .collection("park")
          .doc(p.id)
          .collection("spote")
          .doc(id)
          .delete();
    } else {
      return await Firestore.instance
          .collection('park')
          .document(p.id!)
          .collection("spote")
          .document(id)
          .delete();
    }
  }
}
