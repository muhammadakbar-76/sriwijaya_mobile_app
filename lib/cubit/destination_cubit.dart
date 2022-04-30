import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sriwijaya/models/destination_model.dart';
import 'package:sriwijaya/services/destination_service.dart';

part 'destination_state.dart';

class DestinationCubit extends Cubit<DestinationState> {
  DestinationCubit() : super(DestinationInitial());

  void fetchDestinations() async {
    try {
      emit(DestinationLoading());
      List<DestinationModel> destinations =
          await DestinationService().fecthDestinations();
      emit(DestinationSuccess(destinations));
    } catch (e) {
      emit(DestinationFailed(e.toString()));
    }
  }

  void reserveSeat({
    String destinationId = "",
    List<dynamic> seats = const [""],
  }) {
    try {
      DestinationService().reserveSeat(destinationId, seats);
      return;
    } catch (e) {
      rethrow;
    }
  }
}
