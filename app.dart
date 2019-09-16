import 'dart:core';
import 'models/MtRequest.dart';
import 'core/RestApiSender.dart';

var baseUrl = "http://162.253.16.28:5010/api/send";
RestApiSender api = RestApiSender();

void main(List<String> args) async {
  /* 
   * Change according to your own data
   * for username & password. If you set 'dlrMask' to 1, 
   * please specify the 'dlrUrl'
   */
  var req = MtRequest("httpprepaid", "123456", "Dart sample", "60123456789",
      "Dart sample using HTTP POST & GET", "1", "0", "", "json");

/* Change 'type' between 1 - 2 to switch result
 * 1 = Send using POST
 * 2 = Send using GET
 */
  var type = 1;
  switch (type) {
    case 1:
      await sendSmsUsingPost(req);
      break;
    case 2:
      await sendSmsUsingGet(req);
      break;
  }
  //sendSmsUsingGet(req);
  await sendSmsUsingPost(req);
}

Future sendSmsUsingPost(MtRequest req) async {
  print("Executing POST request..");
  try {
    var resp = await api.sendPostAsync(req, baseUrl);
    print(resp.toJsonString());
    //print("async post");
  } catch (e) {}
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
