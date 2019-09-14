import 'dart:convert';

class MtRequest {
  final String username,
      password,
      from,
      to,
      text,
      coding,
      dlrMask,
      dlrUrl,
      responseType;

  MtRequest(this.username, this.password, this.from, this.to, this.text,
      this.coding, this.dlrMask, this.dlrUrl, this.responseType);

  Map<String, dynamic> toJson() => {
        'gw-username': username,
        'gw-password': password,
        'gw-from': from,
        'gw-to': to,
        'gw-text': text,
        'gw-coding': coding,
        'gw-dlr-mask': dlrMask,
        'gw-dlr-url': dlrUrl,
        'gw-resp-type': responseType
      };

  String toJsonString() => jsonEncode(toJson());
}
