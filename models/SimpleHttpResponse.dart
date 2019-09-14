import 'dart:convert';

class SimpleHttpResponse {
  final int statusCode;
  final String responseContentString;
  final String error;

  SimpleHttpResponse(this.statusCode, this.responseContentString, this.error);

  Map<String, dynamic> toJson() => {
        'statusCode': statusCode,
        'responseContentString': responseContentString,
        'error': error
      };

  String toJsonString() => jsonEncode(toJson());
}
