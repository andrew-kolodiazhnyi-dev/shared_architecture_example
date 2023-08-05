import 'package:common/bloc/core/base_cubit.dart';
import 'package:common/bloc/list_page/list_page_state.dart';
import 'package:common/services/common_api_service.dart';
import 'package:logger/logger.dart';

import '../../api/models/item.dart';
import '../../models/item_details.dart';

class ListPageCubit extends BaseCubit<ListPageState> {
  final CommonApiService _commonApiService;
  late List<Item> _items;

  String get baseUrl => _commonApiService.baseUrl;

  ListPageCubit(
    Logger logger,
    this._commonApiService,
  ) : super(
          logger: logger,
          initialState: ListPageState(
            status: ListPageStatus.idle,
          ),
        ) {
    getData();
  }

  @override
  void handleError(String message) {
    emit(
      state.copyWith(
        status: ListPageStatus.error,
        errorMessage: message,
      ),
    );
  }

  Future<void> getData() async {
    emit(state.copyWith(status: ListPageStatus.loading));
    return await makeCall(() async {
      _items = (await _commonApiService.getData()).items;
      emit(
        state.copyWith(
          status: ListPageStatus.success,
          items: _items,
        ),
      );
    });
  }

  Future<void> selectItem(Item item) async {
    emit(state.copyWith(status: ListPageStatus.idle));
    emit(
      state.copyWith(
        status: ListPageStatus.itemSelected,
        selectedItem: ItemDetails(
          imageUrl: _commonApiService.getFullImageUrl(item.icon.url),
          title: item.firstUrl,
          text: item.text,
        ),
      ),
    );
  }

  Future<void> search(String query) async {
    emit(state.copyWith(status: ListPageStatus.idle));
    emit(
      state.copyWith(
        status: ListPageStatus.success,
        items: _items.where((element) {
          return element.text.toLowerCase().contains(query.toLowerCase());
        }).toList(),
      ),
    );
  }
}
