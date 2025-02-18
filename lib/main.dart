import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WalletCardScreen(),
    );
  }
}

class WalletCardScreen extends StatefulWidget {
  @override
  _WalletCardScreenState createState() => _WalletCardScreenState();
}

class _WalletCardScreenState extends State<WalletCardScreen> {
  @override
  Widget build(BuildContext context) {
    final scheme = CorePalette.of(0xFFFF9800);
    final backgroundColor = Color(scheme.primary.get(90));
    final textColor = Color(scheme.primary.get(10));

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Wallet Card", style: TextStyle(color: Colors.orange)),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Center(
        child: FlipCard(
          direction: FlipDirection.HORIZONTAL,
          front: CardWidget(front: true, backgroundColor: backgroundColor, textColor: textColor),
          back: CardWidget(front: false, backgroundColor: backgroundColor, textColor: textColor),
        ),
      ),
    );
  }
}

class CardWidget extends StatefulWidget {
  final bool front;
  final Color backgroundColor;
  final Color textColor;

  CardWidget({required this.front, required this.backgroundColor, required this.textColor});

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool showCVV = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 220,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.orangeAccent.withOpacity(0.5),
            blurRadius: 15,
            spreadRadius: 3,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.front
              ? [
            Text(
              "My Wallet",
              style: TextStyle(
                color: widget.textColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text("Tap to see the card details", style: TextStyle(color: widget.textColor)),
          ]
              : [
            Text("Card Number: 1234 5678 9012 3456",
                style: TextStyle(color: widget.textColor, fontSize: 16)),
            SizedBox(height: 5),
            Text("Expiry: 12/25",
                style: TextStyle(color: widget.textColor, fontSize: 16)),
            SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                setState(() {
                  showCVV = !showCVV;
                });
              },
              child: Text(
                showCVV ? "CVV: 206" : "CVV: ***",
                style: TextStyle(color: widget.textColor, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
