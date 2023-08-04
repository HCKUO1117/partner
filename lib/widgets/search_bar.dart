import 'package:flutter/material.dart';
import 'package:partner/widgets/search_history_title.dart';

class MySearchBar extends StatefulWidget {
  final Function(String) onSearch;

  const MySearchBar({
    Key? key,
    required this.onSearch,
  }) : super(key: key);

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> with TickerProviderStateMixin {
  final TextEditingController controller = TextEditingController();
  final FocusNode node = FocusNode();

  final List<String> history = [
    '123',
    '321',
  ];

  late final AnimationController _expandController = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _expandController,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
    node.addListener(() {
      if (node.hasFocus) {
        _expandController.forward();
      } else {
        _expandController.reverse();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    node.dispose();
    _expandController.dispose();
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
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Material(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
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
            SizeTransition(
              sizeFactor: _animation,
              axis: Axis.vertical,
              axisAlignment: -1,
              child: Column(
                children: [
                  const Divider(),
                  ListView.builder(
                    padding: const EdgeInsets.only(bottom: 16),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return SearchHistoryTitle(
                        onTap: () {},
                        value: history[index],
                      );
                    },
                    itemCount: history.length,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
