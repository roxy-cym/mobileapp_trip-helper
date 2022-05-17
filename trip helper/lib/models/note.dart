class Note {
  final String? content;
  final String? title;

  Note(this.content, this.title);

  @override
  String toString() {
    return 'Note records{content: $content | title: $title}';
  }
}
