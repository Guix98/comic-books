import 'package:comic_book/models/issue.dart';
import 'package:comic_book/services/api_rest/endpoints.dart';
import 'package:get/get.dart';

class ContentController extends GetxController {
  int offset = 0;
  RxList<Issue> issues = <Issue>[].obs;
  final isListView = true.obs;
  get getIsListView => isListView.value;

  void setIsListView(isListView) => this.isListView.value = isListView;

  @override
  void onInit() {
    super.onInit();
    loadInitialIssues();
  }

  void loadInitialIssues() async {
    issues.value = await getIssues(offset)
        .then((list) => list.where((element) => element.name != null).toList());

    offset += 100;
  }

  void loadMoreIssues() async {
    issues.addAll(await getIssues(offset).then(
        (list) => list.where((element) => element.name != null).toList()));
    offset += 100;
  }
}
