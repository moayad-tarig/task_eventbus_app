/// Every item in the list contain it's own timer
class SingleItemTimerEvent {
  final int itemId;
  final int currentTime;
  SingleItemTimerEvent({required this.currentTime, required this.itemId});
}
