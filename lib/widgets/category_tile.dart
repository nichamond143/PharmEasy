import 'package:flutter/material.dart';
import 'package:pharmeasy/themes/fonts.dart';

import '../models/med_category.dart';
import '../themes/colors.dart';

class CategoryTile extends StatelessWidget {
  final MedCategory category;
  const CategoryTile({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [shadow],
              color: category.color),
          margin: EdgeInsets.only(right: 10),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                  child: SizedBox(
                    width: 150,
                    height: 75,
                    child: Text(
                      category.name,
                      style: mediumText,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ),
                Image.asset(
                  category.imagePath,
                  width: 75,
                ),
              ],
            ),
          )),
    );
  }
}
