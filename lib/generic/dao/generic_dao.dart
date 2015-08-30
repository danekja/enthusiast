/*
 * Copyright (c) 2015. Jakub Danek
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
 *  To view a copy of this license, visit
 *   http://creativecommons.org/licenses/by-nc-sa/4.0/.
 */

///Library with generic dao classes.
library common.dao;

import 'package:redstone_mapper_mongo/service.dart';
import 'package:redstone_mapper_mongo/manager.dart';
import 'dart:async';

/// Generic interface providing basic CRUD operations.
abstract class GenericDao<E, PK> {
  /// Returns the entity identified by the primary key or null if not found.
  Future<E> get(PK id);
  /// Persists the entity and returns the newly persisted instance.
  Future<E> save(E newInstance);
  /// Returns all existing entities.
  Future<List<E>> findAll();
  /// Removes the entity with given primary key or does nothing if not found.
  void delete(PK id);
}

/// Implementation of the GenericDao from MongoDb.
class GenericDaoMongo<E, PK> extends MongoDbService<E> implements GenericDao<E, PK> {

  /// Constructor used with Redstone.dart dependency injection.
  ///
  /// Expects only [collection] name for the given entity.
  GenericDaoMongo(String collection) : super(collection);

  /// Constructor expecting MongoDB [connection] instance and entity's [collection] name.
  GenericDaoMongo.fromConnection(MongoDb connection, String collection) : super.fromConnection(connection, collection);

  Future<E> get(PK id) {
    return super.findOne({"_id" : id});
  }

  Future<List<E>> findAll() {
    return super.find();
  }

  void delete(PK id) {
    super.remove({"_id" : id});
  }


}