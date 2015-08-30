/*
 * Copyright (c) 2015. Jakub Danek
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
 *  To view a copy of this license, visit
 *   http://creativecommons.org/licenses/by-nc-sa/4.0/.
 */

/// Web service for actions related to User and authentication.
library enthusiast.service.user;

import 'package:enthusiast/common/model/user.dart';
import 'package:enthusiast/server/src/dao/user_dao.dart';
import 'package:redstone/server.dart' as app;
import 'dart:async';
import 'package:redstone_mapper/plugin.dart';
import 'package:enthusiast/generic/auth/authentication.dart' as auth;
import 'package:redstone/query_map.dart';
import 'package:enthusiast/generic/auth/authorization.dart' as sec;

/*################### CONSTANTS ##########################*/

/// Grouping class containing role constants available for this application
abstract class Roles {
  static const USER = "ROLE_USER";
  static const ADMIN = "ROLE_ADMIN";
}

/*#################### EXCEPTIONS ############################*/

/// Exception thrown when an attempt is made to register new user
/// with a username already taken, or to register a user twice.
class UserAlreadyExistsError extends StateError {

  UserAlreadyExistsError(String msg) : super(msg);
}

/*#################### ROUTES ###############################*/

/// Routing group for "users" resource.
@app.Group("/users")
class UserService {
  UserDao _userDao; // injected by dependency manager

  UserService(this._userDao);

  /// Takes [user] instance and, if new, registers it within the application.
  /// Raises [UserAlreadyExistsError] exception otherwise.
  ///
  /// Two main reasons are a possible cause of the exception:
  /// * [user].id is not null
  /// * [user].username is already taken
  ///
  /// Clients should therefore always check for the exception when calling this service.
  @app.DefaultRoute(methods: const [app.POST])
  Future<User> registerUser(@Decode() User user) async {
    var err = user.validate();
    if(err != null) {
      print(err.invalidFields);
    }

    if (user.id != null) {
      throw new UserAlreadyExistsError("Id is not null!");
    }

    var old = _userDao.findByUsername(user.username);
    if(old != null) {
      throw new UserAlreadyExistsError("Username already taken");
    }

    user.password = auth.encodePassword(user.password);

    return _userDao.save(user);
  }

  /// Service endpoint for updating existing user instances.
  ///
  /// [id] attribute of the [user] must not be null.
  @app.Route(":id", methods: const [app.PUT])
  Future<User> save(@Decode() User user) async {
    if (user.id == null) {
      return null;
    }

    var err = user.validate();
    if(err != null) {
      print(err.invalidFields);
    }

    User old = await _userDao.get(user.id);

    bool passwordChanged = old.password != user.password;


    if (passwordChanged) {
      user.password = auth.encodePassword(user.password);
    }

    return _userDao.save(user);
  }

  /// Returns list of all user's registered in the application.
  @app.DefaultRoute(methods: const [app.GET])
  @Encode()
  @sec.Secure(Roles.ADMIN)
  Future<List<User>> listUsers() {
    return _userDao.findAll();
  }

}

/// Attempts user authentication based on given credentials.
///
/// Returns true on success, false otherwise.
@app.Route("login", methods: const [app.POST])
Future<bool> login(@app.Inject() auth.UserProvider provider, @app.Body(app.JSON) QueryMap body) async {
  var res = await auth.authorize(provider, body.username, body.password);

  return res.success;
}


/// Logs out the current user.
@app.Route("logout", methods: const [app.GET])
void logout() {
  auth.logout();
}