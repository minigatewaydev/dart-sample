import 'Mt.dart';

class MtResponse {
  final String username, chargingPlan, message;
  final int creditDeducted;
  final List<Mt> mtList;

  MtResponse(this.username, this.chargingPlan, this.message,
      this.creditDeducted, this.mtList);
}
