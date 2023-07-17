import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.height * 0.70,
        height: MediaQuery.of(context).size.height * 0.65,
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
                    child: Text(
                      'Tempat Crud',
                      style: TextStyle(fontSize: 30),
                    )),

                //
                Container(
                  padding: EdgeInsets.all(15),
                  child: Text('data'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
