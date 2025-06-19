import 'package:flutter/material.dart';

class chatex extends StatelessWidget {
  const chatex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 218, 218, 218),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [Container(decoration: BoxDecoration(color: const Color.fromARGB(255, 172, 172, 172)),
      child:       ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/beckam.jpg"),
              ),
              title: Text("Beckam"),
              subtitle: Text("score 2 goals vro..."),trailing: Text("6:45 pm"),
            ),),ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/eminem.jpg"),
              ),
              title: Text("Emminem"),
              subtitle: Text("No concert tomarro"),trailing: Text("3:27 pm"),
            ),ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/harry.jpg"),
              ),
              title: Text("Harry"),
              subtitle: Text("good night"),trailing: Text("11:12 pm"),
            ),

          ],
        ),
      ),
    );
  }
}
