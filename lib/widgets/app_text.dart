import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 44.0),
      child: Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras non lorem non justo congue feugiat ut a enim. Ut et sem nec lacus aliquet gravida. Mauris viverra lectus nec vulputate placerat. Nullam sit amet blandit massa, volutpat blandit arcu. Vivamus eu tellus tincidunt, vestibulum neque eu, sagittis neque. Phasellus vitae rutrum magna, eu finibus mi. Suspendisse eget laoreet metus. In mattis dui vitae vestibulum molestie. Curabitur bibendum ut purus in faucibus.",
        style: Theme.of(context).textTheme.body2,
      ),
    );
  }
}
