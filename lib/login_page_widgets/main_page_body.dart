import 'package:flutter/material.dart';

class MainPageBody extends StatefulWidget {
  final Color blockColor;
  final String headText;
  final String bottomText;
  final double heightMultiple;
  final BorderRadiusGeometry borderRadius;
  final String midText;
  final EdgeInsetsGeometry edge;
  final CrossAxisAlignment alignment;
  final TextAlign textAlign;
  final VoidCallback onTap;
  const MainPageBody({
    Key? key,
    required this.blockColor,
    required this.headText,
    required this.bottomText,
    required this.heightMultiple,
    required this.borderRadius,
    required this.midText,
    required this.edge,
    required this.alignment,
    required this.textAlign,
    required this.onTap,
  }) : super(key: key);

  @override
  _MainPageBodyState createState() => _MainPageBodyState();
}

class _MainPageBodyState extends State<MainPageBody> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: widget.edge,
          child: Column(
            crossAxisAlignment: widget.alignment,
            children: [
              Text(
                widget.headText,
                style: Theme.of(context).textTheme.headline4,
              ),
              Column(
                crossAxisAlignment: widget.alignment,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Text(
                      widget.midText,
                      textAlign: widget.textAlign,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Text(
                      widget.bottomText,
                      textAlign: widget.textAlign,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              ),
            ],
          ),
          height: (MediaQuery.of(context).size.height * widget.heightMultiple),
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius,
            color: widget.blockColor,
          ),
        ),
      ),
    );
  }
}
