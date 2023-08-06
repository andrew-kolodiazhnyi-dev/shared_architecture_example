import 'package:flutter/material.dart';

import '../models/item_details.dart';

class DetailsView extends StatelessWidget {
  final ItemDetails item;

  const DetailsView({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 16),
          Image.network(
            item.imageUrl,
            height: 200,
            errorBuilder: (context, error, stackTrace) => const Icon(
              Icons.broken_image_outlined,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 16),
          Text(item.title, maxLines: 2, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 16),
          Text(item.text),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
