class News {
  final String id;
  final String imageAddress;
  final String title;
  final String text;
  final DateTime date;
  final int read;
  final bool isTrending;

  News({
    required this.id,
    required this.imageAddress,
    required this.title,
    required this.text,
    required this.date,
    required this.read,
    this.isTrending = false,
  });
}
