import 'package:flutter/material.dart';

import 'data/fonts.dart';
import 'data/quotes.dart';

class QuoteCard extends StatefulWidget {
  final int index;
  final int fontIndexRandom;
  final double fontSizeRandom;
  final Color color;
  final bool isHistory;

  const QuoteCard({
    super.key,
    required this.index,
    required this.fontIndexRandom,
    required this.fontSizeRandom,
    required this.color,
    this.isHistory = false,
  });

  @override
  State<StatefulWidget> createState() => _QuoteCard();
}

class _QuoteCard extends State<QuoteCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.isHistory
              ? const Center()
              : Wrap(
                  children: List.generate(
                    (allquotes[widget.index]['tags'] as List<String>).length,
                    (i) {
                      return FilledButton(
                        onPressed: () {},
                        child: Text(
                          (allquotes[widget.index]['tags'] as List<String>)[i],
                        ),
                      );
                    },
                  ),
                ),
          Card(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                gradient: LinearGradient(
                  colors: [
                    widget.color.withAlpha(120),
                    Theme.of(context).colorScheme.primary.withAlpha(60),
                  ],
                ),
              ),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                onTap: () {},
                title: Text(
                  allquotes[widget.index]['content'],
                  style: TextStyle(
                    fontFamily: styleList[widget.fontIndexRandom],
                    letterSpacing: 1,
                    fontStyle: FontStyle.normal,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  '- ${allquotes[widget.index]['author']}',
                  style: TextStyle(
                    letterSpacing: 1,
                    fontStyle: FontStyle.italic,
                    fontSize: widget.fontSizeRandom,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          widget.isHistory
              ? const Center()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.share),
                    ),
                  ],
                )
        ],
      ),
    );
  }
}