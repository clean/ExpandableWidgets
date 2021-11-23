<h1>Expandable Widgets</h1>
A package that provides expandable widgets for Flutter. Written in %100 Dart.

<h1> Examples </h1>
<h2> General use: </h2>

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

<h2> For a long text: </h2>

             ExpandableText(
              elevation: 5,
              padding: EdgeInsets.all(10.0),
              animationDuration: Duration(milliseconds: 500),
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