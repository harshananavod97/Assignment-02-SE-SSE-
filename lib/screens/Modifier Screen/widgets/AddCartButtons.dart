import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:harshna_project/constants/app_colors.dart';
import 'package:harshna_project/models/menu_Items_Model.dart';

class AddCartCount extends StatelessWidget {
  final String toppingName;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  AddCartCount({
    required this.toppingName,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.PRIMARY_COLOR.withOpacity(0.2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              toppingName,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                // Decrement Button
                Container(
                  child: TextButton(
                    onPressed: onDecrement,
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.resolveWith<Color>(
                        (states) {
                          if (states.contains(MaterialState.pressed)) {
                            return AppColors.PRIMARY_COLOR
                                .withOpacity(0.1); // When pressed
                          }
                          return AppColors.PRIMARY_COLOR
                              .withOpacity(0.1); // Default color
                        },
                      ),
                      minimumSize: WidgetStateProperty.all(const Size(45, 45)),
                      elevation: WidgetStateProperty.all(0), // Remove shadow
                      padding: WidgetStateProperty.all(
                          EdgeInsets.zero), // Remove padding around button
                    ),
                    child: const Icon(Icons.remove,
                        color: AppColors.PRIMARY_COLOR, size: 18),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  quantity.toString().padLeft(2, '0'),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                // Increment Button
                Container(
                  child: TextButton(
                    onPressed: onIncrement,
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.resolveWith<Color>(
                        (states) {
                          if (states.contains(MaterialState.pressed)) {
                            return AppColors.PRIMARY_COLOR.withOpacity(0.1);
                          }
                          return AppColors.PRIMARY_COLOR.withOpacity(0.1);
                        },
                      ),
                      minimumSize: WidgetStateProperty.all(const Size(45, 45)),
                      elevation: WidgetStateProperty.all(0), // Remove shadow
                      padding: WidgetStateProperty.all(
                          EdgeInsets.zero), // Remove padding around button
                    ),
                    child: const Icon(Icons.add,
                        color: AppColors.PRIMARY_COLOR, size: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




class AddToCartButton extends StatelessWidget {
  final int cartcount;
  final Item item;
  final String selectedMenuItem;
  final Function() onTap;

  const AddToCartButton({
    Key? key,
    required this.cartcount,
    required this.item,
    required this.selectedMenuItem,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double price = selectedMenuItem == 'Delivery'
        ? item.priceInfo.price.deliveryPrice * cartcount.toDouble()
        : selectedMenuItem == 'Dinning'
            ? item.priceInfo.price.tablePrice * cartcount.toDouble()
            : item.priceInfo.price.pickupPrice * cartcount.toDouble();

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: AppColors.PRIMARY_COLOR,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          'Add TO Cart \₹$price',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
