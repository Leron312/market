import 'package:get_it/get_it.dart';
import 'package:market2/core/navigation/router.dart';

final getIt = GetIt.instance;

void initCoreModule(){
  
  getIt.registerSingleton(MarketRouter());
  
  
}