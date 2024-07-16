class User {
  final String role;

  User(this.role);
}

class AuthService {
  User? login(String email, String password) {
    // Your login logic here
    // Return User instance if successful, null otherwise
    // Example:
    if (email == 'admin@gmail.com' && password == 'admin123') {
      return User('admin');
    } else if (email == 'user' && password == 'user123') {
      return User('user');
    }
    return null;
  }

  bool isAdmin(User user) {
    return user.role == 'admin';
  }

  static void logout() {}

  static void signOut() {}
}