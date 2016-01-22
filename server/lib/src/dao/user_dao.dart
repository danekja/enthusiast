/*
 * Copyright (c) 2015. Jakub Danek
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
 *  To view a copy of this license, visit
 *   http://creativecommons.org/licenses/by-nc-sa/4.0/.
 */

library enthusiast.dao.user;

import 'package:enthusiast-server/src/model/user.dart';
import 'package:darthusiast/dao/generic_dao.dart';
import 'dart:async';

/// Interface specification for User entity DAO.
abstract class UserDao extends GenericDao<User, String> {

  /// Returns user instance associated with the username or null if not found.
  Future<User> findByUsername(String username);
}

/// MongoDb implementation of the UserDao and UserProvider interfaces.
class UserDaoMongo extends GenericDaoMongo<User, String> implements UserDao {

  UserDaoMongo():super("users") {}


  Future<User> findByUsername(String username) {
    return super.findOne({"username" : username});
  }

}