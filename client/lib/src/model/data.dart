/*
 * Copyright (c) 2015. Jakub Danek
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
 *  To view a copy of this license, visit
 *   http://creativecommons.org/licenses/by-nc-sa/4.0/.
 */

import 'package:redstone_mapper/mapper.dart';
import 'package:darthusiast/types/types.dart';
import 'package:polymer/polymer.dart';

abstract class BaseObject extends Schema with JsProxy {
  ///Primary key
  @Field()
  @NotEmpty()
  String id;


  BaseObject();

  BaseObject.full(this.id);


}

///Entity representing application's user.
class User extends BaseObject {



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
  User.full(String id, this.username, this.name, this.password) : super.full(id);

  /// Constructor for initialization of User object from JSON document.
  User.fromJson(Map map) : this.full(map["id"], map['email'], map['name'],map['password']);

}

class Author extends BaseObject {

  String firstName;
  String lastName;
  String description;

}

class Event extends JsProxy  {

  @reflectable String name;
  @reflectable String description;

  DateTime startDate;
  DateTime endDate;

  Event(this.name, this.description);

}

class Topic extends BaseObject {

  @Field()
  @NotEmpty()
  String title;

  @Field()
  @NotEmpty()
  String description;

  @Field()
  @NotEmpty()
  Author author;

}