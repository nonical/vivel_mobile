import 'package:vivel_mobile/models/FAQ.dart';

import 'APIService.dart';

class FAQService {
  static Future<List<FAQ>> Get() async {
    var faqs = await APIService.Get("faq", {'answered': 'true'});
    if (faqs != null) {
      return faqs.map((x) => FAQ.fromJson(x)).toList();
    }
    return <FAQ>[];
  }
}
