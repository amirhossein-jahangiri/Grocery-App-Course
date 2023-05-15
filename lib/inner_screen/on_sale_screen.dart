import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app_course/widgets/on_sale_widget.dart';
import 'package:grocery_app_course/widgets/text_widget.dart';

import '/services/utils.dart';
import '/widgets/feed_items.dart';

class OnSaleScreen extends StatelessWidget {
  static const String routeName = '/OnSaleScreen';

  const OnSaleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    Size size = utils.getScreenSize;
    Color color = utils.color;
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: const Icon(IconlyLight.arrowLeft2),
        //   color: color,
        // ),
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => Navigator.pop(context),
          child: Icon(IconlyLight.arrowLeft2, color: color),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          title: 'Products on sale',
          textSize: 22.0,
          color: color,
          isTitle: true,
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        childAspectRatio: size.width / (size.height * 0.60),
        children: List.generate(16, (index) => const OnSaleWidget()),
      ),
    );
  }
}
