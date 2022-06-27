import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:super_hero_yuki/domain/model/value_object/response.dart';
import 'package:super_hero_yuki/domain/services/http_service.dart';
import 'package:http/http.dart' as http;

@Injectable(as: HttpService)
class FlutterHttpService implements HttpService {
  @override
  Future<Response> getUrl(Uri url, {Map<String, String>? headers}) async {
    final http.Response response = await http.get(url, headers: headers);

    return Response(
      statusCode: response.statusCode,
      body: response.body,
      headers: response.headers,
    );
  }

  @override
  bool autoUncompress;

  @override
  Duration? connectionTimeout;

  @override
  Duration idleTimeout;

  @override
  int? maxConnectionsPerHost;

  @override
  String? userAgent;

  @override
  void addCredentials(Uri url, String realm, HttpClientCredentials credentials) {
    // TODO: implement addCredentials
  }

  @override
  void addProxyCredentials(String host, int port, String realm, HttpClientCredentials credentials) {
    // TODO: implement addProxyCredentials
  }

  @override
  set authenticate(Future<bool> Function(Uri url, String scheme, String? realm)? f) {
    // TODO: implement authenticate
  }

  @override
  set authenticateProxy(Future<bool> Function(String host, int port, String scheme, String? realm)? f) {
    // TODO: implement authenticateProxy
  }

  @override
  set badCertificateCallback(bool Function(X509Certificate cert, String host, int port)? callback) {
    // TODO: implement badCertificateCallback
  }

  @override
  void close({bool force = false}) {
    // TODO: implement close
  }

  @override
  Future<HttpClientRequest> delete(String host, int port, String path) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<HttpClientRequest> deleteUrl(Uri url) {
    // TODO: implement deleteUrl
    throw UnimplementedError();
  }

  @override
  set findProxy(String Function(Uri url)? f) {
    // TODO: implement findProxy
  }

  @override
  Future<HttpClientRequest> head(String host, int port, String path) {
    // TODO: implement head
    throw UnimplementedError();
  }

  @override
  Future<HttpClientRequest> headUrl(Uri url) {
    // TODO: implement headUrl
    throw UnimplementedError();
  }

  @override
  Future<HttpClientRequest> open(String method, String host, int port, String path) {
    // TODO: implement open
    throw UnimplementedError();
  }

  @override
  Future<HttpClientRequest> openUrl(String method, Uri url) {
    // TODO: implement openUrl
    throw UnimplementedError();
  }

  @override
  Future<HttpClientRequest> patch(String host, int port, String path) {
    // TODO: implement patch
    throw UnimplementedError();
  }

  @override
  Future<HttpClientRequest> patchUrl(Uri url) {
    // TODO: implement patchUrl
    throw UnimplementedError();
  }

  @override
  Future<HttpClientRequest> post(String host, int port, String path) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<HttpClientRequest> postUrl(Uri url) {
    // TODO: implement postUrl
    throw UnimplementedError();
  }

  @override
  Future<HttpClientRequest> put(String host, int port, String path) {
    // TODO: implement put
    throw UnimplementedError();
  }

  @override
  Future<HttpClientRequest> putUrl(Uri url) {
    // TODO: implement putUrl
    throw UnimplementedError();
  }
}
