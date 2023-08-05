import 'package:common/views/details_view.dart';
import 'package:flutter/material.dart';

import '../../models/item_details.dart';

class DetailsPage extends StatelessWidget {
  final ItemDetails item;
  const DetailsPage({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(runtimeType.toString()),
      ),
      body: DetailsView(
        item: item,
      ),
    );
  }
}
