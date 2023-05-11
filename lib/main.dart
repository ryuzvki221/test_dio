import 'package:flutter/material.dart';
import 'package:test_dio/core/network/api.dart';
import 'package:test_dio/core/services/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'TEST DIO'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _api = Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Builder(
          builder: (context) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final response = await homeService.fetch();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(response.data.toString()),
                      ),
                    );
                  },
                  child: const Text('GET'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final response = await authService.login("admin@yonima.com", "IsMyPassword@123!");
                    print(response.toJson().toString());
                    // final response = await authService.verifyUser("777536365", "1234");
                    // final response = await authService.register(
                    //     "sen fournisseur online",
                    //     "777536365",
                    //     "senfournisseur@passer.com",
                    //     "IsMyPassword@123",
                    //     null);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(response.toJson().toString()),
                      ),
                    );
                  },
                  child: const Text('POST'),
                ),
                ElevatedButton(
                  onPressed: () async {},
                  child: const Text('PUT'),
                ),
                ElevatedButton(
                  onPressed: () async {},
                  child: const Text('DELETE'),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
