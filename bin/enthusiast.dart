/*
 * Copyright (c) 2015. Jakub Danek
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
 *  To view a copy of this license, visit
 *   http://creativecommons.org/licenses/by-nc-sa/4.0/.
 */

library enthusiast;


//routes import for scanning
import '../lib/server/user_service.dart';

//real imports
import 'package:redstone_mapper/plugin.dart' as mapper;
import 'package:redstone_mapper_mongo/manager.dart' as mongo;
import 'package:redstone/server.dart' as app;
import 'package:di/src/module.dart';
import 'package:enthusiast/server/src/dao/user_dao.dart';
import 'package:enthusiast/generic/auth/authentication.dart' as auth;

var _userDao = new UserDaoMongo();

/// Dependency injection initialization
_injectDependencies() {
  app.addModule(new Module()
    ..bind(UserDao, toValue: _userDao)
    ..bind(auth.UserProvider, toValue: _userDao));
}

/// Initialization of Redstone's plugins.
_setupPlugins() {
  var dbManager = new mongo.MongoDbManager("mongodb://localhost/dbname", poolSize: 3);
  app.addPlugin(mapper.getMapperPlugin(dbManager));
}


/// Starts the server application.
main() {

  _injectDependencies();

  _setupPlugins();

  app.setupConsoleLog();
  app.start();
}
