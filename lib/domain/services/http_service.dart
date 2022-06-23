import 'package:super_hero_yuki/domain/model/value_object/response.dart';

abstract class HttpService {
  Future<Response> get(Uri url, {Map<String, String>? headers});
}
