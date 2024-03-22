abstract class AuthRepository {
  Future<String> verify(String username, String code);
}
