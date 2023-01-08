import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('I am a cat'),
        backgroundColor: Colors.grey[400],
      ),
      body: ListView.separated(
        itemCount: 3,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.grey[500],
            height: 20,
            thickness: 1,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return Image(
            image: AssetImage('images/i_am_a_cat_${index}.jpeg'),
          );
        },
      ),
    );
  }
}
