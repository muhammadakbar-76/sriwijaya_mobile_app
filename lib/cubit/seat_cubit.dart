import 'package:bloc/bloc.dart';

class SeatCubit extends Cubit<List<String>> {
  SeatCubit() : super([]);

  void selectSeat(String id) {
    List<String> newState = [...state];
    if (state.contains(id)) {
      newState.remove(id);
    } else {
      newState.add(id);
    }
    emit(newState); //or you can you use List.from(state) to make new instance
  }

  void setInit() {
    emit([]);
  }
}
