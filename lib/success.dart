import 'package:flutter/material.dart';

class Success extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Confirmation Page"),
        centerTitle: true,
      ),
         body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Icon(
                Icons.thumb_up,
                size: 200,
                color: Colors.yellow,
              ),
              SizedBox(height: 20),
              Text(
                'Successfully added to database!!',
                 style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
              ),
            ],
          ),
        ),
    );
  }
}
