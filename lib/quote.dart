class Quote {
  String _id;
  String content;
  String author;
  String authorId;
  List<String> tags;
  int length;

  Quote(
    this._id,
    this.content,
    this.author,
    this.authorId,
    this.tags,
    this.length,
  );

  factory Quote.fromJson(dynamic json) {
    return Quote(
      json['id'] as String,
      json['content'] as String,
      json['author'] as String,
      json['authorId'] as String,
      json['tags'] as List<String>,
      json['length'] as int,
    );
  }

  Map toJson() => {
        '_id': _id,
        'content': content,
        'author': author,
        'authorId': authorId,
        'tags': tags,
        'length': length,
      };

  @override
  String toString() {
    return super.toString();
  }
}
