import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:whatsappui/calls.dart';
import 'package:whatsappui/chatbot.dart';
import 'package:whatsappui/chats.dart';
import 'package:whatsappui/communities.dart';
import 'package:whatsappui/updates.dart';

class AppBarex extends StatefulWidget {
  const AppBarex({super.key});

  @override
  State<AppBarex> createState() => _AppBarexState();
}

class _AppBarexState extends State<AppBarex> {
  int index=0;
  List<Widget> pages=[chatex(),updatex(),callex(),community()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Whatsapp",
          style: TextStyle(
            color: Color.fromARGB(255, 24, 103, 6),
            fontSize: 20,
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: (){}, icon: Icon(Icons.mail)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz_outlined))
          ),
        ],
        foregroundColor: Colors.green,
        backgroundColor: const Color.fromARGB(255, 223, 223, 220),
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Cbot()));},
        child: SizedBox(
          
          height: 30,
          width: 25,
          child: Lottie.asset("assets/meta.json")),
        backgroundColor: Colors.green
        ,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
        BottomNavigationBarItem(icon: Icon(Icons.call),label:"Calls"),
        BottomNavigationBarItem(icon: Icon(Icons.update), label: "updates"),
        BottomNavigationBarItem(icon: Icon(Icons.groups_2),label: "communities"),
        ],
        currentIndex: index,
        onTap: (tappedindex) {
          setState(() {
            index=tappedindex;
          });
        },
        selectedItemColor: const Color.fromARGB(255, 37, 161, 37),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 190, 193, 190),

      ),
      body: pages[index],
    );
  }
}
