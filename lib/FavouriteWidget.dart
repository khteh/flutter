import 'package:flutter/material.dart';

class FavouriteWidget extends StatefulWidget {
  const FavouriteWidget({Key? key}) : super(key: key);

  @override
  State<FavouriteWidget> createState() => _FavouriteWidgetState();
}

class _FavouriteWidgetState extends State<FavouriteWidget> {
  bool _isFavourited = true;
  int _favouritesCount = 41;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavourited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavourite,
          )),
      SizedBox(
          // Placing the Text in a SizedBox and setting its width prevents a discernible “jump” when the text changes between the values of 40 and 41 — a jump would otherwise occur because those values have different widths.
          width: 18,
          child: SizedBox(child: Text('$_favouritesCount')))
    ]);
  }

  void _toggleFavourite() {
    setState(() {
      if (_isFavourited) {
        _favouritesCount--;
      } else {
        _favouritesCount++;
      }
      _isFavourited = !_isFavourited;
    });
  }
}
