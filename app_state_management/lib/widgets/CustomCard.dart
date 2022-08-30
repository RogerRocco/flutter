import 'package:flutter/material.dart';
import 'package:app_state_management/widgets/form.dart';

class CustomCard extends StatefulWidget {
  String cardTitle;
  String cardSubtitle;

  CustomCard(this.cardTitle, this.cardSubtitle);

  @override
  State<CustomCard> createState() => _CustomCardState(cardTitle, cardSubtitle);
}

class _CustomCardState extends State<CustomCard> {
  String cardTitle = "Empty title";
  String cardSubtitle = "Empty subtitle";

  _CustomCardState(String cardTitle, String cardSubtitle);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.album),
              title: Text(widget.cardTitle),
              subtitle: Text(widget.cardSubtitle),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Clear Data'),
                  onPressed: () {
                    setState(() {
                      widget.cardTitle = "-";
                      widget.cardSubtitle = "-";
                    });
                  },
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('Edit Data'),
                  onPressed: () {
                    teste(title, subtitle) => setState(() {
                          debugPrint(title + subtitle);
                          widget.cardTitle = title;
                          widget.cardSubtitle = subtitle;
                        });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          // builder: (context) => FormPage(callback: teste)),
                          builder: (context) => const CustomForm()),
                    ).then((value) {
                      if (value.title != null && value.subtitle != null)
                        teste(value.title, value.subtitle);
                    });
                  },
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
