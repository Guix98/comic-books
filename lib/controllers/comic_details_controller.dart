import 'package:comic_book/models/comic.dart';
import 'package:comic_book/services/api_rest/endpoints.dart';
import 'package:get/get.dart';

class ComicDetailsController extends GetxController {
  int idx = 0;

  final activeComic = Comic().obs;

  Future<Comic> loadComicById(int id) async {
    idx = id;
    activeComic.value = Comic();
    activeComic.value = await getIssueById(id);
    return activeComic.value;
  }

  void resetActiveComic() async {
    activeComic.value = Comic();
  }
}
