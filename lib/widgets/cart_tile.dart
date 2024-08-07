import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/medicine.dart';
import '../models/shop.dart';
import '../themes/colors.dart';
import '../themes/fonts.dart';
import 'mini_button.dart';

class CartTile extends StatefulWidget {
  final Medicine medicine;
  final int quantityCount;

  const CartTile({
    super.key,
    required this.medicine,
    required this.quantityCount,
  });

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  void removeFromCart(BuildContext context, Medicine medicineItem) {
    final shop = context.read<Shop>();
    shop.removeFromCart(medicineItem);
  }

  Function() incrementQuantity(Medicine medicine, BuildContext context) {
    return () {
      setState(() {
        final shop = context.read<Shop>();
        int? quantityCount = shop.cart[medicine] ?? 0;
        quantityCount++;
        shop.updateQuantity(medicine, quantityCount);
      });
    };
  }

  Function() decrementQuantity(Medicine medicine, BuildContext context) {
    return () {
      setState(() {
        final shop = context.read<Shop>();
        int? quantityCount = shop.cart[medicine] ?? 0;
        if (quantityCount > 0) {
          quantityCount--;
          shop.updateQuantity(medicine, quantityCount);
        }
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: DrawerMotion(),
        children: [
          SlidableAction(
            autoClose: true,
            borderRadius: BorderRadius.circular(16.0),
            onPressed: (context) {
              removeFromCart(context, widget.medicine);
            },
            backgroundColor: Colors.red[900]!,
            foregroundColor: Colors.white,
            icon: Icons.delete_outline_outlined,
            label: 'Delete',
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(right: 8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [shadow],
            color: backgroundPrimary,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10.0),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      height: 75,
                      width: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [shadow],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.asset(widget.medicine.imagePath,
                            fit: BoxFit.fill),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.medicine.name,
                        style: GoogleFonts.poppins(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          widget.medicine.shortDescription,
                          style: GoogleFonts.poppins(fontSize: 10),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Text(
                        '${widget.medicine.price.toString()} THB',
                        style: smallText,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        MiniButton(
                          icon: Icons.remove,
                          onPressed:
                              decrementQuantity(widget.medicine, context),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(widget.quantityCount.toString(),
                              style: smallText),
                        ),
                        MiniButton(
                          icon: Icons.add,
                          onPressed:
                              incrementQuantity(widget.medicine, context),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
