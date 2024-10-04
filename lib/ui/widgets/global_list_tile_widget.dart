import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:task_eventbus_app/events/event_bus.dart';
import 'package:task_eventbus_app/events/global_timer_event.dart';
import 'package:visibility_detector/visibility_detector.dart';

class GlobalListTile extends StatefulWidget {
  final int index;
  const GlobalListTile({super.key, required this.index});

  @override
  State<GlobalListTile> createState() => _GlobalListTileState();
}

class _GlobalListTileState extends State<GlobalListTile>
    with
        AutomaticKeepAliveClientMixin,
        EventBusMixin,
        SingleTickerProviderStateMixin {
  late GifController _gifController;
  bool _isGifVisible = false;
  int countDownTime = 60;
  late StreamSubscription<GlobalTimerEvent> _countdownSubscription;

  @override
  void initState() {
    super.initState();
    _gifController = GifController(vsync: this);

    // Listen to the CountdownEvent
    _countdownSubscription = on<GlobalTimerEvent>().listen((event) {
      if (mounted) {
        if (countDownTime != event.currentTime) {
          setState(() {
            countDownTime = event.currentTime;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _countdownSubscription.cancel();
    _gifController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return VisibilityDetector(
      key: Key('gif_visibility_${widget.index}'),
      onVisibilityChanged: (visibilityInfo) {
        if (mounted) {
          final bool isNowVisible = visibilityInfo.visibleFraction > 0;
          if (_isGifVisible != isNowVisible) {
            _isGifVisible = isNowVisible;
            if (_isGifVisible) {
              _gifController.repeat(period: const Duration(seconds: 2));
            } else {
              _gifController.stop();
            }
          }
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: const Text('Item'),
          onTap: () {},
          leading: Gif(
              image: const AssetImage('assets/image.gif'),
              controller: _gifController),
          trailing: Text(countDownTime.toString()), // Display countdown time
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
