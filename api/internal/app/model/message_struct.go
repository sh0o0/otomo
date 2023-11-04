package model

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
	Prologue string       `json:"prologue" firestore:"prologue"`
	Details  PlaceDetails `json:"details" firestore:"details"`
	Epilogue string       `json:"epilogue" firestore:"epilogue"`
}

func (*PlaceDetailsStruct) IsStruct() bool { return true }

type PlaceDetails struct {
	Name        string `json:"name" firestore:"name"`
	Description string `json:"description" firestore:"description"`
}

type PlacesStruct struct {
	Prologue string   `json:"prologue" firestore:"prologue"`
	Places   []*Place `json:"places" firestore:"places"`
	Epilogue string   `json:"epilogue" firestore:"epilogue"`
}

func (*PlacesStruct) IsStruct() bool { return true }

type Place struct {
	Name          string         `json:"name" firestore:"name"`
	Description   string         `json:"description" firestore:"description"`
	GeocodedPlace *GeocodedPlace `json:"geocoded_place" firestore:"geocoded_place"`
}

type RouteStruct struct {
	Prologue  string      `json:"prologue" firestore:"prologue"`
	Waypoints []*Waypoint `json:"waypoints" firestore:"waypoints"`
	Epilogue  string      `json:"epilogue" firestore:"epilogue"`
}

func (*RouteStruct) IsStruct() bool { return true }

type Waypoint struct {
	Name                      string           `json:"name" firestore:"name"`
	Description               string           `json:"description" firestore:"description"`
	Transportation            []Transportation `json:"transportation" firestore:"transportation"`
	TransportationDescription string           `json:"transportation_description" firestore:"transportation_description"`
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
