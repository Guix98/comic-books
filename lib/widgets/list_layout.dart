import 'package:comic_book/helpers/helpers.dart';
import 'package:comic_book/models/issue.dart';
import 'package:comic_book/widgets/row_or_column.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ListLayout extends StatelessWidget {
  final ScrollController controller;
  final List<Issue> items;
  const ListLayout({super.key, required this.controller, required this.items});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Expanded(
            child: ListView.builder(
          controller: controller,
          itemCount: items.length + 1,
          itemBuilder: (context, index) {
            if (index < items.length) {
              final item = items[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  RowOrColumn(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 45.h,
                        width: Get.width < 600 ? 80.w : 30.w,
                        child: Image.network(item.image!.originalUrl!),
                      ),
                      Column(
                        children: [
                          Text(
                            "${item.name} #${item.issueNumber}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(formatDate(item.dateAdded!)),
                        ],
                      )
                    ],
                  ),
                  Divider(
                    height: 5.h,
                  )
                ],
              );
            } else {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.grey,
                  ),
                ),
              );
            }
          },
        )));
  }
}
