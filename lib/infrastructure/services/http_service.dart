import 'package:injectable/injectable.dart';
import 'package:super_hero_yuki/domain/model/value_object/response.dart';
import 'package:super_hero_yuki/domain/services/http_service.dart';
import 'package:http/http.dart' as http;

@Injectable(as: HttpService)
class FlutterHttpService implements HttpService {
  @override
  Future<Response> get(Uri url, {Map<String, String>? headers}) async {
    final http.Response response = await http.get(url, headers: headers);

    return Response(
      statusCode: response.statusCode,
      body: response.body,
      headers: response.headers,
    );
  }
}
