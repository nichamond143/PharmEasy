import 'package:flutter/material.dart';
import 'package:pharmeasy/themes/colors.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(245, 253, 253, 1.0),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [shadow],
      ),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Search',
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
          filled: true,
          fillColor: Colors.grey[100],
          suffixIcon: IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16), // Set border radius here
            borderSide: BorderSide.none, // Hide the border
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.white)),
        ),
      ),
    ));
  }
}
