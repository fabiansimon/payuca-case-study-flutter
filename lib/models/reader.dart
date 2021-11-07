class Reader {
  Reader({
    required this.title,
    required this.id,
    this.location,
    this.information,
    this.isOpen,
    this.isLoading,
  });
  int id;
  String title;
  String? location;
  String? information;
  bool? isOpen = false;
  bool? isLoading = false;
}
