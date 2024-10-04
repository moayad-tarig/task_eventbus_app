import 'package:flutter/material.dart';
import 'package:task_eventbus_app/ui/pages/global_timer_screen.dart';
import 'package:task_eventbus_app/ui/pages/single_timer_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(appBarTheme: const AppBarTheme(color: Colors.blueAccent)),
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text('Task App'),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Eventbus demo app 👍🏼",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const Text('you will see alot of '),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/image.gif',
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GlobalTimerScreen()));
                },
                child: const Text('click here for Global Timer'),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SingleTimerScreen()));
                  },
                  child: const Text('click here for Single Timer ')),
            ],
          ),
        );
      }),
    );
  }
}
