import 'dart:convert';

class CharacterQuote {
  final int quoteId;
  final String quote;
  final String author;
  final String series;

  const CharacterQuote({
    this.quoteId,
    this.quote,
    this.author,
    this.series,
  });

  factory CharacterQuote.fromJson(String str) =>
      CharacterQuote.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CharacterQuote.fromMap(Map<String, dynamic> json) => CharacterQuote(
        quoteId: json["quote_id"],
        quote: json["quote"],
        author: json["author"],
        series: json["series"],
      );

  Map<String, dynamic> toMap() => {
        "quote_id": quoteId,
        "quote": quote,
        "author": author,
        "series": series,
      };
}
