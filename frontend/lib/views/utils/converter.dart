import 'package:flutter_chat_types/flutter_chat_types.dart' as chat;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:otomo/entities/lat_lng.dart';
import 'package:otomo/entities/place.dart';
import 'package:otomo/view_models/boundary/chat.dart';

class ViewConverter {
  ViewConverter._();
  static final _instance = ViewConverter._();
  static ViewConverter get I => _instance;

  final latLng = _LatLng();
  final message = _Message();
  final placeAndMarker = _PlaceAndMarker();
}

class _LatLng {
  LatLng entityToViewForGoogle(AppLatLng ll) =>
      LatLng(ll.latitude, ll.longitude);
}

class _Message {
  final _messageStatus = _MessageStatus();

  MessageData viewToData(chat.Message message) => MessageData(
        id: message.id,
        author: Author(id: message.author.id),
        sentAt: DateTime.fromMillisecondsSinceEpoch(message.createdAt!),
        remoteId: message.remoteId,
        status: _messageStatus.viewToData(message.status!),
        active: message.metadata?['active'] == true,
      );

  List<chat.TextMessage> textDataToViewList(
    List<TextMessageData> messages,
  ) =>
      messages.map(textDataToView).toList();

  chat.TextMessage textDataToView(
    TextMessageData textMessage,
  ) =>
      chat.TextMessage(
        id: textMessage.message.id,
        text: textMessage.text,
        author: chat.User(id: textMessage.message.author.id),
        remoteId: textMessage.message.remoteId,
        createdAt: textMessage.message.sentAt.millisecondsSinceEpoch,
        status: _messageStatus.dataToView(textMessage.message.status),
        metadata: {'active': textMessage.message.active},
      );
}

class _MessageStatus {
  chat.Status dataToView(MessageStatus status) {
    switch (status) {
      case MessageStatus.sent:
        return chat.Status.sent;
      case MessageStatus.sending:
        return chat.Status.sending;
      case MessageStatus.error:
        return chat.Status.error;
    }
  }

  MessageStatus viewToData(chat.Status status) {
    switch (status) {
      case chat.Status.sent:
        return MessageStatus.sent;
      case chat.Status.sending:
        return MessageStatus.sending;
      case chat.Status.error:
        return MessageStatus.error;
      default:
        throw Exception('Unknown status: $status');
    }
  }
}

class _PlaceAndMarker {
  List<Marker> placesToMarkerList(List<Place> places) =>
      places.map(placeToMarker).toList();

  Marker placeToMarker(Place place) => Marker(
        markerId: MarkerId(place.name),
        position: ViewConverter.I.latLng.entityToViewForGoogle(place.latLng),
        infoWindow: InfoWindow(
          title: place.name,
          snippet: place.latLng.toString(),
        ),
      );
}
