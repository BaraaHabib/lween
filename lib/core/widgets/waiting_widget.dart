import 'package:flutter/material.dart';

class WaitingWidget extends StatefulWidget {
  const WaitingWidget({Key? key}) : super(key: key);

  @override
  State<WaitingWidget> createState() => _WaitingWidgetState();
}

class _WaitingWidgetState extends State<WaitingWidget> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      const Center(
        child: CircularProgressIndicator(),
      );


}