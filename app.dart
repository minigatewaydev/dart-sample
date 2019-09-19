import 'dart:core';
import 'dart:async';
import 'models/MtRequest.dart';
import 'core/RestApiSender.dart' as api;

var baseUrl = "http://162.253.16.28:5010/api/send";

Future main(List<String> args) async {
  /* 
   * Change according to your own data
   * for username & password. If you set 'dlrMask' to 1, 
   * please specify the 'dlrUrl'
   */
  var req = MtRequest("YOUR_USERNAME", "YOUR_PASSWORD", "Dart sample", "60123456789",
      "Dart sample using HTTP POST & GET", "1", "0", "YOUR_DLR_URL", "json");

/* Change 'type' between 1 - 2 to switch result
 * 1 = Send using POST
 * 2 = Send using GET
 */
  var type = 2;
  switch (type) {
    case 1:
      await sendSmsUsingPostAsync(req);
      break;
    case 2:
      await sendSmsUsingGet(req);
      break;
  }
}

Future sendSmsUsingPostAsync(MtRequest req) async {
  print("Executing POST request..");
  try {
    var sw = Stopwatch();
    sw.start();

    var resp = await api.postAsync(req, baseUrl);
    var jsonResp = resp.toJson();

    sw.stop();
    print("RESULT =");
    print(jsonResp);
    print("Time taken: ${sw.elapsed}");
  } catch (e) {
    print("POST Exception =");
    print(e);
  }
}

Future sendSmsUsingGet(MtRequest req) async {
  print("Executing GET request..");
  try {
    var sw = Stopwatch();
    sw.start();

    var from = Uri.encodeFull(req.from);
    var to = Uri.encodeFull(req.to);
    var text = Uri.encodeFull(req.text);

    var url =
        "${baseUrl}?gw-username=${req.username}&gw-password=${req.password}&gw-from=${from}&gw-to=${to}" +
            "&gw-text=${text}&gw-coding=${req.coding}&gw-dlr-mask=${req.dlrUrl}&gw-dlr-url=${req.dlrUrl}&gw-resp-type=${req.responseType}";

    var resp = await api.getAsync(url);
    var jsonResp = resp.toJson();
    sw.stop();
    print("RESULT =");
    print(jsonResp);
    print("Time taken: ${sw.elapsed}");
  } catch (e) {
    print("GET exception =");
    print(e);
  }
}
