import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:harshna_project/constants/app_colors.dart';

class Topping {
  String name;
  int quantity;

  Topping({required this.name, required this.quantity});
}

class ToppingItem extends StatelessWidget {
  final String toppingName;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  ToppingItem({
    required this.toppingName,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.normalTextColor2),
                ),
                child: TextButton(
                  onPressed: onDecrement,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith<Color>(
                      (states) {
                        if (states.contains(WidgetState.pressed)) {
                          return AppColors.PRIMARY_COLOR; 
                        }
                        return Colors.white; 
                      },
                    ),
                    minimumSize: WidgetStateProperty.all(const Size(36, 36)),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.normalTextColor2),
                ),
                child: TextButton(
                  onPressed: onIncrement,
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith<Color>(
                      (states) {
                        if (states.contains(WidgetState.pressed)) {
                          return AppColors.PRIMARY_COLOR;
                        }
                        return Colors.white;
                      },
                    ),
                    minimumSize: WidgetStateProperty.all(const Size(36, 36)),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child:
                      const Icon(Icons.add, color: AppColors.PRIMARY_COLOR, size: 18),
                ),
              ),

            

            ],
          ),
        ],
      ),
    );
  }
}
