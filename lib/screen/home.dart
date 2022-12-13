import 'package:flutter/material.dart';
import 'package:parking/model/park.dart';
import 'package:parking/provider/parking.dart';
import 'package:parking/screen/park.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    ParkingProvider p = Provider.of<ParkingProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Park Me"),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: p.getSpot(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Park> pa = [];
            // print(snapshot.data);
            // pa = p.getPark(docs: snapshot.data!);

            // if (snapshot.data!.snapshot.value is List<Document>) {
            //   pa = p.getPark(docs: snapshot.data!);
            // } else {
            pa = p.getPark(list: snapshot.data!.snapshot.value);
            // }
            p.getSpot();
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: ListView(
                children: pa
                    .map(
                      (e) => Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.blue[400],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ParkPage(park: e),
                            ),
                          ),
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  e.parkName ?? "",
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "Spotes : ${e.spotesNumber}".toUpperCase(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            leading: const Icon(Icons.local_parking_rounded,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
