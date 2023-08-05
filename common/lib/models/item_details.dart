class ItemDetails {
  final String imageUrl;
  final String title;
  final String text;

  ItemDetails({
    required this.imageUrl,
    required this.title,
    required this.text,
  });

  const ItemDetails.empty()
      : imageUrl = '',
        title = '',
        text = '';
}
