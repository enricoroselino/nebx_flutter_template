import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nebx_flutter_template/core/blocs/security_event.dart';
import 'package:nebx_flutter_template/core/blocs/sercurity_state.dart';
import 'package:nebx_flutter_template/infrastructure/interfaces/security_check.dart';

class SecurityBloc extends Bloc<SecurityEvent, SecurityState> {
  final ISecurityCheck _security;

  SecurityBloc(this._security) : super(SecurityInitial()) {
    on<CheckSecurityEvent>((event, emit) async {
      emit(SecurityLoading());

      final tasks = [
        _security.isEnvironmentSecure(),
        _security.isLocationSecure(),
      ];

      final results = await Future.wait(tasks);

      results.every((result) => result)
          ? emit(SecuritySecure())
          : emit(SecurityInsecure());
    });
  }
}
