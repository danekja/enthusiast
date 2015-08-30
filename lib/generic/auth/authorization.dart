/*
 * Copyright (c) 2015. Jakub Danek
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
 *  To view a copy of this license, visit
 *   http://creativecommons.org/licenses/by-nc-sa/4.0/.
 *
 *   Based on http://redstonedart.org/2014/07/18/authentication-and-authorization/
 */

///Library providing role-based request authorization mechanism.
library authorization;

import 'package:redstone/server.dart' as app;
import 'package:enthusiast/generic/auth/authentication.dart' as auth;

///Annotation for securing routes. Takes role name as argument.
class Secure {
  ///Role allowed to proceed with the action.
  //TODO implement support for multiple allowed roles.
  final String role;

  const Secure(this.role);

}

///Redstone.dart plugin for route authentication
void AuthorizationPlugin(app.Manager manager) {

  manager.addRouteWrapper(Secure, (metadata, pathSegments, injector, request, route) {

    String role = (metadata as Secure).role;
    Set userRoles = auth.getCurrentUser().getRoles();
    if (!userRoles.contains(role)) {
      throw new app.ErrorResponse(403, {"error": "NOT_AUTHORIZED"});
    }

    return route(pathSegments, injector, request);

  }, includeGroups: true);

}