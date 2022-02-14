import 'package:gondwana_club/event/Modules/Data.dart';
import 'package:gondwana_club/event/Modules/Event.dart';
import 'package:gondwana_club/event/Screens/ProfileScreen.dart';
import 'package:gondwana_club/event/Widgets/HomeEventContainer.dart';
import 'package:flutter/material.dart';

class HomeScreenEv extends StatefulWidget {
  @override
  _HomeScreenEvState createState() => _HomeScreenEvState();
}

class _HomeScreenEvState extends State<HomeScreenEv> {
  int _selectedCategory = 0;

  List<Widget> buildCategoriesWidgets() {
    List<Widget> categoriesWidgets = [];
    for (Map category in categories) {
      categoriesWidgets.add(GestureDetector(
        child: Container(
          color: _selectedCategory == categories.indexOf(category)
              ? KAppColor
              : Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: [
              Icon(category['icon'], color: Colors.white),
              SizedBox(width: 10),
              Text(category['name'], style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        onTap: () {
          setState(() {
            _selectedCategory = categories.indexOf(category);
          });
        },
      ));
    }
    return categoriesWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Container(
              height: 200,
              padding: EdgeInsets.all(20),
              color: Color(0xff895842),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {Navigator.of(context).pop();},
                              icon: Icon(Icons.arrow_back, color: Colors.white,size: 20,)
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 15, bottom: 0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                          ),
                          Text(
                            'Alexandria, Egypt',
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                            ),
                          )
                        ],
                      )),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileScreen(),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(
                            'assets/pp.jpg',
                          ),
                        ),
                      )
                    ],
                  ),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(10,0,10,0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.5),
                      ),
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                      suffixIcon: Icon(Icons.filter_list, color: Colors.white),
                    ),

                    onChanged: (val) {},
                  ),
                  Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: buildCategoriesWidgets(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'This Weelend',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          'All',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 290,
                    child: ListView.builder(
                      itemCount: weekendEvents.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        Event event = weekendEvents[index];
                        return HomeEventContainer(
                          event: event,
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Upcoming Events',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          'All',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 300,
                    child: ListView.builder(
                      itemCount: upcomingHomeEvents.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        Event event = upcomingHomeEvents[index];
                        return HomeEventContainer(
                          event: event,
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
