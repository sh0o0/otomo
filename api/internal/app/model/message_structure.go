package model

type Structure struct {
	Name   StructName `firestore:"name"`
	Struct Struct     `firestore:"struct"`
}

type StructureChunk struct {
	Name   StructName `firestore:"struct_name"`
	Struct string     `firestore:"struct"`
}

type StructName string

const (
	SNEmpty        StructName = ""
	SNPlaces       StructName = "places"
	SNRoute        StructName = "route"
	SNPlaceDetails StructName = "place_details"
)

type Struct interface {
	IsStruct() bool
}

type PlaceDetailsStruct struct {
	Prologue string       `firestore:"prologue"`
	Details  PlaceDetails `firestore:"details"`
	Epilogue string       `firestore:"epilogue"`
}

func (*PlaceDetailsStruct) IsStruct() bool { return true }

type PlaceDetails struct {
	Name        string `firestore:"name"`
	Description string `firestore:"description"`
}

type PlacesStruct struct {
	Prologue string   `firestore:"prologue"`
	Places   []*Place `firestore:"places"`
	Epilogue string   `firestore:"epilogue"`
}

func (*PlacesStruct) IsStruct() bool { return true }

type Place struct {
	Name          string         `firestore:"name"`
	Description   string         `firestore:"description"`
	GeocodedPlace *GeocodedPlace `firestore:"geocoded_place"`
}

type RouteStruct struct {
	Prologue  string      `firestore:"prologue"`
	Waypoints []*Waypoint `firestore:"waypoints"`
	Epilogue  string      `firestore:"epilogue"`
}

func (*RouteStruct) IsStruct() bool { return true }

type Waypoint struct {
	Name                      string           `firestore:"name"`
	Description               string           `firestore:"description"`
	Transportation            []Transportation `firestore:"transportation"`
	TransportationDescription string           `firestore:"transportation_description"`
}

type Transportation string

const (
	UnknownTransportation Transportation = "unknown"
	Train                 Transportation = "train"
	Airplane              Transportation = "airplane"
	Car                   Transportation = "car"
	Ship                  Transportation = "ship"
	Bus                   Transportation = "bus"
	Bicycle               Transportation = "bicycle"
	Motorcycle            Transportation = "motorcycle"
	Walking               Transportation = "walking"
	Taxi                  Transportation = "taxi"
	Other                 Transportation = "other"
)
