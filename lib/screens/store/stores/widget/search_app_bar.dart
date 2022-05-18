import 'package:flutter/material.dart';
import 'package:flutter_cook/model/goods.dart';
import 'package:flutter_cook/route/navigator.dart';
import 'package:flutter_cook/screens/store/stores/pages/store.dart';

import '../../cart/pages/card_screen.dart';

/// 商店页的搜索框
class SearchAppBar extends StatefulWidget {
  SearchAppBar({
    Key? key,
    required this.hintLabel,
    required this.onChanged,
  }) : super(key: key);

  final String hintLabel;
  final ValueChanged<String> onChanged;

  @override
  State<StatefulWidget> createState() {
    return SearchAppBarState();
  }
}

class SearchAppBarState extends State<SearchAppBar> {
  late FocusNode _focusNode;

  ///默认不展示控件
  bool _offstage = true;

  ///监听TextField内容变化
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _textEditingController.addListener(() {
      var isVisible = _textEditingController.text.isNotEmpty;
      _updateDelIconVisible(isVisible);
    });
  }

  _updateDelIconVisible(bool isVisible) {
    setState(() {
      _offstage = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.3),
                  borderRadius: BorderRadius.circular(4)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: _textEditingController,
                      autofocus: false,
                      focusNode: _focusNode,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                      decoration: InputDecoration(
                          hintText: widget.hintLabel, border: InputBorder.none),
                      maxLines: 1,
                      onSubmitted: (text) {
                        widget.onChanged(text);
                        _textEditingController.clear();
                      },
                    ),
                  ),
                  Offstage(
                    offstage: _offstage,
                    child: GestureDetector(
                      onTap: () => {_textEditingController.clear()},
                      child: Icon(
                        Icons.cancel,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              NavigatorManager.goCartScreen(context);
            },
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.unfocus();
  }
}
