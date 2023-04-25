import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final Function(String) onSearch;

  const SearchBar({
    Key? key,
    required this.onSearch,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController controller = TextEditingController();
  final FocusNode node = FocusNode();

  @override
  void initState() {
    super.initState();
    node.addListener(() {
      if (node.hasFocus) {
        print('focus');
      } else {
        print('unfocus');
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 400,
        minWidth: 0,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              focusNode: node,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: '搜尋...',
              ),
            ),
          ),
          InkWell(
            onTap: () {
              widget.onSearch.call(controller.text);
            },
            borderRadius: BorderRadius.circular(50),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(Icons.search),
            ),
          )
        ],
      ),
    );
  }
}
