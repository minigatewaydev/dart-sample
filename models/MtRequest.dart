import 'dart:convert';
class MtRequest {
  final String _username,
      _password,
      _from,
      _to,
      _text,
      _coding,
      _dlrMask,
      _dlrUrl,
      _responseType;

  MtRequest(this._username, this._password, this._from, this._to, this._text,
      this._coding, this._dlrMask, this._dlrUrl, this._responseType);

  Map<String, dynamic> toJson() => {
        'gw-username': _username,
        'gw-password': _password,
        'gw-from': _from,
        'gw-to': _to,
        'gw-text': _text,
        'gw-coding': _coding,
        'gw-dlr-mask': _dlrMask,
        'gw-dlr-url': _dlrUrl,
        'gw-resp-type': _responseType
      };

      String toJsonString() => jsonEncode(toJson());
}
