import 'dart:async';

import 'package:animal_app/Models/petStoreAndChemistItem.dart';
import 'package:animal_app/Widgets/petStoreItemWidget.dart';

import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/petStoreItems.dart';

class PetStoreItemsGrid extends StatefulWidget {
  final bool showOnlyStarredItems;
  final bool sortByProximity;
  final PetStoreItems petStoreItemsData;

  PetStoreItemsGrid(
      this.showOnlyStarredItems, this.sortByProximity, this.petStoreItemsData);

  @override
  _PetStoreItemsGridState createState() => _PetStoreItemsGridState();
}

class _PetStoreItemsGridState extends State<PetStoreItemsGrid> {
  // var _isInit = true;
  // var _isLoading = true;

  PetStoreItems petStoreItemsData;

  @override
  void didChangeDependencies() {
    // if (_isInit) {
    //   petStoreItemsData = Provider.of<PetStoreItems>(context, listen: false);
    //   petStoreItemsData.itemsBuilder().then((value) {
    //     setState(() {
    //       _isLoading = false;
    //     });
    //   });
    // }
    // _isInit = false;

    petStoreItemsData = widget.petStoreItemsData;
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

  List<AmbulanceItem> sortedPetStoreItems;

  Future<List<AmbulanceItem>> sortedItems(
      List<AmbulanceItem> petStoreItems) async {
    var listOfDistancesAndIndexes = [];

    List<AmbulanceItem> listOfPetStoreItems = petStoreItems;

    List<AmbulanceItem> newListOfPetStoreItems = [];

    Position positionOfDevice = await Geolocator.getCurrentPosition();
    for (var i = 0; i < listOfPetStoreItems.length; i++) {
      double distFromCurrentPos = calcDistance(listOfPetStoreItems[i].lat,
          listOfPetStoreItems[i].long, positionOfDevice);
      listOfDistancesAndIndexes.add([distFromCurrentPos, i]);
    }

    List<double> listOfDistances = [];

    for (var i = 0; i < listOfPetStoreItems.length; i++) {
      listOfDistances.add(listOfDistancesAndIndexes[i][0]);
    }

    listOfDistances = sortAscending(listOfDistances);

    List sortedListOfDistances = [];

    listOfDistances.forEach((dist) {
      sortedListOfDistances.add(listOfDistancesAndIndexes
          .firstWhere((distanceAndIndex) => distanceAndIndex[0] == dist));
    });

    for (var i = 0; i < listOfPetStoreItems.length; i++) {
      int index = sortedListOfDistances[i][1];
      newListOfPetStoreItems.add(listOfPetStoreItems[index]);
    }

    return newListOfPetStoreItems;
  }

  @override
  Widget build(BuildContext context) {
    var petStoreItems = widget.showOnlyStarredItems
        ? petStoreItemsData.starredItems
        : petStoreItemsData.items;

    var _height = MediaQuery.of(context).size.height * 0.74;

    if (widget.sortByProximity) {
      return FutureBuilder(
          future: sortedItems(petStoreItems),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              petStoreItems = snapshot.data;
              return petStoreItems.length == 0
                  ? Container(
                      height: _height,
                      child: Center(
                          child: Text("You Have Not Starred Any Items.")))
                  : Container(
                      margin: EdgeInsets.all(5),
                      height: _height,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: petStoreItems.length,
                        itemBuilder: (ctx, index) {
                          return ChangeNotifierProvider.value(
                            value: petStoreItems[index],
                            child: Column(
                              children: [
                                PetStoreItemWidget(),
                                petStoreItems.length == 1
                                    ? Container()
                                    : Divider(
                                        thickness: 2,
                                        indent: 10,
                                        endIndent: 10,
                                      ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
              ;
            } else {
              return Center(child: CircularProgressIndicator());
            }
          });
    } else {
      return petStoreItems.length == 0
          ? Container(
              height: _height,
              child: Center(child: Text("You Have Not Starred Any Items.")))
          : Container(
              margin: EdgeInsets.all(5),
              height: _height,
              width: double.infinity,
              child: ListView.builder(
                itemCount: petStoreItems.length,
                itemBuilder: (ctx, index) {
                  return ChangeNotifierProvider.value(
                    value: petStoreItems[index],
                    child: Column(
                      children: [
                        PetStoreItemWidget(),
                        petStoreItems.length == 1
                            ? Container()
                            : Divider(
                                thickness: 2,
                                indent: 10,
                                endIndent: 10,
                              ),
                      ],
                    ),
                  );
                },
              ),
            );
    }
  }
}
