import 'package:flutter/material.dart';
import 'package:foodtrack/overlays-drawer-etc/addfruit.dart';
import 'package:foodtrack/menu.dart';
import 'package:foodtrack/overlays-drawer-etc/details-fruits.dart';

class FruitsVegetables extends StatelessWidget {
  const FruitsVegetables({super.key});

  @override
  Widget build(BuildContext context) {
    final AddFruit addFruit = AddFruit(); 
    var scaffold = Scaffold(
      backgroundColor: const Color(0xFF1598A5),
      
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E6B73),
        
        //SEARCH FIELD
        title: Container(
          height: 30.0,
          width: MediaQuery.of(context).size.width * 0.64,
          child: TextField(
            decoration: const InputDecoration(
              //border
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide.none,
              ),

              hintText: 'Search...',
              filled: true,
              fillColor: Color(0xFF4DB6B0),
              hintStyle: TextStyle(
                color: Color.fromARGB(255, 131, 129, 129), 
                  fontSize: 18.0
                ),

              prefixIcon: Icon(Icons.search, color: Colors.white), //search icon

              contentPadding: EdgeInsets.symmetric(vertical: 8.0), //making hint text align with search icon
            ),
            style: const TextStyle(color: Colors.white),
            onChanged: (value) {
              // Handle search logic here
            },
          ),
        ),
        
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 6.0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white), // Updated here
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const menu(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 18),
            const Center(
              child: Text(
                "Fruits, Vegetables",
                style: TextStyle(
                  color: Colors.white, // Updated text color to white
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(height: 20), 
            ListView.separated(
              shrinkWrap: true, 
              physics: const NeverScrollableScrollPhysics(), 
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: const Text('Flutter Mapp'),
                  tileColor: Colors.white,
                  onTap: () {},
                  leading: const Icon(Icons.person),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
              
              //x button
              const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.highlight_remove_sharp,
                  color: Colors.red,
                ),
              ),
              const SizedBox(width: 10),

              //arow
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsFruits(), 
                    ),
                  );
                },
                child: const Icon(
                  Icons.arrow_forward_outlined,
                  color: Color(0xFF0E6B73), 
                ),
              ),
      ]

                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
              padding: const EdgeInsets.all(8),
            ),
          ],
        ),
      ),
      
      //ADD BUTTON 
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addFruit.show(context); 
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: scaffold,
    );
  }
}
