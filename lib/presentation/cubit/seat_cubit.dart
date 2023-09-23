import 'package:flutter_bloc/flutter_bloc.dart';

class SeatCubit extends Cubit<List<String>> {
  SeatCubit() : super([]);

  void selectSeat(String id) {
    !isSelected(id) ? state.add(id) : state.remove(id);
    print(state);
    emit(List.from(state));
  }

  bool isSelected(String id) {
    int index = state.indexOf(id);
    return index == -1 ? false : true;
  }
}
