import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for MethodChannel

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Platform Channel',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Define the static const MethodChannel with its unique name
  static const _methodChannel = const MethodChannel(
    'platformchannel.companyname.com/deviceinfo',
  );

  // Variable to hold the device info string
  String _deviceInfo = '';

  // Async method to get device info
  Future<void> _getDeviceInfo() async {
    String deviceInfo;
    try {
      // Invoke the 'getDeviceInfo' method on the host side
      deviceInfo = await _methodChannel.invokeMethod('getDeviceInfo');
    } on PlatformException catch (e) {
      // Handle any exceptions if the call fails
      deviceInfo = "Failed to get device info: '${e.message}'.";
    }

    // Update the state with the new info
    setState(() {
      _deviceInfo = deviceInfo;
    });
  }

  @override
  void initState() {
    super.initState();
    // Call the method when the widget is first initialized
    _getDeviceInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Platform Channel')),
      // Use SafeArea as instructed
      body: SafeArea(
        // Use ListTile to display the info
        child: ListTile(
          contentPadding: EdgeInsets.all(16.0),
          title: Text(
            'Device info:',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            _deviceInfo, // Display the device info variable
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
