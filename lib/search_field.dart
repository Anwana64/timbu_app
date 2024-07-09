import 'package:flutter/material.dart';
import 'package:timbu_app/constant.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        fillColor: kLighAsh,
        filled: true,
        hintText: 'Search',
        prefixIcon: Icon(Icons.search),
        suffixIcon: Icon(Icons.settings),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
          borderSide: BorderSide.none
          
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
      ),
    );
  }
}