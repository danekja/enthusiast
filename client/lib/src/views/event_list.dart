/*
 * Copyright (c) 2016. Jakub Danek
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
 *  To view a copy of this license, visit
 *   http://creativecommons.org/licenses/by-nc-sa/4.0/.
 */

@HtmlImport("event_list.html")
library enthusiast.polymer.view.event.list;

import 'package:web_components/html_import_annotation.dart';
import 'package:polymer/polymer.dart';

import '../model/data.dart' show Event;
import '../components/event/event_card.dart';

const EVENT_LIST_TAG = "event-list";

@PolymerRegister(EVENT_LIST_TAG)
class EventList extends PolymerElement {

  @Property() List<Event> events;

  EventList.created() : super.created();

  ready() {
    set('events', fetchEvents());
  }


  List<Event> fetchEvents() {
    return [
      new Event("Piknick", "Příliš žlouťoučký kůň"),
      new Event("Lipsum", "Příliš žlouťoučký kůň"),
      new Event("Dolor", "Příliš žlouťoučký kůň"),
      new Event("Sit", "Příliš žlouťoučký kůň"),
      new Event("Amet", "Příliš žlouťoučký kůň")
    ];
  }

}