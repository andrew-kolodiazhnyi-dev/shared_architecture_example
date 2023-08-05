// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import '../../api/models/item.dart';
import '../../models/item_details.dart';

enum ListPageStatus {
  idle,
  loading,
  success,
  error,
  itemSelected,
}

class ListPageState {
  final ListPageStatus status;
  final List<Item> items;
  final ItemDetails? selectedItem;
  final String errorMessage;

  ListPageState({
    required this.status,
    this.selectedItem,
    this.items = const [],
    this.errorMessage = '',
  });

  ListPageState copyWith({
    ListPageStatus? status,
    List<Item>? items,
    ItemDetails? selectedItem,
    String? errorMessage,
  }) {
    return ListPageState(
      status: status ?? this.status,
      items: items ?? this.items,
      selectedItem: selectedItem ?? this.selectedItem,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  bool operator ==(covariant ListPageState other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        listEquals(other.items, items) &&
        other.selectedItem == selectedItem &&
        other.errorMessage == errorMessage;
  }

  @override
  int get hashCode {
    return status.hashCode ^
        items.hashCode ^
        selectedItem.hashCode ^
        errorMessage.hashCode;
  }
}
