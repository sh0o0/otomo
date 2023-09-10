import 'package:flutter_chat_types/flutter_chat_types.dart' as chat;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:otomo/entities/lat_lng.dart';
import 'package:otomo/entities/message.dart';

class Converter {
  Converter._();

  static LatLng latLngToGoogle(AppLatLng ll) =>
      LatLng(ll.latitude, ll.longitude);

  static chat.User roleToChatUser(Role role) => chat.User(id: role.toString());
}
