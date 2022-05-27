import 'package:bloc/bloc.dart';
import '../services/destination_services.dart';
import '../../models/destination_model.dart';
import 'package:equatable/equatable.dart';

part 'destination_state.dart';

class DestinationCubit extends Cubit<DestinationState> {
  DestinationCubit() : super(DestinationInitial());

  void fetchDestinations() async {
    try {
      emit(DestinationLoading());
      List<DestinationModel> destinations =
          await DestinationServices().fetchDestinations();
      emit(DestinationSuccess(destinations));
    } catch (e) {
      emit(DestinationFailed(e.toString()));
    }
  }
}
