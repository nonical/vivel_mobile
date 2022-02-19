import 'package:vivel_mobile/models/faq.dart';

import 'api_service.dart';

class FAQService {
  static Future<List<FAQ>> Get() async {
    var faqs = await APIService.Get("faq", {'answered': 'true'});
    if (faqs != null) {
      return faqs.map((x) => FAQ.fromJson(x)).toList();
    }
    return <FAQ>[];
  }

  static Future<dynamic> Post(dynamic json) async {
    return APIService.Post("faq", json);
  }
}
