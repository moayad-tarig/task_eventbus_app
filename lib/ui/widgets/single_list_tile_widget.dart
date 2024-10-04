import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:task_eventbus_app/events/event_bus.dart';
import 'package:task_eventbus_app/events/single_item_timer_event.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SingleListTileWidget extends StatefulWidget {
  final int index;
  const SingleListTileWidget({super.key, required this.index});

  @override
  State<SingleListTileWidget> createState() => _SingleListTileWidgetState();
}

class _SingleListTileWidgetState extends State<SingleListTileWidget>
    with
        TickerProviderStateMixin,
        AutomaticKeepAliveClientMixin,
        EventBusMixin {
  bool _isGifVisible = false;
  final int _initialCountdownTime = 60;
  int _remainingTime = 60; // Remaining time

  late GifController _gifController;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _gifController = GifController(vsync: this);
    _remainingTime = _initialCountdownTime; // Set remaining time

    on<SingleItemTimerEvent>().listen((event) {
      if (event.itemId == widget.index && mounted) {
        setState(() {
          _remainingTime = event.currentTime;
        });
      }
    });
  }

  void _startTimer() {
    // ignore: prefer_conditional_assignment
    if (_timer == null) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_remainingTime > 0) {
          _remainingTime--;
          emit(SingleItemTimerEvent(
              currentTime: _remainingTime, itemId: widget.index));
        } else {
          _timer?.cancel();
          _timer = null;
        }
      });
    }
  }

  void _pauseTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  void dispose() {
    _pauseTimer();
    // eventDispose();
    _gifController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('gif_visibility_${widget.index}'),
      onVisibilityChanged: (isVisibleInfo) {
        if (mounted) {
          if (isVisibleInfo.visibleFraction > 0 && !_isGifVisible) {
            if (_timer == null && _remainingTime > 0) {
              _startTimer();
            }
            _gifController.repeat(period: const Duration(seconds: 2));
          } else {
            _pauseTimer();
            _gifController.stop();
          }
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text('Item ${widget.index}'),
          onTap: () {},
          leading: Gif(
            image: const AssetImage('assets/image.gif'),
            controller: _gifController,
          ),
          trailing: Text(
            _remainingTime.toString(),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true; //
}
