import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delayed Redirect',
      theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
      initialRoute: "/setup",
      routes: {
        "/setup": (context) => const Setup(),
        "/home": (context) => const MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.home),
            SizedBox(height: 15),
            Text("Home"),
          ],
        ),
      ),
    );
  }
}

class Setup extends StatelessWidget {
  const Setup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Configuration"),
      ),
      body: Center(
        child: FutureBuilder(
          future: Future.delayed(
            const Duration(seconds: 2),
            () {
              return;
            },
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(height: 15),
                  Text("Configuring Device..."),
                ],
              );
            }
            return FutureBuilder(
              future: Future.delayed(
                const Duration(seconds: 2),
                () {
                  Navigator.of(context).pushReplacementNamed("/home");
                },
              ),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.check),
                      SizedBox(height: 15),
                      Text("Device Configured Successfully!"),
                    ],
                  );
                }
                return Container();
              },
            );
          },
        ),
      ),
    );
  }
}
