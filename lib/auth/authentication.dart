/*
 * Copyright (c) 2015. Jakub Danek
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
 *  To view a copy of this license, visit
 *   http://creativecommons.org/licenses/by-nc-sa/4.0/.
 *
 *  Based on http://redstonedart.org/2014/07/18/authentication-and-authorization/
 */

/// Library providing basic user authentication functionality.
/// Authentication mechanism is inspired by Java Spring Security.
library authentication;

import 'package:redstone/server.dart' as app;
import 'dart:async';

/* ##################### CONSTANTS ##########################*/

///Name of session attribute used for storing current user instance
const _SESSION_USER = "user";

///Interface that should be implemented by class representing users.
abstract class UserDetails {
  ///Display attribute for the user (e.g. full name)
  String getUserDescription();
  ///Set of roles associated with the user
  Set<String> getRoles();
}

/*########################## CLASSES ######################*/

///Interface of a provider accessing user repository. Used by authentication mechanism
///to retrieve user based on username and password.
///
/// Most likely you want your user dao to implement this.
abstract class UserProvider {
  ///Finds user instance based on [username] and plaintext [password]
  ///value.
  ///
  /// * Returns found UserDetails instance if found or null otherwise.
  /// * Returns null if either of the arguments is null.
  Future<UserDetails> findUser(String username, String password);
}

///Class representing result of the authentication effort.
class AuthenticationResult {
  ///Error message associated with invalid credentials authentication failure.
  static const INVALID_CREDENTIALS = "INVALID CREDENTIALS";

  ///True if the authentication was successful.
  bool success;
  ///Error message associated with the authentication failure. Null if success.
  String error;

  ///Flexible constructor allowing setup of both attributes.
  AuthenticationResult(this.success, this.error);
  ///Constructor for successful authentication result.
  AuthenticationResult.ok() : this.success = true;
  ///Constructor for authentication result denoting failure.
  AuthenticationResult.fail(String err) : this(false, err);
}

/*###################  FUNCTIONS ######################*/

/// Function which authenticates user within the application.
///
/// Expects 3 parameters:
/// * [provider] UserProvider instance for access to user repository
/// * [username] user's username
/// * [password] user's plaintext password
///
/// Returns Future<AuthenticationResult>.
Future<AuthenticationResult> authorize(UserProvider provider, String username, String password) {
  if (username == null || password == null) {
    return new Future(() => new AuthenticationResult.fail(AuthenticationResult.INVALID_CREDENTIALS));
  }

  //get password value stored in the repository
  var pass = encodePassword(password);

  return provider.findUser(username, pass)
                  .then((user) {
                    if (user == null) {
                      return new AuthenticationResult.fail(AuthenticationResult.INVALID_CREDENTIALS);
                    }

                    var session = app.request.session;
                    session[_SESSION_USER] = user;

                    return new AuthenticationResult.ok();
                  });
}

///Log's out the current user.
void logout() {
  var session = app.request.session;
  session[_SESSION_USER] = null;
}

///Return currently logged-in user or null if guest.
UserDetails getCurrentUser() {
  var session = app.request.session;
  return session[_SESSION_USER];
}

///Returns true if the user is not logged-in.
bool isGuest() {
  return getCurrentUser() == null;
}

///Takes a plaintext [password] and returns its hash.
String encodePassword(String password) {
  //TODO implement password hashing
  return password.trim();
}