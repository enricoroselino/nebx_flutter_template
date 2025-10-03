abstract class IBiometric {
  Future<bool> get canAuthenticate;
  Future<bool> authenticate({String? reason});
}
