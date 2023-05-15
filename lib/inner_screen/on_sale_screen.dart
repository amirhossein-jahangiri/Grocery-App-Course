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
    bool _isEmply = true;
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
      body: _isEmply
          ? Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/box.png',
                    width: size.width * 0.6,
                  ),
                  Text(
                    'No products on sale yet!, \n Stay tuned.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: color,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          )
          : GridView.count(
              crossAxisCount: 2,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              childAspectRatio: size.width / (size.height * 0.45),
              children: List.generate(16, (index) => const OnSaleWidget()),
            ),
    );
  }
}
