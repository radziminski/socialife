import 'package:socialife/services/api/api.utils.dart';
import 'package:socialife/services/api/entity/base.entity.dart';
import 'package:socialife/services/event/entity/event_like.entity.dart';
import 'package:socialife/services/ticket/entity/ticket_type.entity.dart';
import 'package:socialife/services/user/entity/organization_profile.entity.dart';
import 'package:socialife/types.dart';

enum EventCategory {
  music,
  popMusic,
  electronicMusic,
  rockMusic,
  classicalMusic,
  countryMusic,
  alternativeMusic,
  filmMusic,
  show,
  movies,
  other
}

class Event extends BaseEntity {
  late String title;
  late String? description;
  late DateTime startDate;
  late DateTime? endDate;
  late String? locationName;
  late String? locationRef;
  late String? longitude;
  late String? latitude;
  late bool isCanceled;
  late EventCategory category;
  bool isFull;
  late int likesNumber;
  late OrganizationProfile? createdBy;
  late List<TicketType> ticketTypes;
  late List<EventLike> likes;

  Event(Json json, {this.isFull = false}) : super(json) {
    title = json['title'];
    description = json['description'];
    startDate = parseDate(json['startDate']);
    endDate = parseNullableDate(json['endDate']);
    locationName = json['locationName'];
    locationRef = json['locationRef'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    isCanceled = json['isCanceled'] ?? false;
    category = getEventCategoryFromString(json['role']);
    likesNumber = json['likesNumber'];
    ticketTypes = [];
    likes = [];

    if (isFull) {
      createdBy = OrganizationProfile(json['createdBy']);
      ticketTypes = parseList(json['ticketTypes'], (json) => TicketType(json));
      likes = parseList(json['likes'], (json) => EventLike(json));
    }
  }
}

String getEventCategoryString(EventCategory category) {
  switch (category) {
    case EventCategory.music:
      return 'music';
    case EventCategory.popMusic:
      return 'pop-music';
    case EventCategory.electronicMusic:
      return 'electronic-music';
    case EventCategory.rockMusic:
      return 'rock-music';
    case EventCategory.classicalMusic:
      return 'classical-music';
    case EventCategory.countryMusic:
      return 'country-music';
    case EventCategory.alternativeMusic:
      return 'alternative-music';
    case EventCategory.filmMusic:
      return 'film-music';
    case EventCategory.show:
      return 'show';
    case EventCategory.movies:
      return 'movies';
    case EventCategory.other:
      return 'other';
  }
}

EventCategory getEventCategoryFromString(String category) {
  switch (category) {
    case 'music':
      return EventCategory.music;
    case 'pop_music':
      return EventCategory.popMusic;
    case 'electronic-music':
      return EventCategory.electronicMusic;
    case 'rock-music':
      return EventCategory.rockMusic;
    case 'classical-music':
      return EventCategory.classicalMusic;
    case 'country-music':
      return EventCategory.countryMusic;
    case 'alternative-music':
      return EventCategory.alternativeMusic;
    case 'film-music':
      return EventCategory.filmMusic;
    case 'show':
      return EventCategory.show;
    case 'movies':
      return EventCategory.movies;
    case 'other':
      return EventCategory.other;
    default:
      return EventCategory.other;
  }
}
