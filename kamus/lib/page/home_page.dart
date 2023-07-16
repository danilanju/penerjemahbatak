import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //controller to get input
  final _textController = TextEditingController();

  String thePost = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        backgroundColor: Colors.orange[500],
        elevation: 0,
        title: Text('Kamus Batak'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(70)),
              child: Container(
                color: Colors.orange[500],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'Translate Bahasa',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          'Batak -> indonesia',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                child: Container(
                  padding: EdgeInsets.all(25),
                  child: Center(
                    child: Column(children: [
                      //inputan
                      TextField(
                        controller: _textController,
                        decoration: InputDecoration(
                          hintText: 'type something',
                          border: OutlineInputBorder(),
                        ),
                      ),

                      SizedBox(
                        height: 25,
                      ),

                      //tombol eksekusi
                      MaterialButton(
                        color: Colors.black,
                        child: Text(
                          'Translate',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            thePost = _textController.text;
                          });
                        },
                      ),

                      SizedBox(
                        height: 25,
                      ),

                      //hasil

                      Text(
                        'data',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(thePost),
                    ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
