import 'dart:convert';
import 'dart:io';
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

@deprecated
Future<String> _readResponseAsync(HttpClientResponse resp) async {
  try {
    var completer = new Completer();
    var contents = new StringBuffer();

    resp.transform(utf8.decoder).listen((data) {
      contents.write(data);
    }, onDone: () => completer.complete(contents.toString()));

    var x = await completer.future;
    return x.toString();
  } catch (e) {
    return null;
  }
}
