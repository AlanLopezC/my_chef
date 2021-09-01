import 'package:flutter/material.dart';

class ChipsRow extends StatefulWidget {
  const ChipsRow({
    required this.chipsLabel,
    this.defaultIndex,
    required this.callback,
  });
  final List<String> chipsLabel;
  final int? defaultIndex;
  final Function callback;

  @override
  _ChipsRowState createState() => _ChipsRowState();
}

class _ChipsRowState extends State<ChipsRow> {
  int? currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.defaultIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      child: ListView.builder(
        itemBuilder: (context, int i) {
          return Padding(
            padding: EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = i;
                });
                widget.callback(i);
              },
              child: Chip(
                visualDensity: VisualDensity.standard,
                label: Text(widget.chipsLabel[i]),
                backgroundColor: i == currentIndex ? Colors.black26 : null,
              ),
            ),
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: widget.chipsLabel.length,
        shrinkWrap: true,
      ),
    );
  }
}
