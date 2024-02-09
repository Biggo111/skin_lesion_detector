import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skin_lesion_detector/utils/states/base_state.dart';

final homeControllerProvider = StateNotifierProvider<HomeController, BaseState>((ref) {
  return HomeController(ref: ref);
});

class HomeController extends StateNotifier<BaseState>{
  final Ref? ref;
  HomeController({this.ref}) : super(const InitialState());

}