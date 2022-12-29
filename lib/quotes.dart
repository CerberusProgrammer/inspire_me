import 'dart:convert';
import 'dart:io';

import 'package:inspire_me/quote.dart';

class Quotes {
  static List<Quote> quotes = [];

  static void importQuotes() {
    File file = File('data_quotes.json');

    if (!file.existsSync()) {
      return;
    }

    String content = file.readAsStringSync();
    final decoded = jsonDecode(content) as List<dynamic>;

    for (var element in decoded) {
      Quote q = Quote.fromJson(element);
      quotes.add(q);
    }
  }
}
