// Filename: data_provider.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' hide Category;
import '../service/http_service.dart';

class DataProvider extends ChangeNotifier {
  HttpService service = HttpService();

  DataProvider() {}
}
