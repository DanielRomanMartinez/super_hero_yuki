import 'dart:io';

import 'package:super_hero_yuki/domain/model/value_object/response.dart';

abstract class HttpService implements HttpClient {

  @override
  Future<HttpClientRequest> getUrl(Uri url);
}
