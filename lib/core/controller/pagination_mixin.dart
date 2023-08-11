

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/features/notifications/models/notifications.dart';
import 'package:lween/features/notifications/screens/controller.dart';

mixin PaginationMixin<T> implements Controller{

  final ScrollController scrollController = ScrollController();
  final PagingController<int, T> pagingController =
  PagingController(firstPageKey: 0,);

  void initPagination(NotificationsController baseController) {
    pagingController.addPageRequestListener((pageKey) {
      fetchNextPage(pageKey);
    });
  }

  fetchNextPage(int pageKey);
  loadItemsPage(List<T> items, int nextPageKey){
    try {
      final isLastPage = (items.length) < 10;
      final newItems = items;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }


}