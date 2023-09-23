// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:airplane_booking_app/data/datasources/remote_datasource/destination_datasource.dart';
import 'package:airplane_booking_app/data/models/destination_model.dart';

part 'destination_event.dart';
part 'destination_state.dart';

class DestinationBloc extends Bloc<DestinationEvent, DestinationState> {

  final DestinationDatasource datasource;
  DestinationBloc(
    this.datasource,
  ) : super(DestinationInitial()) {
    on<GetDestinationEvent>((event, emit) async {
      emit(DestinationLoading());
      final result = await datasource.getAllDestination();
      emit(DestinationLoaded(destination: result));
    });
  }
}
