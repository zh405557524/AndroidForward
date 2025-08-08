import '../models/user_model.dart';

class UserService {
  static UserModel? getUser() {
    return UserModel(name: "flutter_learner", email: "learner@flutter.dev");
  }
}
