import 'models/MtRequest.dart';

var baseUrl = "http://162.253.16.28:5010/api/send";

void main(List<String> args) {
/* 
 * Change according to your own data
 * for username & password. If you set 'dlrMask' to 1, 
 * please specify the 'dlrUrl'
 */
  var req = MtRequest("httpprepaid", "123456", "Dart sample", "60123456789",
      "Dart sample using HTTP POST & GET", "1", "0", "", "json");

  print(req.toJson());
}

void sendSmsUsingPost() {
  print("Executing POST request..");
}

void sendSmsUsingGet() {
  print("Executing GET request..");
}
