import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:otomo/entities/changed_event.dart';
import 'package:otomo/entities/lat_lng.dart';
import 'package:otomo/entities/location.dart';
import 'package:otomo/entities/message.dart';
import 'package:otomo/grpc/generated/location.pb.dart' as grpc_loc;
import 'package:otomo/grpc/generated/message.pb.dart' as grpc_msg;

class ControllerConverter {
  ControllerConverter._();
  static final _instance = ControllerConverter._();
  static ControllerConverter get I => _instance;

  final message = _Message();
  final messageChunk = _MessageChunk();
  final changedEventType = _ChangedEventType();
}

class _Message {
  final _role = _Role();
  final _locationAnalysis = _LocationAnalysis();

  List<TextMessage> grpcToEntityList(List<grpc_msg.Message> messages) {
    return messages.map((e) => grpcToEntity(e)).toList();
  }

  TextMessage grpcToEntity(grpc_msg.Message message) {
    return TextMessage(
      id: message.id,
      text: message.text,
      role: _role.grpcToEntity(message.role),
      sentAt: message.sentAt.toDateTime(),
      clientId: message.clientId.hasValue() ? message.clientId.value : null,
      locationAnalysis:
          _locationAnalysis.grpcToEntity(message.locationAnalysis),
    );
  }

  TextMessage firestoreJsonToEntity(Map<String, dynamic> json) {
    final sentAt = (json['sent_at'] as Timestamp).toDate();
    json['sent_at'] = sentAt.toIso8601String();

    if (json['location_analysis'] == null) {
      json['location_analysis'] = {
        'locations': [],
        'analyzed_at': null,
      };
    }
    final locationAnalysis = json['location_analysis'];
    if (locationAnalysis['locations'] == null) {
      locationAnalysis['locations'] = [];
    }
    if (locationAnalysis['analyzed_at'] != null) {
      final analyzedAt =
          (locationAnalysis['analyzed_at'] as Timestamp).toDate();
      locationAnalysis['analyzed_at'] = analyzedAt.toIso8601String();
    }

    return TextMessage.fromJson(json);
  }
}

class _LocationAnalysis {
  final _analyzedLocation = _AnalyzedLocation();

  LocationAnalysis grpcToEntity(grpc_msg.LocationAnalysis analysis) {
    return LocationAnalysis(
        locations: _analyzedLocation.grpcToEntityList(analysis.locations),
        analyzedAt:
            analysis.hasAnalyzedAt() ? analysis.analyzedAt.toDateTime() : null);
  }
}

class _AnalyzedLocation {
  final _location = _Location();

  AnalyzedLocation grpcToEntity(grpc_msg.AnalyzedLocation loc) {
    return AnalyzedLocation(
        text: loc.text, location: _location.grpcToEntity(loc.location));
  }

  List<AnalyzedLocation> grpcToEntityList(
          List<grpc_msg.AnalyzedLocation> locs) =>
      locs.map((e) => grpcToEntity(e)).toList();
}

class _Location {
  final _geometry = _Geometry();

  Location grpcToEntity(grpc_loc.Location location) {
    return Location(
      googlePlaceId: location.googlePlaceId,
      address: location.address,
      longName: location.longName,
      shortName: location.shortName,
      types: location.types,
      geometry: _geometry.grpcToEntity(location.geometry),
    );
  }
}

class _Geometry {
  final _latLng = _LatLng();

  Geometry grpcToEntity(grpc_loc.Geometry geometry) {
    return Geometry(
      latLng: _latLng.grpcToEntity(geometry.latLng),
    );
  }
}

class _LatLng {
  AppLatLng grpcToEntity(grpc_loc.LatLng latLng) {
    return AppLatLng(latitude: latLng.latitude, longitude: latLng.longitude);
  }
}

class _MessageChunk {
  final _role = _Role();

  TextMessageChunk grpcToEntity(grpc_msg.MessageChunk chunk) {
    return TextMessageChunk(
      messageId: chunk.messageId,
      text: chunk.text,
      role: _role.grpcToEntity(chunk.role),
      sentAt: chunk.sentAt.toDateTime(),
      clientId: chunk.clientId.hasValue() ? chunk.clientId.value : null,
      isLast: chunk.isLast,
    );
  }
}

class _ChangedEventType {
  ChangedEventType firestoreToEntity(DocumentChangeType type) {
    switch (type) {
      case DocumentChangeType.added:
        return ChangedEventType.added;
      case DocumentChangeType.modified:
        return ChangedEventType.modified;
      case DocumentChangeType.removed:
        return ChangedEventType.removed;
    }
  }
}

class _Role {
  Role grpcToEntity(grpc_msg.Role role) {
    switch (role) {
      case grpc_msg.Role.USER:
        return Role.user;
      case grpc_msg.Role.OTOMO:
        return Role.otomo;
      default:
        throw Exception('Unknown role: $role');
    }
  }
}
