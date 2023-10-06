package model

type LatLng struct {
	Lat float64 `firestore:"latitude"`
	Lng float64 `firestore:"longitude"`
}
