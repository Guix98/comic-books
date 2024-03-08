import 'package:comic_book/models/comic.dart';
import 'package:comic_book/models/issue.dart';
import 'package:comic_book/services/api_rest/requests.dart';

// Future<List<Issue>>
Future<List<Issue>> getIssues(int offset) async {
  final response = await ApiRequest.getRequest(
      '/issues/?api_key=${ApiRequest.apiKey}&format=json&sort=date_added:desc&field_list=image,date_added,name,issue_number,id&offset=$offset');
  final parsedResponse = response['results'] as List;

  final issuesList =
      parsedResponse.map((remote) => Issue.fromJson(remote)).toList();

  return issuesList;
}

Future<Comic> getIssueById(int id) async {
  final response = await ApiRequest.getRequest(
      '/issue/4000-$id/?api_key=${ApiRequest.apiKey}&format=json&field_list=character_credits,name,team_credits,location_credits,image');
  final parsedResponse = response['results'];

  final comic = Comic.fromJson(parsedResponse);

  return comic;
}
