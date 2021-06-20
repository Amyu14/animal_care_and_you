import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../Providers/informationItems.dart';
import '../Widgets/informationItemsGrid.dart';
import '../Widgets/backToHome.dart';

enum FilterOptions { StarredItems, All }

class EssentialInformationScreen extends StatefulWidget {
  static const routeName = "/essential-information-screen";

  @override
  _EssentialInformationScreenState createState() =>
      _EssentialInformationScreenState();
}

class _EssentialInformationScreenState
    extends State<EssentialInformationScreen> {
  var _isInit = true;
  var _showOnlyStarredItems = false;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<InformationItems>(context)
          .fetchAndSetInformationItems()
          .then((_) {
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Essential Information"),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.StarredItems) {
                  _showOnlyStarredItems = true;
                } else {
                  _showOnlyStarredItems = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text("Show All"),
                value: FilterOptions.All,
              ),
              PopupMenuItem(
                child: Text("Show Only Starred Items"),
                value: FilterOptions.StarredItems,
              ),
            ],
          ),
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : InformationItemsGrid(_showOnlyStarredItems),
      floatingActionButton: BackToHomeWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
