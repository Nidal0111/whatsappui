import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Cbot extends StatefulWidget {
  const Cbot({super.key});

  @override
  State<Cbot> createState() => _CbotState();
}

class _CbotState extends State<Cbot> {
  List<Map<String, String>> messg = [];
  bool isloading = false;
  bool cansend = false;
  String apikey = "AIzaSyChNGLpyToGWyr_JDhIMt2JumhWQJ4hbyg";
  TextEditingController msgcontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    msgcontroller.addListener(() {
      setState(() {
        cansend = msgcontroller.text.trim().isNotEmpty;
      });
    });
  }

  Future<void> sendMessage(String userMessage) async {
    setState(() {
      messg.add({'role': 'user', 'text': userMessage});
      isloading = true;
      cansend = false;
    });

    final uri = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$apikey',
    );

    final headers = {'Content-Type': 'application/json'};

    final body = jsonEncode({
      'contents': [
        {
          'parts': [
            {'text': userMessage},
          ],
        },
      ],
    });

    try {
      final response = await http.post(uri, headers: headers, body: body);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final botReply = data['candidates'][0]['content']['parts'][0]['text'];

        setState(() {
          messg.add({'role': 'bot', 'text': botReply});
        });
      } else {
        setState(() {
          messg.add({
            'role': 'bot',
            'text': 'Something went wrong. Please try again later.',
          });
        });
      }
    } catch (e) {
      setState(() {
        messg.add({'role': 'bot', 'text': 'Error: $e'});
      });
    } finally {
      setState(() {
        isloading = false;
        msgcontroller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(232, 213, 213, 213),
      appBar: AppBar(title: const Text("Chatbot")),
      body: Column(
        children: [
        
          Builder(
            builder: (context) {
              return Expanded(child: ListView.builder(padding: EdgeInsets.only(top: 20,bottom: 25) ,reverse: true, 
              itemCount: messg.length,
                itemBuilder: (context, index) =>
                    Bmsg(messg.reversed.toList()[index]),
              )
              );
            }
          ),
          if (isloading)
            CircularProgressIndicator(
              color: const Color.fromARGB(95, 12, 12, 13),
            ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: msgcontroller,
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 208, 208, 206),
                    filled: true,
                    suffixIcon: Icon(Icons.camera_alt_outlined),
                    hintText: "Ask anything",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  sendMessage(msgcontroller.text.trim());
                },
                icon: Icon(Icons.send),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget Bmsg(Map<String, String> msg) {
    bool issuser = msg["role"] == "user";
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Align(
        alignment: issuser ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(padding: EdgeInsets.symmetric(horizontal: 14,vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: issuser
                ? const Color.fromARGB(31, 22, 2, 2)
                : const Color.fromARGB(248, 168, 161, 167),
          ),
          child: Text(
            msg["text"] ?? "",
            style: TextStyle(
              color: issuser
                  ? const Color.fromARGB(255, 9, 3, 3)
                  : const Color.fromARGB(255, 36, 31, 52),
            ),
          ),
        ),
      ),
    );
  }
}
