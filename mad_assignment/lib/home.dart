import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1507525428034-b723cf961d3e',
            height: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.teal.shade50,
            child: const Text(
              'Welcome to the Travel Guide App! Plan your trips and explore beautiful destinations.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          RichText(
            text: const TextSpan(
              style: TextStyle(fontSize: 18, color: Colors.black),
              children: [
                TextSpan(text: 'Explore the '),
                TextSpan(
                  text: 'World ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                TextSpan(text: 'with Us!'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'Enter Destination Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Exploring ${_controller.text}!')),
              );
            },
            child: const Text('Explore'),
          ),
          TextButton(
            onPressed: () {
              print('TextButton clicked!');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Thanks for using Travel Guide!')),
              );
            },
            child: const Text('More Info'),
          ),
        ],
      ),
    );
  }
}
