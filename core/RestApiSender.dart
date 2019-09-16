import 'dart:io';
import '../models/MtRequest.dart';
import '../models/SimpleHttpResponse.dart';

class RestApiSender {
  HttpClient httpClient;
  HttpRequest httpRequest;

  RestApiSender() {
    httpClient = HttpClient();
  }

  Future<SimpleHttpResponse> sendGetAsync(String url) async {
    return await httpClient
        .getUrl(Uri.parse(url))
        .then((HttpClientRequest hReq) {
      return hReq.close();
    }).then((HttpClientResponse hResp) {
      return SimpleHttpResponse(
          hResp.statusCode, hResp.headers.contentType.value, '');
    });
  }

  Future<SimpleHttpResponse> sendPostAsync(
      MtRequest mtReq, String baseUrl) async {
    var r = await httpClient
        .postUrl(Uri.parse(baseUrl))
        .then((HttpClientRequest hReq) {
          
        });
  }
}
