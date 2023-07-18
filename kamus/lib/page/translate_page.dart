import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TranslatePage extends StatefulWidget {
  const TranslatePage({super.key});

  @override
  State<TranslatePage> createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {
//controller to get input
  final _textController = TextEditingController();

  String thePost = '';

  //Koneksi koneksi = Koneksi();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.90,
          height: MediaQuery.of(context).size.height * 0.70,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.deepPurple[50],
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // Atur offset bayangan
              ),
            ],
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: double
                        .infinity, // Atur lebar Container sesuai kebutuhan
                    height: 150, // Atur tinggi Container sesuai kebutuhan
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // Atur offset bayangan
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _textController,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Ketikkan Sesuatu ...',
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  //tombol eksekusi
                  MaterialButton(
                    color: Color(0xFFF32424),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      'Translate',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      String inputText = _textController.text;

                      // Make the POST request
                      Uri url = Uri.parse(
                          'http://technologysupport.id/api/get_kamus');
                      http.post(url, body: {'kunci': inputText}).then(
                          (response) {
                        if (response.statusCode == 200) {
                          dynamic jsonData = jsonDecode(response.body);

                          if (jsonData != null && jsonData.isNotEmpty) {
                            Map<String, dynamic> translationData = jsonData[0];
                            setState(() {
                              thePost = translationData['translate'] ?? '';
                            });
                          } else {
                            setState(() {
                              thePost = 'Translation not found.';
                            });
                          }
                        } else {
                          // Handle the error case
                          print(
                              'Request failed with status: ${response.statusCode}.');
                        }
                      });
                    },
                  ),

                  //
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Text(thePost),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
