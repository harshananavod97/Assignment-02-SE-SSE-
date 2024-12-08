import 'package:flutter/material.dart';
import 'package:harshna_project/constants/app_colors.dart';
import 'package:harshna_project/models/menu_Items_Model.dart';
import 'package:harshna_project/screens/Modifier%20Screen/modifer_Screen.dart';


class ItemUpperSection extends StatelessWidget {
  const ItemUpperSection({
    super.key,
    required this.isWideScreen,
    required this.item,
    required this.widget,
  });

  final bool isWideScreen;
  final Item item;
  final ModifierScreen widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close,
                  size: isWideScreen ? 30 : 20,
                )),
          ],
        ),
        Container(
          height: isWideScreen ? 300 : 200,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(20)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: isWideScreen ? 12 : 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.title.en,
                style: TextStyle(
                  color: AppColors.normalTextColor2,
                  fontSize: isWideScreen ? 25 : 15,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2, // Set the maximum number of lines to 2
                overflow: TextOverflow.ellipsis, // Show '...' if text overflows
              ),
              Text(
                '\₹${widget.selectedMenuItem == 'Delivery' ? item.priceInfo.price.deliveryPrice : widget.selectedMenuItem == 'Dinning' ? item.priceInfo.price.tablePrice : item.priceInfo.price.pickupPrice}',
                style: TextStyle(
                    color: AppColors.normalTextColor,
                    fontSize: isWideScreen ? 25 : 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: isWideScreen ? 12 : 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.location_on_outlined,
                color: AppColors.PRIMARY_COLOR,
                size: isWideScreen ? 30 : 25,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: isWideScreen ? 25 : 20,
                    color: AppColors.PRIMARY_COLOR,
                  ),
                  Text(
                    item.aggregatedProductRating.toString(),
                    style: TextStyle(
                        color: AppColors.normalTextColor,
                        fontSize: isWideScreen ? 20 : 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
        Text(
          item.description.en,
          style: TextStyle(
              color: AppColors.normalTextColor,
              fontSize: isWideScreen ? 20 : 14,
              fontWeight: FontWeight.normal),
        )
      ],
    );
  }
}
