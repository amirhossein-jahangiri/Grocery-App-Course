import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app_course/services/utils.dart';
import 'package:grocery_app_course/widgets/text_widget.dart';

import '../widgets/feed_items.dart';

class FeedsScreen extends StatefulWidget {
  static const String routeName = '/FeedsScreenState';

  const FeedsScreen({Key? key}) : super(key: key);

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  final TextEditingController? _searchTextController = TextEditingController();
  final FocusNode _searchTextFocusNode = FocusNode();

  @override
  void dispose() {
    _searchTextController!.dispose();
    _searchTextFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    Size size = utils.getScreenSize;
    Color color = utils.color;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => Navigator.pop(context),
          child: Icon(IconlyLight.arrowLeft2, color: color),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: TextWidget(
          title: 'All products',
          textSize: 20,
          color: color,
          isTitle: true,
        ),
        actions: <Widget>[
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {},
            child: Icon(IconlyLight.bag, color: color),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {},
            child: Icon(IconlyLight.heart, color: color),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: kBottomNavigationBarHeight,
                child: TextField(
                  controller: _searchTextController,
                  focusNode: _searchTextFocusNode,
                  onChanged: (String thisValue) {
                    print('value is $thisValue');
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.greenAccent,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.green,
                        width: 1,
                      ),
                    ),
                    hintText: 'What\' is your mind?',
                    prefixIcon: const Icon(Icons.search),
                    suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          _searchTextController!.clear();
                          _searchTextFocusNode.unfocus();
                        });
                      },
                      icon: Icon(
                        Icons.clear,
                        color: _searchTextFocusNode.hasFocus ? Colors.red : color,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              childAspectRatio: size.width / (size.height * 0.60),
              children: List.generate(16, (index) => const FeedsWidget()),
            ),
          ],
        ),
      ),
    );
  }
}
