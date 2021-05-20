import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/material.dart';

void main() => runApp(ExpandableShowcase());

class ExpandableShowcase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Expandable Widget Showcase'),
          ),
        ),
        body: ListView(
          children: [
            SizedBox(height: 20),

            /// General use
            ExpandableWidget(
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
            ),
            SizedBox(height: 20),

            /// For long texts
            ExpandableTextWidget(
              elevation: 5,
              padding: EdgeInsets.all(20),
              animationDuration: Duration(milliseconds: 500),
              textWidget: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              showArrowIcon: true,
              initiallyExpanded: true,
            ),
            SizedBox(height: 20),

            /// Extended example
            ExpandableWidget.extended(
              elevation: 10,
              isClickable: false,
              initiallyExpanded: true,
              centralizePrimaryWidget: true,
              centralizeAdditionalWidget: true,
              primaryWidget: Container(
                height: 30,
                child: Center(child: Text('Important Summary')),
              ),
              secondaryWidget: Container(
                height: 70,
                child: Center(
                  child: Column(
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
                size: 20.0,
              ),
              additionalWidget: Text('Show me'),
            ),
            SizedBox(height: 20),

            /// Example with background image
            ExpandableWidget(
              primaryWidget: Text('HELLO'),
              secondaryWidget: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(width: 30, height: 10, color: Colors.black),
                  Container(width: 30, height: 10, color: Colors.black),
                  Container(width: 30, height: 10, color: Colors.black),
                ],
              ),
              isClickable: false,
              showArrowIcon: true,
              backgroundImage: DecorationImage(
                image: AssetImage('assets/background.png'),
                repeat: ImageRepeat.repeatX,
              ),
              backgroundColor: Colors.grey.withOpacity(0.3),
              arrowWidget: Icon(
                Icons.arrow_upward_rounded,
                color: Colors.blueGrey,
                size: 20.0,
              ),
              animationDuration: Duration(seconds: 1),
              centralizePrimaryWidget: true,
            ),

            SizedBox(height: 20),

            /// Example without centralizePrimaryWidget
            ExpandableWidget(
              primaryWidget: Text('HELLO'),
              secondaryWidget: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(width: 30, height: 10, color: Colors.black),
                  Container(width: 30, height: 10, color: Colors.black),
                  Container(width: 30, height: 10, color: Colors.black),
                ],
              ),
              isClickable: false,
              showArrowIcon: true,
              backgroundImage: DecorationImage(
                image: AssetImage('assets/background.png'),
                repeat: ImageRepeat.repeatX,
              ),
              backgroundColor: Colors.grey.withOpacity(0.3),
              arrowWidget: Icon(
                Icons.arrow_upward_rounded,
                color: Colors.blueGrey,
                size: 20.0,
              ),
              animationDuration: Duration(seconds: 1),
              centralizePrimaryWidget: false,
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}