import 'package:get_it/get_it.dart';

import 'counterState.dart';

final getIt = GetIt.instance;

void InitGetIt() {
  getIt.registerSingleton<counterState>(counterState());

// Alternatively you could write it if you don't like global variables
  // GetIt.I.registerSingleton<AppModel>(AppModel());
}
