package model

type Location struct {
	GooglePlaceID string   `firestore:"google_place_id"`
	LongName      string   `firestore:"long_name"`
	ShortName     string   `firestore:"short_name"`
	Address       string   `firestore:"address"`
	Types         []string `firestore:"types"`
	Geometry      Geometry `firestore:"geometry"`
}

type Geometry struct {
	LatLng LatLng `firestore:"lat_lng"`
}

type LatLng struct {
	Lat float64 `firestore:"latitude"`
	Lng float64 `firestore:"longitude"`
}
