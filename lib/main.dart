import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MissionControl()));

class MissionControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cosmic Explorer - Mission Control'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DockingBay()),
            );
          },
          child: Text('Enter Docking Bay'),
        ),
      ),
    );
  }
}

class DockingBay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Docking Bar'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Return to Control'),
        ),
      ),
    );
  }
}