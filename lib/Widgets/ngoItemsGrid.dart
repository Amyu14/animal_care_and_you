import 'package:animal_app/Models/ngoItem.dart';
import 'package:animal_app/Providers/ngoItems.dart';
import 'package:animal_app/Screens/filterVetsScreen.dart';

import './ngoItemWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NgoItemsGrid extends StatefulWidget {
  final showOnlyFavItems;
  final AnimalSettings animalSettings;
  final NgoType ngoType;
  final double height;
  NgoItemsGrid(
      this.showOnlyFavItems, this.animalSettings, this.ngoType, this.height);

  @override
  _NgoItemsGridState createState() => _NgoItemsGridState();
}

class _NgoItemsGridState extends State<NgoItemsGrid> {
  var _isInit = true;
  var _isLoading = true;

  NgoItems ngoItemsData;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      ngoItemsData = Provider.of<NgoItems>(context, listen: false);
      ngoItemsData.itemsBuilder().then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var ngoItems = widget.showOnlyFavItems
        ? ngoItemsData.favouriteItems
        : ngoItemsData.items;

    if (widget.animalSettings == AnimalSettings.All) {
      print("all");
    } else {
      ngoItems = ngoItems.where((ngoItem) {
        return ngoItem.animalSettings.contains(AnimalSettings.All) ||
            ngoItem.animalSettings.contains(widget.animalSettings);
      }).toList();
    }

    if (widget.ngoType == NgoType.All) {
      print("all");
    } else {
      ngoItems = ngoItems.where((ngoItem) {
        return ngoItem.ngoType.contains(NgoType.All) ||
            ngoItem.ngoType.contains(widget.ngoType);
      }).toList();
    }
    print(widget.animalSettings);

    print("grid" + widget.showOnlyFavItems.toString());

    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            height: widget.height,
            width: double.infinity,
            margin: EdgeInsets.all(5),
            child: ngoItems.length == 0
                ? Center(
                    child: Text(
                    "You do not have any favourite Items",
                    style: TextStyle(fontSize: 18),
                  ))
                : ListView.builder(
                    itemCount: ngoItems.length,
                    itemBuilder: (ctx, index) {
                      return ChangeNotifierProvider.value(
                        value: ngoItems[index],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            NgoItemWidget(),
                            SizedBox(height: 10),
                          ],
                        ),
                      );
                    }),
          );
  }
}
