import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        primaryColor: Colors.blue,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isLoading = !isLoading;
          });
        },
      ),
      appBar: AppBar(
        title: Text("#1- Animated switcher"),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: isLoading
            ? Container(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                color: Theme.of(context).primaryColor,
                child: const CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.white,
                ),
              )
            : loadedItems(context),
      ),
    );
  }

  Widget loadedItems(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (c, i) {
        return ListTile(
          title: Text("Title $i"),
          subtitle: Text("This is the initial description $i"),
          leading: const CircleAvatar(),
        );
      },
    );
  }
}
