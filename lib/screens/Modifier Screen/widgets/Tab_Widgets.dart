import 'package:flutter/material.dart';
import 'package:harshna_project/constants/app_colors.dart';
import 'package:harshna_project/models/menu_Items_Model.dart';

class NutritionalView extends StatelessWidget {
  const NutritionalView({
    super.key,
    required this.isWideScreen,
    required this.item,
  });

  final bool isWideScreen;
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'Nutritional value per 100g',
            style: TextStyle(
              color: AppColors.normalTextColor2,
              fontSize: isWideScreen ? 20 : 14,
              fontWeight: FontWeight.normal,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NutritionalValueColumn(
                value: item.nutrientData.calories.displayType.toString(),
                unit: 'Kcal',
                isWideScreen: isWideScreen,
              ),
              NutritionalValueColumn(
                value:
                    item.nutrientData.protein.amount.interval.upper.toString(),
                unit: 'Proteins',
                isWideScreen: isWideScreen,
              ),
              NutritionalValueColumn(
                value: item.nutrientData.fat.amount.interval.upper.toString(),
                unit: 'Fats',
                isWideScreen: isWideScreen,
              ),
              NutritionalValueColumn(
                value: item.nutrientData.carbohydrates.amount.interval.upper
                    .toString(),
                unit: 'Carbo H',
                isWideScreen: isWideScreen,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NutritionalValueColumn extends StatelessWidget {
  final String value;
  final String unit;
  final bool isWideScreen;

  const NutritionalValueColumn({
    super.key,
    required this.value,
    required this.unit,
    required this.isWideScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: AppColors.normalTextColor,
            fontSize: isWideScreen ? 25 : 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          unit,
          style: TextStyle(
            color: AppColors.normalTextColor2,
            fontSize: isWideScreen ? 16 : 12,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

class IngredientsTabView extends StatelessWidget {
  final Item item;
  final isWideScreen;
  const IngredientsTabView(
      {super.key, required this.item, required this.isWideScreen});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Text(
            'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alterame form, by injected humour, or randomised words which don\'t look even slightly believable.',
            style: TextStyle(
                color: AppColors.normalTextColor,
                fontSize: isWideScreen ? 20 : 14,
                fontWeight: FontWeight.normal),
          ),
          item.dishInfo.classifications.ingredients!.isEmpty
              ? Text(
                  'No Ingredients Avalable',
                  style: TextStyle(
                      color: AppColors.normalTextColor,
                      fontSize: isWideScreen ? 20 : 14,
                      fontWeight: FontWeight.normal),
                )
              : Text("have"),
          item.dishInfo.classifications.ingredients!.isEmpty
              ? SizedBox(
                  height: 20,
                )
              : Container(),
          Divider()
        ],
      ),
    );
  }
}
