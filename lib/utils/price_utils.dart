import 'package:intl/intl.dart';

class PriceUtils {
  static convertPriceBRL(num price) {
    var f;
    if (price == null || price == 0.0) {
      f = new NumberFormat("##0.00", "pt_BR");
    } else {
      f = new NumberFormat("###.0#", "pt_BR");
    }

    return f.format(price ?? 0.0);
  }
}
