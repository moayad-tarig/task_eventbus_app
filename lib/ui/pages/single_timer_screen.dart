import 'package:flutter/material.dart';
import 'package:task_eventbus_app/ui/widgets/single_list_tile_widget.dart';

class SingleTimerScreen extends StatelessWidget {
  const SingleTimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Indevisual Timer List'),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return SingleListTileWidget(
              index: index,
            );
          },
          itemCount: 1000,
        ),
      ),
    );
  }
}
