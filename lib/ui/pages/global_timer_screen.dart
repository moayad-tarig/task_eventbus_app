import 'dart:async';
import 'package:flutter/material.dart';
import 'package:task_eventbus_app/events/event_bus.dart';
import 'package:task_eventbus_app/events/global_timer_event.dart';
import 'package:task_eventbus_app/ui/widgets/global_list_tile_widget.dart';

class GlobalTimerScreen extends StatefulWidget {
  const GlobalTimerScreen({super.key});

  @override
  State<GlobalTimerScreen> createState() => _GlobalTimerScreenState();
}

class _GlobalTimerScreenState extends State<GlobalTimerScreen>
    with EventBusMixin {
  int countdownTime = 60;
  List<int> currentTimes = [];
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      startGlobalCountdownTimer();
    }
  }

  void startGlobalCountdownTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        if (countdownTime > 0) {
          countdownTime--;
          emit(GlobalTimerEvent(countdownTime));
        } else {
          _timer?.cancel();
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Global Timer List'),

      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return GlobalListTile(
              index: index,
            );
          },
          itemCount: 1000,
        ),
      ),
    );
  }
}
