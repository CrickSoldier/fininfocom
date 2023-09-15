import 'package:fininfocom/view/dog_screen.dart';
import 'package:fininfocom/view/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final MethodChannel _channel =
      const MethodChannel('bluetoothChannel'); // Match your channel name

  Future<void> enableBluetooth() async {
    try {
      await _channel.invokeMethod('enableBluetooth');
    } on PlatformException catch (e) {
      // Handle platform-specific exceptions
      print("Error: ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Handle "Random dog images" button press
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const DogScreen()));
              },
              child: const Text('Random Dog Images'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle "Enable Bluetooth" button press
                enableBluetooth();
              },
              child: const Text('Enable Bluetooth'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle "Profile" button press
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserScreen()));
              },
              child: const Text('Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
