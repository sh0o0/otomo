import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:otomo/domains/entities/changed_event.dart';
import 'package:otomo/domains/entities/date.dart';
import 'package:otomo/domains/entities/location.dart';
import 'package:otomo/domains/entities/message.dart';
import 'package:otomo/domains/entities/message_send_count.dart';
import 'package:otomo/grpc/generated/date.pb.dart' as grpc_date;
import 'package:otomo/grpc/generated/location.pb.dart' as grpc_loc;
import 'package:otomo/grpc/generated/message.pb.dart' as grpc_msg;
import 'package:otomo/grpc/generated/message_send_count.pb.dart' as grpc_count;

class ControllerConverter {
  ControllerConverter._();
  static final _instance = ControllerConverter._();
  static ControllerConverter get I => _instance;

  final message = _Message();
  final messageChunk = _MessageChunk();
  final changedEventType = _ChangedEventType();
  final messageSentCount = _MessageSentCount();
  final remainingMessageSendCount = _RemainingMessageSendCount();
}

class _Message {
  final _role = _Role();
  final _placeExtraction = _PlaceExtraction();

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
      placeExtraction: _placeExtraction.grpcToEntity(message.placeExtraction),
    );
  }

  TextMessage firestoreJsonToEntity(Map<String, dynamic> json) {
    final sentAt = (json['sent_at'] as Timestamp).toDate();
    json['sent_at'] = sentAt.toIso8601String();

    if (json['place_extraction'] == null) {
      json['place_extraction'] = {'places': []};
    }
    final placeExtraction = json['place_extraction'];
    if (placeExtraction['places'] == null) {
      placeExtraction['places'] = [];
    }
    if (placeExtraction['processed_at'] != null) {
      final processedAt =
          (placeExtraction['processed_at'] as Timestamp).toDate();
      placeExtraction['processed_at'] = processedAt.toIso8601String();
    }

    return TextMessage.fromJson(json);
  }
}

class _PlaceExtraction {
  final _extractedPlace = _ExtractedPlace();

  PlaceExtraction grpcToEntity(grpc_msg.PlaceExtraction placeEx) {
    return PlaceExtraction(
      places: _extractedPlace.grpcToEntityList(placeEx.places),
      processedAt:
          placeEx.hasProcessedAt() ? placeEx.processedAt.toDateTime() : null,
      error: placeEx.error.hasValue() ? placeEx.error.value : null,
    );
  }
}

class _ExtractedPlace {
  final _geocodedPlace = _GeocodedPlace();

  ExtractedPlace grpcToEntity(grpc_msg.ExtractedPlace place) {
    return ExtractedPlace(
      text: place.text,
      geocodedPlace: place.hasGeocodedPlace()
          ? _geocodedPlace.grpcToEntity(place.geocodedPlace)
          : null,
    );
  }

  List<ExtractedPlace> grpcToEntityList(List<grpc_msg.ExtractedPlace> locs) =>
      locs.map((e) => grpcToEntity(e)).toList();
}

class _GeocodedPlace {
  final _latLng = _LatLng();

  GeocodedPlace grpcToEntity(grpc_msg.GeocodedPlace place) {
    return GeocodedPlace(
      googlePlaceId: place.googlePlaceId,
      latLng: _latLng.grpcToEntity(place.latLng),
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

class _MessageSentCount {
  final _monthlySurplus = _MonthlySurplusMessageSentCount();
  final _daily = _DailyMessageSentCount();

  MessageSentCount grpcToEntity(grpc_count.MessageSentCount count) {
    return MessageSentCount(
      monthlySurplus: _monthlySurplus.grpcToEntity(count.monthlySurplus),
      daily: _daily.grpcToEntity(count.daily),
    );
  }
}

class _MonthlySurplusMessageSentCount {
  final _yearMonth = _YearMonth();

  MonthlySurplusMessageSentCount grpcToEntity(
      grpc_count.MonthlySurplusMessageSentCount count) {
    return MonthlySurplusMessageSentCount(
      yearMonth: _yearMonth.grpcToEntity(count.yearMonth),
      count: count.count,
    );
  }
}

class _DailyMessageSentCount {
  final _date = _Date();

  DailyMessageSentCount grpcToEntity(grpc_count.DailyMessageSentCount count) {
    return DailyMessageSentCount(
      date: _date.grpcToEntity(count.date),
      count: count.count,
    );
  }
}

class _RemainingMessageSendCount {
  final _monthlySurplus = _RemainingMonthlySurplusMessageSendCount();
  final _daily = _RemainingDailyMessageSendCount();

  RemainingMessageSendCount grpcToEntity(
      grpc_count.RemainingMessageSendCount count) {
    return RemainingMessageSendCount(
      monthlySurplus: _monthlySurplus.grpcToEntity(count.monthlySurplus),
      daily: _daily.grpcToEntity(count.daily),
    );
  }
}

class _RemainingMonthlySurplusMessageSendCount {
  final _yearMonth = _YearMonth();

  RemainingMonthlySurplusMessageSendCount grpcToEntity(
      grpc_count.RemainingMonthlySurplusMessageSendCount count) {
    return RemainingMonthlySurplusMessageSendCount(
      yearMonth: _yearMonth.grpcToEntity(count.yearMonth),
      count: count.count,
    );
  }
}

class _RemainingDailyMessageSendCount {
  final _date = _Date();

  RemainingDailyMessageSendCount grpcToEntity(
      grpc_count.RemainingDailyMessageSendCount count) {
    return RemainingDailyMessageSendCount(
      date: _date.grpcToEntity(count.date),
      count: count.count,
    );
  }
}

class _Date {
  Date grpcToEntity(grpc_date.Date date) {
    return Date(year: date.year, month: date.month, day: date.day);
  }
}

class _YearMonth {
  YearMonth grpcToEntity(grpc_date.YearMonth yearMonth) {
    return YearMonth(year: yearMonth.year, month: yearMonth.month);
  }
}
