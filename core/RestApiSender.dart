import 'dart:async';
import 'package:http/http.dart' as http;
import '../models/MtRequest.dart';
import '../models/SimpleHttpResponse.dart';

Future<SimpleHttpResponse> getAsync(String url) async {
  try {
    var resp = await http.get(url);
    return new SimpleHttpResponse(resp.statusCode, resp.body, null);
  } catch (e) {
    return new SimpleHttpResponse(99, null, e);
  }
}

Future<SimpleHttpResponse> postAsync(MtRequest mtReq, String baseUrl) async {
  try {
    var resp = await http.post(baseUrl, body: mtReq.toJson());
    return new SimpleHttpResponse(resp.statusCode, resp.body, null);
  } catch (e) {
    return new SimpleHttpResponse(99, null, e);
  }
}
