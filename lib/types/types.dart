/*
 * Copyright (c) 2015. Jakub Danek
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
 *  To view a copy of this license, visit
 *   http://creativecommons.org/licenses/by-nc-sa/4.0/.
 */

library common_types;
import 'package:redstone_mapper/mapper.dart';

/// Redstone validation rule for emails.
class Email extends ValidationRule {
  static const String _reg = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static final RegExp _re = new RegExp(_reg);

  const Email() : super("email");

  bool validate(dynamic value) {
    if(value == null) {
      return true;
    }
    return _re.hasMatch(value);
  }

}