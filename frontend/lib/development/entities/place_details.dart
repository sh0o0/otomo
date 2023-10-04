import 'package:faker/faker.dart';
import 'package:otomo/entities/place_details.dart';
import 'package:otomo/tools/uuid.dart';

PlaceDetails newFakePlaceDetails() {
  return PlaceDetails(
    formattedAddress: faker.address.streetAddress(),
    formattedPhoneNumber: faker.phoneNumber.us(),
    name: faker.company.name(),
    rating: faker.randomGenerator.decimal(min: 1, scale: 5),
    types: [faker.lorem.word()],
    website: faker.internet.httpUrl(),
    photos: [
      newFakePlaceDetailsPhoto(),
      newFakePlaceDetailsPhoto(),
      newFakePlaceDetailsPhoto(),
      newFakePlaceDetailsPhoto(),
      newFakePlaceDetailsPhoto(),
    ],
    reviews: [
      newFakePlaceDetailsReview(),
      newFakePlaceDetailsReview(),
      newFakePlaceDetailsReview(),
      newFakePlaceDetailsReview(),
      newFakePlaceDetailsReview(),
    ],
    addressComponents: [
      newFakePlaceDetailsAddressComponent(),
      newFakePlaceDetailsAddressComponent(),
      newFakePlaceDetailsAddressComponent(),
      newFakePlaceDetailsAddressComponent(),
      newFakePlaceDetailsAddressComponent(),
    ],
    adrAddress: faker.address.streetAddress(),
    businessStatus: faker.lorem.word(),
    curbsidePickup: faker.randomGenerator.boolean(),
    editorialSummary: PlaceDetailsEditorialSummary(
      overview: faker.lorem.sentence(),
      language: faker.lorem.word(),
    ),
    internationalPhoneNumber: faker.phoneNumber.us(),
    currentOpeningHours: newFakePlaceDetailsOpeningHours(),
    utcOffset: faker.randomGenerator.integer(1000000000),
    vicinity: faker.address.streetAddress(),
    plusCode: PlaceDetailsPlusCode(
      compoundCode: faker.lorem.word(),
      globalCode: faker.lorem.word(),
    ),
    priceLevel: faker.randomGenerator.integer(5),
    permanentlyClosed: faker.randomGenerator.boolean(),
    delivery: faker.randomGenerator.boolean(),
    dineIn: faker.randomGenerator.boolean(),
    takeout: faker.randomGenerator.boolean(),
    geometry: PlaceDetailsGeometry(
      location: newFakePlaceDetailsLatLngLiteral(),
      viewport: PlaceDetailsBounds(
        northeast: newFakePlaceDetailsLatLngLiteral(),
        southwest: newFakePlaceDetailsLatLngLiteral(),
      ),
    ),
    icon: faker.image.image(),
    iconBackgroundColor: faker.color.color(),
    iconMaskBaseUri: faker.internet.httpUrl(),
    openingHours: newFakePlaceDetailsOpeningHours(),
    reference: faker.lorem.word(),
    reservable: faker.randomGenerator.boolean(),
    scope: faker.lorem.word(),
    secondaryOpeningHours: [
      newFakePlaceDetailsOpeningHours(),
      newFakePlaceDetailsOpeningHours(),
      newFakePlaceDetailsOpeningHours(),
      newFakePlaceDetailsOpeningHours(),
      newFakePlaceDetailsOpeningHours(),
    ],
    servesBeer: faker.randomGenerator.boolean(),
    servesBreakfast: faker.randomGenerator.boolean(),
    servesBrunch: faker.randomGenerator.boolean(),
    servesDinner: faker.randomGenerator.boolean(),
    servesLunch: faker.randomGenerator.boolean(),
    servesVegetarianFood: faker.randomGenerator.boolean(),
    servesWine: faker.randomGenerator.boolean(),
    userRatingsTotal: faker.randomGenerator.integer(1000000000),
    url: faker.internet.httpUrl(),
    wheelchairAccessibleEntrance: faker.randomGenerator.boolean(),
    placeId: uuid(),
  );
}

PlaceDetailsLatLngLiteral newFakePlaceDetailsLatLngLiteral() {
  return PlaceDetailsLatLngLiteral(
    lat: faker.randomGenerator.decimal(),
    lng: faker.randomGenerator.decimal(),
  );
}

PlaceDetailsAddressComponent newFakePlaceDetailsAddressComponent() {
  return PlaceDetailsAddressComponent(
    longName: faker.address.streetAddress(),
    shortName: faker.address.streetAddress(),
    types: [faker.lorem.word()],
  );
}

PlaceDetailsReview newFakePlaceDetailsReview() {
  return PlaceDetailsReview(
    authorName: faker.person.name(),
    authorUrl: faker.internet.httpUrl(),
    language: faker.lorem.word(),
    profilePhotoUrl: faker.image.image(),
    rating: faker.randomGenerator.integer(5),
    relativeTimeDescription: faker.lorem.word(),
    text: faker.lorem.sentence(),
    time: faker.randomGenerator.integer(1000000000),
    originalLanguage: null,
    translated: null,
  );
}

PlaceDetailsPhoto newFakePlaceDetailsPhoto() {
  return PlaceDetailsPhoto(
    height: faker.randomGenerator.integer(1000),
    width: faker.randomGenerator.integer(1000),
    photoReference: faker.image.image(),
    htmlAttributions: [],
  );
}

PlaceDetailsOpeningHours newFakePlaceDetailsOpeningHours() {
  return PlaceDetailsOpeningHours(
    openNow: faker.randomGenerator.boolean(),
    specialDays: [],
    type: faker.lorem.word(),
    weekdayText: [],
    periods: [
      PlaceDetailsHoursPeriod(
        close: PlaceDetailsHoursPeriodDetail(
          day: faker.randomGenerator.integer(7),
          time: faker.randomGenerator.integer(1000000000).toString(),
          date: faker.date.dateTime().toString(),
          truncated: faker.randomGenerator.boolean(),
        ),
        open: PlaceDetailsHoursPeriodDetail(
          day: faker.randomGenerator.integer(7),
          time: faker.randomGenerator.integer(1000000000).toString(),
          date: faker.date.dateTime().toString(),
          truncated: faker.randomGenerator.boolean(),
        ),
      ),
      PlaceDetailsHoursPeriod(
        close: PlaceDetailsHoursPeriodDetail(
          day: faker.randomGenerator.integer(7),
          time: faker.randomGenerator.integer(1000000000).toString(),
          date: faker.date.dateTime().toString(),
          truncated: faker.randomGenerator.boolean(),
        ),
        open: PlaceDetailsHoursPeriodDetail(
          day: faker.randomGenerator.integer(7),
          time: faker.randomGenerator.integer(1000000000).toString(),
          date: faker.date.dateTime().toString(),
          truncated: faker.randomGenerator.boolean(),
        ),
      ),
      PlaceDetailsHoursPeriod(
        close: PlaceDetailsHoursPeriodDetail(
          day: faker.randomGenerator.integer(7),
          time: faker.randomGenerator.integer(1000000000).toString(),
          date: faker.date.dateTime().toString(),
          truncated: faker.randomGenerator.boolean(),
        ),
        open: PlaceDetailsHoursPeriodDetail(
          day: faker.randomGenerator.integer(7),
          time: faker.randomGenerator.integer(1000000000).toString(),
          date: faker.date.dateTime().toString(),
          truncated: faker.randomGenerator.boolean(),
        ),
      ),
    ],
  );
}
