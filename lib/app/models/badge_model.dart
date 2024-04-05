class BadgeModel {
  final int id;
  final int poinMin;
  final String title;
  final String gambar;
  bool status;

  BadgeModel({
    required this.id,
    required this.poinMin,
    required this.title,
    required this.gambar,
    this.status = false,
  });
}
