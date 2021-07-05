import 'package:flutter/material.dart';
import 'package:tic_tac_toe/tile_state.dart';

class BoardTile extends StatelessWidget {
  final TileState tileState;
  final double dimension;
  final VoidCallback onPressed;

  const BoardTile(
      {Key? key,
      required this.dimension,
      required this.onPressed,
      required this.tileState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: dimension,
        height: dimension,
        child: TextButton(onPressed: onPressed, child: _widgetTileState()));
  }

  Widget _widgetTileState() {
    Widget widget;

    switch (tileState) {
      case TileState.EMPTY:
        widget = Container();
        break;
      case TileState.CROSS:
        widget = Image.asset(
          'images/x.png',
          scale: 2,
        );
        break;
      case TileState.CIRCLE:
        widget = Image.asset(
          'images/o.png',
          scale: 2,
        );
        break;
      case TileState.TIE:
        widget = Container();
        break;
    }
    return widget;
  }
}
