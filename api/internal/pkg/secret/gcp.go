package secret

import (
	"encoding/base64"
	"otomo/internal/pkg/logs"

	"google.golang.org/api/option"
)

func GcpCredentialsOption(
	googleApplicationCredentialsJSON,
	googleApplicationCredentialsJSONPath string,
) (option.ClientOption, error) {
	if googleApplicationCredentialsJSON != "" {
		logs.Logger.Info("Firebase credentials option is Json")

		dec, err := base64.StdEncoding.DecodeString(googleApplicationCredentialsJSON)
		if err != nil {
			return nil, err
		}
		return option.WithCredentialsJSON([]byte(dec)), nil
	}

	logs.Logger.Info("Firebase credentials option is File")
	return option.WithCredentialsFile(googleApplicationCredentialsJSONPath), nil
}
