
part of 'login_bloc.dart';

class LoginState {
  final bool isLogin;

  LoginState(
    this.isLogin,
  );

  LoginState copyWith({
    bool? isLogin,
  }) {
    return LoginState(
      isLogin ?? this.isLogin,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'isLogin': isLogin});
  
    return result;
  }

  factory LoginState.fromMap(Map<String, dynamic> map) {
    return LoginState(
      map['isLogin'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginState.fromJson(String source) => LoginState.fromMap(json.decode(source));

  @override
  String toString() => 'LoginState(isLogin: $isLogin)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is LoginState &&
      other.isLogin == isLogin;
  }

  @override
  int get hashCode => isLogin.hashCode;
}

class LoginInitial extends LoginState {
  LoginInitial(super.isLoginfalse);
}
