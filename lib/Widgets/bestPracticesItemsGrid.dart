import 'package:animal_app/Models/bestPracticesItem.dart';
import 'package:animal_app/Providers/bestPracticesItems.dart';
import 'package:animal_app/Providers/newBestPracticesItems.dart';
import 'package:animal_app/Widgets/bestPracticesItemWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BestPracticesItemsGrid extends StatefulWidget {
  final showOnlyStarredItems;
  final Categories category;
  final double height;
  BestPracticesItemsGrid(this.showOnlyStarredItems, this.category, this.height);

  @override
  _BestPracticesItemsGridState createState() => _BestPracticesItemsGridState();
}

class _BestPracticesItemsGridState extends State<BestPracticesItemsGrid> {
  var _isInit = true;
  var _isLoading = true;

  NewBestPracticesItems bestPracticesItemsData;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      bestPracticesItemsData = Provider.of<NewBestPracticesItems>(context);
      bestPracticesItemsData.itemBuilder().then((value) {
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
    var bestPracticesItems = widget.showOnlyStarredItems
        ? bestPracticesItemsData.favouriteItems
        : bestPracticesItemsData.items;

    if (widget.category == Categories.All) {
      print("Chill");
    } else {
      bestPracticesItems = bestPracticesItems
          .where((item) => item.category == widget.category)
          .toList();
    }

    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : bestPracticesItems.length == 0
            ? Container(
                height: widget.height,
                child: Center(
                  child: Text(
                    "No items match your search.",
                    style: TextStyle(fontSize: 18),
                  ),
                ))
            : Container(
                height: widget.height,
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                //padding: EdgeInsets.only(bottom: 10),
                width: double.infinity,
                child: ListView.builder(
                  itemCount: bestPracticesItems.length,
                  itemBuilder: (ctx, index) {
                    return ChangeNotifierProvider.value(
                      value: bestPracticesItems[index],
                      child: Column(
                        children: [
                          BestPracticesItemWidget(),
                          index == bestPracticesItems.length - 1
                              ? SizedBox(
                                  height: 10,
                                )
                              : SizedBox(
                                  height: 15,
                                ),
                        ],
                      ),
                    );
                  },
                ),
              );
  }
}
