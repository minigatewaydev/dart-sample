import 'Mt.dart';
import 'MtInfo.dart';

class MtResponse {
  final String username, chargingPlan, message;
  final bool isSuccess;
  final int creditDeducted;
  final MtInfo submitted;
  final List<Mt> mtList;

  MtResponse(this.username, this.chargingPlan, this.message, this.isSuccess,
      this.creditDeducted, this.submitted, this.mtList);
}
