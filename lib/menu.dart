import 'package:flutter/material.dart';
import 'package:foodtrack/overlays-drawer-etc/drawer.dart';
import 'package:foodtrack/categories/grains-cereals.dart';
import 'package:foodtrack/categories/fruits-vegetables.dart';
import 'package:foodtrack/categories/meats-dairy.dart';
import 'package:foodtrack/categories/sweets.dart';


class menu extends StatelessWidget {
  const menu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      backgroundColor: const Color(0xFF1598A5),

        appBar: AppBar(
          backgroundColor: const Color(0xFF0E6B73),
          iconTheme: const IconThemeData(color: Colors.white),

          actions: [
            Container(
              margin: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: const Icon(Icons.exit_to_app, color: Colors.white),
                
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Are you sure?'),
                      content: const Text('Do you want to exit the app?'),
                      actions: [
                        TextButton(
                          child: const Text('Yes'),
                          onPressed: () {
                            // Add your exit logic here
                          },
                        ),
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),

        drawer: const MenuDrawer(), //these will be the menu icon on the left side of the appbar
        
        body: SingleChildScrollView( // whole body is scrollable
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: [
                //SPACE BETWEEN APP BAR AND FT PIC
                const SizedBox(height: 60),

                //CHANGE WITH FT PIC
                Container(
                  margin: const EdgeInsets.fromLTRB(60.0, 0, 60.0, 0),
                  child: Image.asset('image/foodTRACK.png', fit : BoxFit.contain)
                ),

                //SPACE
                const SizedBox(height: 60),

                //THE 2X2 GRID OF CATEGORIES
                GridView.count(
                  shrinkWrap: true, //take up only as much space as needed
                  physics: const NeverScrollableScrollPhysics(),//unscrollable
                  crossAxisCount: 2, // Number of columns
                  padding: const EdgeInsets.all(2.0),
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  children: [
                    //GRAIN
                    GestureDetector(
                      child: Image.asset('image/grains.png', fit : BoxFit.contain),
                      onTap: () 
                        {Navigator.push(
                  context,
                    MaterialPageRoute(builder: (context) => (const GrainsCereals()),));
                          },
                    ),

                    //FRUIT
                    GestureDetector(
                      child: Image.asset('image/fruits.png', fit : BoxFit.contain),

                      onTap: () 
                        {Navigator.push(
                  context,
                    MaterialPageRoute(builder: (context) => (const FruitsVegetables()),));
                          },
                    ),

                    //MEAT
                    GestureDetector(
                      child: Image.asset('image/meats.png', fit : BoxFit.contain),

                      onTap: () 
                        {Navigator.push(
                  context,
                    MaterialPageRoute(builder: (context) => (const MeatsDairy()),));
                          },
                    ),

                    //SWEETS
                    GestureDetector(
                      child: Image.asset('image/sweets.png', fit : BoxFit.contain),

                      onTap: () 
                        {Navigator.push(
                  context,
                    MaterialPageRoute(builder: (context) => (const Sweets()),));
                          },
                    ),

                  ],
                ),
              ],
            ),
        ),
      ),
    ),
      ),
    );
  }
}
