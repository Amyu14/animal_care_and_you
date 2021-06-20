import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/informationItems.dart';
import './informationItemWidget.dart';

class InformationItemsGrid extends StatelessWidget {
  final showOnlyStarredItems;
  InformationItemsGrid(this.showOnlyStarredItems);

  @override
  Widget build(BuildContext context) {
    final informationItemsData = Provider.of<InformationItems>(context);
    final informationItems = showOnlyStarredItems
        ? informationItemsData.starredItems
        : informationItemsData.items;
    final height = MediaQuery.of(context).size.height * 0.78;

    return informationItems.isEmpty
        ? Container(
            height: height,
            width: double.infinity,
            child: Center(
              child: Text("You Have Not Starred Any Items."),
            ),
          )
        : Container(
            margin: EdgeInsets.all(20),
            height: height,
            width: double.infinity,
            child: ListView.builder(
              itemCount: informationItems.length,
              itemBuilder: (ctx, index) {
                return ChangeNotifierProvider.value(
                  value: informationItems[index],
                  child: Container(
                      child: Column(
                    children: [
                      InformationItemWidget(),
                      SizedBox(
                        height: 14,
                      )
                    ],
                  )),
                );
              },
            ),
          );
  }
}
