import 'dart:io';

import 'package:flutter/material.dart';

import 'device_card_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List? list = [
    "Savva",
    "Olluco",
    "Loona",
    "Folk",
    "Whiite Rabbit",
    "Sage",
    "Maya",
    "Jun",
    "Onest",
    "Probka на Цветном",
  ];

  List<Color> colorsList = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    // Добавьте нужное количество цветов
  ];

  getName(String value) {
    dynamic title = const DeviceCardScreen();
    switch (value) {
      case "Экран поверок приборов":
        title = const DeviceCardScreen();
        break;
      case "Новый первичный протокол":
        title = const DeviceCardScreen();
        break;
      case "Карточка прибора":
        title = const DeviceCardScreen();
        break;
      default:
        title = const DeviceCardScreen();
    }
    return title;
  }

  void onBack() {
    Navigator.pop(context);
  }

  int calculateCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= 1024) {
      return 3;
    } else if (screenWidth >= 600) {
      return 2;
    } else {
      return 1;
    }
  }

  void handleClick(String value) {
    switch (value) {
      case 'Logout':
        break;
      case 'Settings':
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = calculateCrossAxisCount(context);
    final textController = TextEditingController();
    var size = MediaQuery.of(context).size.width;
    var width;
    setState(() {
      width = size;
    });
    if (Platform.isIOS) {
      crossAxisCount = 1;
    } else if (Platform.isAndroid) {
      crossAxisCount = 2;
    } else if (Platform.isWindows) {
      crossAxisCount = 3;
    } else {
      crossAxisCount = 3; // По умолчанию для других платформ
    }
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: Icon(Icons.settings), // Иконка шестеренки для настроек
          onPressed: () {
            // Действие при нажатии на иконку настроек
          },
        ),
        title: Text('Рабочее пространство'), // Центральный заголовок
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add), // Иконка плюсика справа
            onPressed: () {
              // Действие при нажатии на иконку плюсика
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: textController,
                decoration: InputDecoration(
                  prefixIconColor: Colors.white,
                  labelStyle: const TextStyle(color: Colors.white),
                  labelText: 'Поиск',
                  prefixIcon: Icon(Icons.search),
                  // Иконка лупы
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2.0), // Цвет контура
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: Colors.black26,
                ),
              )),
          Expanded(
              flex: 1,
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: list?.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: width * 0.3,
                  crossAxisCount: crossAxisCount,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: colorsList[index % colorsList.length],
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                              child: Text(
                                list?[index],
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 8.0,
                            right: 8.0,
                            child: GestureDetector(
                              onTap: () {
                                // Обработка меню
                                print('More options clicked for ${list?[index]}');
                              },
                              child: const Icon(Icons.more_horiz),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }
}
