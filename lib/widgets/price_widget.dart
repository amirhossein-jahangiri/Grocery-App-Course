import 'package:flutter/material.dart';
import 'package:grocery_app_course/services/utils.dart';
import 'package:grocery_app_course/widgets/text_widget.dart';

class PriceWidget extends StatelessWidget {
  final double salePrice, price;
  final String textPrice;
  final bool isOnSale;

  const PriceWidget({
    required this.salePrice,
    required this.price,
    required this.textPrice,
    required this.isOnSale,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    double? userPrice = isOnSale ? salePrice : price;
    return FittedBox(
      child: Row(
        children: <Widget>[
          TextWidget(
            title: '\$${userPrice * int.parse(textPrice)}',
            textSize: 22,
            color: Colors.green,
          ),
          const SizedBox(width: 5),
          Visibility(
            visible: isOnSale ? true : false,
            child: Text(
              '\$${price * int.parse(textPrice)}',
              style: TextStyle(
                fontSize: 15,
                color: color,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
