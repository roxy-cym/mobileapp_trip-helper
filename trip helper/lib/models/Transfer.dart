class Transfer {
  final String? category;
  final double? num;

  Transfer(this.category, this.num);

  @override
  String toString() {
    return 'Transfer records{Number: $num | Category: $category}';
  }
}
