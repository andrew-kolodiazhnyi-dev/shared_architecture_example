import 'package:common/bloc/list_page/list_page_cubit.dart';
import 'package:common/views/details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/list_page/list_page_state.dart';
import '../../utils/device_utils.dart';
import '../details_page/details_page.dart';

class ListPage extends StatelessWidget {
  final ListPageCubit cubit;
  const ListPage._(this.cubit);

  static BlocProvider create(ListPageCubit cubit) =>
      BlocProvider<ListPageCubit>(
        create: (_) => cubit,
        child: ListPage._(cubit),
      );

  void _onItemTap({
    required ListPageState state,
    required int index,
    required BuildContext context,
  }) async {
    cubit.selectItem(state.items[index]);
  }

  void _onStateChanged(context, state) {
    switch (state.status) {
      case ListPageStatus.error:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.errorMessage),
          ),
        );
        break;
      case ListPageStatus.itemSelected:
        if (DeviceUtils.deviceType == DeviceType.phone) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailsPage(
                item: state.selectedItem,
              ),
            ),
          );
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(runtimeType.toString()),
      ),
      body: BlocConsumer<ListPageCubit, ListPageState>(
        listener: _onStateChanged,
        builder: (context, state) {
          switch (state.status) {
            case ListPageStatus.idle:
            case ListPageStatus.success:
            case ListPageStatus.itemSelected:
              return _buildSuccessBody(state);
            case ListPageStatus.error:
              return _buildError();
            case ListPageStatus.loading:
              return _buildLoading();
          }
        },
      ),
    );
  }

  Widget _buildSuccessBody(ListPageState state) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildListWithSearch(state)),
        _buildDetailsView(state),
      ],
    );
  }

  Widget _buildDetailsView(ListPageState state) {
    switch (DeviceUtils.deviceType) {
      case DeviceType.phone:
        return const SizedBox.shrink();
      default:
        final selectedItem = state.selectedItem;
        return Expanded(
          child: selectedItem != null
              ? DetailsView(item: selectedItem)
              : const SizedBox.shrink(),
        );
    }
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError() {
    return Center(
      child: IconButton(
        icon: const Icon(Icons.replay_circle_filled),
        onPressed: () {
          cubit.getData();
        },
      ),
    );
  }

  Widget _buildListWithSearch(ListPageState state) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SearchBar(
            onChanged: (value) {
              cubit.search(value);
            },
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: state.items.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => _onItemTap(
                  state: state,
                  index: index,
                  context: context,
                ),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(state.items[index].text),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
