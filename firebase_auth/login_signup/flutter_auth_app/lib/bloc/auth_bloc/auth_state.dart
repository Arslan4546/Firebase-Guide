import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

/// Initial state before any check
class AuthInitial extends AuthState {
  const AuthInitial();
}

/// Auth operation in progress (loading spinner)
class AuthLoading extends AuthState {
  const AuthLoading();
}

/// User is signed in
class AuthAuthenticated extends AuthState {
  final User user;

  const AuthAuthenticated({required this.user});

  @override
  List<Object?> get props => [user.uid];
}

/// User is not signed in
class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}

/// An auth operation failed
class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});

  @override
  List<Object?> get props => [message];
}
