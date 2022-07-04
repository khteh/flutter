import 'package:flutter/material.dart';
import 'dart:developer';
// StatefulParentWidget manages the state for TapboxB.

//------------------------ StatefulParentWidget --------------------------------

class StatefulParentWidget extends StatefulWidget {
  const StatefulParentWidget({Key? key}) : super(key: key);

  @override
  _StatefulParentWidgetState createState() => _StatefulParentWidgetState();
}

class _StatefulParentWidgetState extends State<StatefulParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
      log('_active: $_active');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//------------------------- TapboxB ----------------------------------

class TapboxB extends StatelessWidget {
  TapboxB({
    super.key,
    this.active = false,
    required this.onChanged,
  }) {
    log('TabboxB() active: $active - called every time when the UI is redrawn');
  }

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    log('_handleTap(): active: $active');
    onChanged(!active);
    log('_handleTap(): active: $active');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
