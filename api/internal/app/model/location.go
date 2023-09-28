package model

type Location struct {
	GooglePlaceID string   `firestore:"google_place_id"`
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
