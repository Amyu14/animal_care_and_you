import 'dart:ui';

import 'package:animal_app/Models/ngoItem.dart';
import 'package:animal_app/Models/vetItem.dart';
import 'package:animal_app/Providers/vetItems.dart';
import 'package:animal_app/Widgets/vetItemWidget.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class VetItemsGrid extends StatefulWidget {
  final bool showOnlyFavouriteItems;
  final animalSettings;
  final sortByProximity;
  final VetItems vetItemsData;
  final double height;
  VetItemsGrid(this.showOnlyFavouriteItems, this.animalSettings,
      this.sortByProximity, this.vetItemsData, this.height);
  @override
  _VetItemsGridState createState() => _VetItemsGridState();
}

class _VetItemsGridState extends State<VetItemsGrid> {
  // var _isInit = true;
  // var _isLoading = true;

  VetItems vetItemsData;

  @override
  void didChangeDependencies() {
    // if (_isInit) {
    //   vetItemsData = Provider.of<VetItems>(context, listen: false);
    //   vetItemsData.itemsBuilder().then((_) {
    //     setState(() {
    //       _isLoading = false;
    //     });
    //   });
    // }
    // _isInit = false;
    vetItemsData = widget.vetItemsData;

    super.didChangeDependencies();
  }

  double calcDistance(double lat1, double long1, Position positionOfDevice) {
    double lat2 = positionOfDevice.latitude;
    double long2 = positionOfDevice.longitude;
    double distance = Geolocator.distanceBetween(lat1, long1, lat2, long2);

    return distance;
  }

  List<double> sortAscending(List<double> nums) {
    int numIterations = nums.length;
    List<double> sortedVals = [];

    for (var i = 0; i < numIterations; i++) {
      double min = nums[0];
      for (var i = 0; i < nums.length; i++) {
        if (nums[i] < min) {
          min = nums[i];
        }
      }
      sortedVals.add(min);
      nums.remove(min);
    }
    return sortedVals;
  }

  Position getCurrentPos() {
    Position pos;
    Geolocator.getCurrentPosition().then((value) {
      pos = value;
      print(pos);
      return pos;
    });
  }

  List<VetItem> sortedVetItems;

  Future<List<VetItem>> sortedItems(List<VetItem> vetItems) async {
    var listOfDistancesAndIndexes = [];

    List<VetItem> listOfVetItems = vetItems;

    List<VetItem> newListOfVetItems = [];

    Position positionOfDevice = await Geolocator.getCurrentPosition();
    // Position positionOfDevice =
    //     Position(latitude: 28.565857401730224, longitude: 77.1581721241613);
    print(positionOfDevice.latitude);
    print(positionOfDevice.longitude);
    for (var i = 0; i < listOfVetItems.length; i++) {
      double distFromCurrentPos = calcDistance(
          listOfVetItems[i].lat, listOfVetItems[i].long, positionOfDevice);
      listOfDistancesAndIndexes.add([distFromCurrentPos, i]);
    }

    List<double> listOfDistances = [];

    for (var i = 0; i < listOfVetItems.length; i++) {
      listOfDistances.add(listOfDistancesAndIndexes[i][0]);
    }

    listOfDistances = sortAscending(listOfDistances);

    List sortedListOfDistances = [];

    listOfDistances.forEach((dist) {
      sortedListOfDistances.add(listOfDistancesAndIndexes
          .firstWhere((distanceAndIndex) => distanceAndIndex[0] == dist));
    });

    print(sortedListOfDistances);

    for (var i = 0; i < listOfVetItems.length; i++) {
      int index = sortedListOfDistances[i][1];
      newListOfVetItems.add(listOfVetItems[index]);
    }

    return newListOfVetItems;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.sortByProximity);
    List<VetItem> vetItems = widget.showOnlyFavouriteItems
        ? vetItemsData.favourite
        : vetItemsData.items;

    if (widget.animalSettings == AnimalSettings.All) {
      print("all");
    } else {
      vetItems = vetItems.where((vetItem) {
        return vetItem.animalSettings.contains(AnimalSettings.All) ||
            vetItem.animalSettings.contains(widget.animalSettings);
      }).toList();
    }

    if (widget.sortByProximity) {
      return FutureBuilder(
          future: sortedItems(vetItems),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              vetItems = snapshot.data;
              return vetItems.length == 0
                  ? Container(
                      height: widget.height,
                      child:
                          Center(child: Text("No items match your settings.")))
                  : Container(
                      margin: EdgeInsets.all(5),
                      height: widget.height,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: vetItems.length,
                        itemBuilder: (ctx, index) {
                          return Column(children: [
                            VetItemWidget(vetItems[index]),
                            index == (vetItems.length - 1)
                                ? SizedBox(
                                    height: 8,
                                  )
                                : SizedBox(
                                    height: 16,
                                  ),
                          ]);
                        },
                      ),
                    );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          });
    } else {
      return vetItems.length == 0
          ? Container(
              height: widget.height,
              child: Center(
                  child: Text(
                "No items match your settings.",
                style: TextStyle(fontSize: 18),
              )))
          : Container(
              height: widget.height,
              width: double.infinity,
              margin: EdgeInsets.all(5),
              child: ListView.builder(
                itemCount: vetItems.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      VetItemWidget(vetItems[index]),
                      index == (vetItems.length - 1)
                          ? SizedBox(
                              height: 8,
                            )
                          : SizedBox(
                              height: 16,
                            )
                    ],
                  );
                },
              ),
            );
    }
  }
}
