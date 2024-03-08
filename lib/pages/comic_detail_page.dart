import 'package:comic_book/controllers/comic_details_controller.dart';
import 'package:comic_book/models/comic.dart';
import 'package:comic_book/pages/home_page.dart';
import 'package:comic_book/widgets/credit_section.dart';
import 'package:comic_book/widgets/row_or_column.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ComicDetailsPage extends StatelessWidget {
  final int id;
  ComicDetailsPage({Key? key, required this.id}) : super(key: key);

  final ComicDetailsController comicController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        title: const Text('ComicBook'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Get.off(() => const HomePage());
              },
              icon: const Icon(FontAwesome.home))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(5.w),
        child: FutureBuilder<Comic>(
          future: comicController.loadComicById(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.grey,
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              final comic = snapshot.data!;

              return RowOrColumn(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CreditSection(
                        credits: comic.characterCredits!,
                        title: 'Characters',
                      ),
                      CreditSection(
                        credits: comic.teamCredits!,
                        title: 'Teams',
                      ),
                      CreditSection(
                        credits: comic.locationCredits!,
                        title: 'Locations',
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: Get.width * 0.4,
                    child: Image.network(comic.image!.originalUrl!),
                  )
                ],
              );
            } else {
              return const Center(
                child: Text('No data available'),
              );
            }
          },
        ),
      ),
    );
  }
}
