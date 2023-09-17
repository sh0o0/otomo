package main

import (
	"bytes"
	"context"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"os"

	firebase "firebase.google.com/go/v4"
)

const (
	remoteVerifyCustomTokenURL = "https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyCustomToken?key=%s"
	localVerifyCustomTokenURL  = "http://127.0.0.1:9099/identitytoolkit.googleapis.com/v1/accounts:signInWithCustomToken?key=%s"
)

var (
	// # Config
	userID            = os.Getenv("USER_ID")
	firebaseProjectID = os.Getenv("FIREBASE_PROJECT_ID")
	apiKey            = os.Getenv("API_KEY")

	// # Options
	// Must set GOOGLE_APPLICATION_CREDENTIALS or FIREBASE_AUTH_EMULATOR_HOST
	_ = os.Getenv("GOOGLE_APPLICATION_CREDENTIALS")
	_ = os.Getenv("FIREBASE_AUTH_EMULATOR_HOST")
)

func main() {

	firebase.NewApp(
		context.Background(),
		&firebase.Config{},
	)

	ctx := context.Background()

	app, err := firebase.NewApp(ctx, &firebase.Config{
		ProjectID: firebaseProjectID,
	})
	if err != nil {
		panic(err)
	}

	client, err := app.Auth(ctx)
	if err != nil {
		panic(err)
	}

	user, err := client.GetUser(ctx, userID)
	if err != nil {
		panic(err)
	}

	tokenString, err := client.CustomToken(ctx, user.UID)
	if err != nil {
		panic(err)
	}

	idToken, err := signInWithCustomToken(tokenString)
	if err != nil {
		panic(err)
	}

	token, err := client.VerifyIDToken(ctx, idToken)
	if err != nil {
		panic(err)

	}

	fmt.Printf("user id:\n%s\n", token.UID)
	fmt.Println()
	fmt.Printf("token:\n%s\n", idToken)
}

// see https://github.com/firebase/firebase-admin-go/blob/1d2a52c3c8195451b5ad2e0a173906bd6eb9529d/integration/auth/auth_test.go#L199
func signInWithCustomToken(token string) (string, error) {
	req, err := json.Marshal(map[string]interface{}{
		"token":             token,
		"returnSecureToken": true,
	})
	if err != nil {
		return "", err
	}

	var verifyCustomTokenURL string
	if os.Getenv("FIREBASE_AUTH_EMULATOR_HOST") != "" {
		verifyCustomTokenURL = localVerifyCustomTokenURL
	} else {
		verifyCustomTokenURL = remoteVerifyCustomTokenURL
	}
	fmt.Println((fmt.Sprintf(verifyCustomTokenURL, apiKey)))

	resp, err := postRequest(fmt.Sprintf(verifyCustomTokenURL, apiKey), req)
	if err != nil {
		return "", err
	}
	var respBody struct {
		IDToken string `json:"idToken"`
	}
	if err := json.Unmarshal(resp, &respBody); err != nil {
		return "", err
	}
	return respBody.IDToken, err
}

func postRequest(url string, req []byte) ([]byte, error) {
	resp, err := http.Post(url, "application/json", bytes.NewBuffer(req))
	if err != nil {
		return nil, err
	}

	defer resp.Body.Close()
	if resp.StatusCode != http.StatusOK {
		return nil, fmt.Errorf("unexpected http status code: %d", resp.StatusCode)
	}
	return ioutil.ReadAll(resp.Body)
}
