/// Base class for all all client-side errors that can be generated by the app
sealed class AppException implements Exception {
  AppException(this.code, this.message);
  final String code;
  final String message;

  @override
  String toString() => message;
}

/// Auth

class ServerException extends AppException {
  ServerException({
    required String code,
    required String message,
  }) : super(code, message);
}

class EmailAlreadyInUseException extends AppException {
  EmailAlreadyInUseException()
      : super('email-already-in-use', 'Email already in use');
}

class WeakPasswordException extends AppException {
  WeakPasswordException() : super('weak-password', 'Password is too weak');
}

class WrongPasswordException extends AppException {
  WrongPasswordException() : super('wrong-password', 'Wrong password');
}

class InvalidCredentialsException extends AppException {
  InvalidCredentialsException()
      : super('invalid-credentials', 'Invalid credentials');
}

class UserNotFoundException extends AppException {
  UserNotFoundException() : super('user-not-found', 'User not found');
}

class UserNotSignedInException extends AppException {
  UserNotSignedInException()
      : super(
          'user-not-signed-in',
          'The operation can\'t be completed (not signed in)',
        );
}

/// Cart
class CartSyncFailedException extends AppException {
  CartSyncFailedException()
      : super('cart-sync-failed',
            'An error has occurred while updating the shopping cart');
}

/// Checkout
class PaymentFailureEmptyCartException extends AppException {
  PaymentFailureEmptyCartException()
      : super('payment-failure-empty-cart',
            'Can\'t place an order if the cart is empty');
}

// Products
class NullProductImageUrlException extends AppException {
  NullProductImageUrlException()
      : super(
            'user-not-signed-in', 'Can\'t upload a product with a null image');
}

/// Orders
class ParseOrderFailureException extends AppException {
  ParseOrderFailureException(this.status)
      : super('parse-order-failure', 'Could not parse order status: $status');
  final String status;
}
