import 'package:flutter/material.dart';

class SearchBar extends Container {
  TextEditingController _searchController;
  SearchBar(this._searchController);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 235, 235, 235),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Theme(
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            prefixIcon:
                Icon(Icons.search, color: Color.fromARGB(255, 125, 125, 125)),
            suffixIcon: _searchController.text != ""
                ? IconButton(
                    icon: Icon(Icons.clear),
                    color: Color.fromARGB(255, 125, 125, 125),
                    onPressed: () {
                      _searchController.clear();
                    },
                  )
                : null,
            hintText: "Search",
            hintStyle: TextStyle(fontSize: 18),
            alignLabelWithHint: true,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          style: TextStyle(fontSize: 18),
        ),
        data: Theme.of(context).copyWith(
            textSelectionTheme: TextSelectionThemeData(
                cursorColor: Color.fromARGB(255, 125, 125, 125))),
      ),
      margin: EdgeInsets.only(bottom: 10),
    );
  }
}
