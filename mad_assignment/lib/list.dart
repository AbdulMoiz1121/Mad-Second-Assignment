import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  final List<Map<String, String>> destinations = [
    {'name': 'Paris', 'desc': 'The city of lights and love.'},
    {'name': 'Tokyo', 'desc': 'A perfect mix of tradition and technology.'},
    {'name': 'London', 'desc': 'Famous for Big Ben and history.'},
    {'name': 'New York', 'desc': 'The city that never sleeps.'},
    {'name': 'Dubai', 'desc': 'Modern architecture and luxury lifestyle.'},
    {'name': 'Rome', 'desc': 'Home of ancient ruins and culture.'},
    {'name': 'Istanbul', 'desc': 'Where East meets West.'},
    {'name': 'Bangkok', 'desc': 'Vibrant street life and temples.'},
    {'name': 'Cairo', 'desc': 'The land of the pyramids.'},
    {'name': 'Sydney', 'desc': 'Famous for its Opera House.'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: destinations.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.teal.shade50,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: const Icon(Icons.location_on, color: Colors.teal),
            title: Text(destinations[index]['name']!),
            subtitle: Text(destinations[index]['desc']!),
          ),
        );
      },
    );
  }
}
