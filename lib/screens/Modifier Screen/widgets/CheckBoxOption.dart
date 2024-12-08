import 'package:flutter/material.dart';
import 'package:harshna_project/constants/app_colors.dart';

class CheckboxOption extends StatelessWidget {
  final int index;
  final String title;
  final int? selectedCheckboxIndex;
  final ValueChanged<int?> onTap;
  CheckboxOption({
    required this.index,
    required this.title,
    required this.selectedCheckboxIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(selectedCheckboxIndex == index ? null : index);
      },
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: selectedCheckboxIndex == index
                      ? AppColors.PRIMARY_COLOR
                      : Colors.transparent,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(title),
        ],
      ),
    );
  }
}
