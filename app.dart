import 'dart:core';
import 'models/MtRequest.dart';
import 'core/RestApiSender.dart';

var baseUrl = "http://162.253.16.28:5010/api/send";
RestApiSender api = RestApiSender();

void main(List<String> args) {
  /* 
   * Change according to your own data
   * for username & password. If you set 'dlrMask' to 1, 
   * please specify the 'dlrUrl'
   */
  var req = MtRequest("httpprepaid", "123456", "Dart sample", "60123456789",
      "Dart sample using HTTP POST & GET", "1", "0", "", "json");

  sendSmsUsingGet(req);
}

void sendSmsUsingPost(MtRequest req) {
  print("Executing POST request..");
}

void sendSmsUsingGet(MtRequest req) async {
  print("Executing GET request..");

  try {
    //var resp = await api.sendGetAsync(baseUrl);
    //var jsonResp = await resp.toJsonString();
    print("RESULT =");
    //print(jsonResp);
    print("OK");
  } catch (e) {
    print("GET exception =");
    print(e);
  }
}
