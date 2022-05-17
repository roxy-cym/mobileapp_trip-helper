class Detail {
  final String? country;
  final String? date;

  Detail(this.country, this.date);

  @override
  String toString() {
    return 'Trip records{country: $country | date: $date}';
  }
}
