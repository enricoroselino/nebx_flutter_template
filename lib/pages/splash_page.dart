import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nebx_flutter_template/core/blocs/security_bloc.dart';
import 'package:nebx_flutter_template/core/blocs/security_event.dart';
import 'package:nebx_flutter_template/core/blocs/sercurity_state.dart';
import 'package:nebx_flutter_template/images.dart';
import 'package:nebx_flutter_template/infrastructure/interfaces/security_check.dart';
import 'package:nebx_flutter_template/setup_dependencies.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final securityCheck = loc.get<ISecurityCheck>();
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (_) => SecurityBloc(securityCheck)..add(CheckSecurityEvent()),
      child: BlocListener<SecurityBloc, SecurityState>(
        listener: (context, state) {
          if (state is SecuritySecure) {
            context.go("/home");
          } else if (state is SecurityInsecure) {
            context.go("/error");
          }
        },
        child: Scaffold(
          body: Center(
            child: Image.asset(
              Images.appLogo,
              width: size.width * 0.5,
              height: size.width * 0.5,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
