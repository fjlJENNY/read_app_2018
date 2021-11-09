class Book {
  Book({
    required this.title,
    required this.avatar,
    required this.intro,
    this.isbn,
  });
  final String title;
  final String avatar;
  final String intro;
  final String? isbn; // 国际标准书号
}
