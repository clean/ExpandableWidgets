import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets(
    'description',
    (WidgetTester test) async {
      await test.pumpWidget(
        Expandable(
          primaryWidget: Container(
            height: 30,
            child: Center(child: Text('Hello world!')),
          ),
          secondaryWidget: Container(
            height: 45,
            child: Center(
              child: Column(
                children: [
                  Text('Hello'),
                  Text('World!'),
                ],
              ),
            ),
          ),
          backgroundColor: Colors.grey.withOpacity(0.4),
          showArrowIcon: true,
          centralizePrimaryWidget: true,
        ),
      );

      await test.pumpWidget(
        ExpandableText(
          textWidget: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          elevation: 5,
          padding: EdgeInsets.all(10),
          animationDuration: Duration(seconds: 1),
        ),
      );

      await test.pumpWidget(
        Expandable(
          primaryWidget: Container(height: 10),
          secondaryWidget: Container(height: 20),
          showArrowIcon: true,
          backgroundColor: Colors.transparent,
        ),
      );
    },
  );
}
