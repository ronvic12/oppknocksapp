import 'dart:ffi';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:oppknocksapp/screens/search_screen/search_bar_ui.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../shared/constants.dart';
import 'package:oppknocksapp/screens/details_screen/details_screen.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List _allResults = [];
  List _resultsList = [];
  late Future resultsLoaded;

  // When page is loaded, event listener added to listen to when search text is changed
  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  // Get rid of listener when search page isn't up
  @override
  void dispose() {
    // TODO: implement dispose
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  // Gets called whenever search bar text is changed
  void _onSearchChanged() {
    searchResultList();
  }

  // Filters the search bar based on whats inputed
  searchResultList() {
    var showResults = [];
    // Checks if the search bar isn't empty - have a search parameter
    if (_searchController.text != "") {
      showResults =
          _allResults // reutrns list from the array that contains the same chars as the search query
              .where((element) => element["business"]
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase()))
              .toList();
    } else {
      // If the search bar is empty show all the deals
      showResults = List.from(_allResults);
    }
    setState(() {
      _resultsList = showResults;
    });
  }

  // Pulls all the discounts from firebase
  getDiscounts() async {
    var data = await FirebaseFirestore.instance
        .collection("deals")
        .orderBy("createdAt", descending: true)
        .get();
    setState(() {
      _allResults = data.docs;
    });
    searchResultList();
    return data.docs;
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    // Flag that confirms if data is loaded
    resultsLoaded = getDiscounts();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.grey[100],
            title: SearchBar(_searchController)),
        body: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemExtent: 90,
            itemCount: _resultsList.length,
            itemBuilder: (context, index) {
              DocumentSnapshot postModel = _resultsList[index];
              return Container(
                decoration: new BoxDecoration(
                    border: new Border(
                        bottom: new BorderSide(color: Colors.grey.shade400))),
                child: Theme(
                    data: ThemeData(
                      splashColor: appColor1,
                      highlightColor: Colors.grey.withOpacity(.5),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: ListTile(
                        leading: Image.network(postModel['img']),
                        title: Text(
                          postModel['deal'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(postModel['business']),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailScreen(item: postModel),
                            ),
                          );
                        },
                      ),
                    )),
              );
            }));
  }
}
