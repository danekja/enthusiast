/*
 * Copyright (c) 2016. Jakub Danek
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
 *  To view a copy of this license, visit
 *   http://creativecommons.org/licenses/by-nc-sa/4.0/.
 */

library enthusiast.model.user;

import 'package:redstone_mapper/mapper.dart';
import 'package:darthusiast/types/types.dart';
import 'package:redstone_mapper_mongo/metadata.dart';

///Entity representing application's user.
class User extends Schema {

  ///Primary key
  @Id()
  String id;

  ///Unique, primary email, serves as username.
  @Field()
  @Email()
  @NotEmpty()
  String username;

  ///User's name
  @Field()
  @NotEmpty()
  String name;

  ///Represent's user's password.
  ///
  /// When retrieved from persistence, this should be its hashed value.
  @Field()
  @NotEmpty()
  String password;

  /// Set of user's roles.
  @Field()
  Set<String> roles;

  /// Empty constructor
  User();

  /// Constructor initializing all fields.
  User.full(this.id, this.username, this.name, this.password);

  /// Constructor for initialization of User object from JSON document.
  User.fromJson(Map map) : this.full(map["id"], map['email'], map['name'],map['password']);

}