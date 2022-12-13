import 'package:flutter/material.dart';
import 'package:parking/model/park.dart';
import 'package:parking/model/spote.dart';
import 'package:parking/provider/parking.dart';
import 'package:provider/provider.dart';

class ParkPage extends StatelessWidget {
  final Park park;
  const ParkPage({super.key, required this.park});

  @override
  Widget build(BuildContext context) {
    ParkingProvider p = Provider.of<ParkingProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Parking : ${park.parkName}"),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: p.streamSpots(park.id!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Spote> sp = [];

            // if (snapshot.data is List<Document>) {
            //   sp = p.getParkSpot(docs: snapshot.data!);
            // } else {
            // print();
            if (snapshot.data!.snapshot.value != null) {
              sp = p.getParkSpot(list: snapshot.data!.snapshot.value);
            } else {
              sp = [];
            }
            sp = sp.where((element) => element.state == false).toList();
            // }
            // print(sp[0].state);
            return sp.isNotEmpty
                ? Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.0,
                      children: sp
                          .map(
                            (e) => Container(
                              decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    e.state!
                                        ? Icons.directions_car
                                        : Icons.directions_car_filled_outlined,
                                    size: 35,
                                  ),
                                  const SizedBox(height: 25),
                                  Container(
                                    height: 30,
                                    width: 115,
                                    decoration: BoxDecoration(
                                        color: e.state!
                                            ? Colors.red[400]
                                            : Colors.green[400],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        e.name!,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  )
                : const Center(child: Text("All Spotes Occupied"));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
