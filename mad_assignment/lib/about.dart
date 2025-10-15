import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  final List<Map<String, String>> landmarks = [
    {
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/e/e6/Eiffel_Tower%2C_Paris_2.jpg',
      'name': 'Eiffel Tower',
    },
    {
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/a/a1/Taj_Mahal_in_March_2004.jpg',
      'name': 'Taj Mahal',
    },
    {
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/2/28/Great_Wall_of_China_July_2006.JPG',
      'name': 'Great Wall',
    },
    {
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/4/4d/Colosseum_in_Rome%2C_Italy_-_April_2007.jpg',
      'name': 'Colosseum',
    },
    {
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/9/9c/Statue_of_Liberty_7.jpg',
      'name': 'Statue of Liberty',
    },
    {
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/2/2e/Sydney_Opera_House_-_Dec_2008.jpg',
      'name': 'Sydney Opera House',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: landmarks.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  landmarks[index]['image']!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  landmarks[index]['name']!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
