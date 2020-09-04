import 'package:flutter/material.dart';

class VideoDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return Card(
          elevation: 1,
          child: Column(
            children: [
              Image.network(
                'https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832__340.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
              )
            ],
          ),
        );
      },
    );
  }
}
