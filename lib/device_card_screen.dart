import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeviceCardScreen extends StatefulWidget {
  const DeviceCardScreen({
    super.key,
  });

  @override
  State<DeviceCardScreen> createState() => _DeviceCardScreenState();
}

class _DeviceCardScreenState extends State<DeviceCardScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              color: Colors.white,
              Icons.arrow_back_ios, // add custom icons also
            ),
          ),
          backgroundColor: const Color(0x44000000),
          elevation: 0,
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            color: Colors.white,
            child: Text("Пустой экран"),
          ),
        ));
  }
}
