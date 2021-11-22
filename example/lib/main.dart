import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/material.dart';

void main() => runApp(ExpandableShowcase());

class ExpandableShowcase extends StatelessWidget {
  final String data =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:
            AppBar(title: Center(child: Text('Expandable Widget Showcase'))),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            SizedBox(height: 20),

            /// General use
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
              isClickable: true,
              padding: EdgeInsets.all(5.0),
            ),
            SizedBox(height: 20),

            /// For long texts
            ExpandableText(
              elevation: 5,
              padding: EdgeInsets.all(10.0),
              textWidget: Text(
                data,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              showArrowIcon: true,
              initiallyExpanded: false,
              hoverOn: false,
              arrowLocation: ArrowLocation.right,
              finalArrowLocation: ArrowLocation.bottom,
            ),
            SizedBox(height: 20),

            /// Extended example
            Expandable(
              elevation: 10,
              isClickable: true,
              padding: EdgeInsets.zero,
              centralizePrimaryWidget: true,
              primaryWidget: Container(
                padding: const EdgeInsets.only(top: 10),
                child: Center(child: Text('Important Summary')),
              ),
              secondaryWidget: Container(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('More'),
                      Text('Details'),
                      Text('About'),
                      Text('Something'),
                    ],
                  ),
                ),
              ),
              arrowWidget: Icon(
                Icons.keyboard_arrow_up_rounded,
                color: Colors.blueGrey,
                size: 50.0,
              ),
              showArrowIcon: true,
              arrowLocation: ArrowLocation.bottom,
            ),
          ],
        ),
      ),
    );
  }
}
