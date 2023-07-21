package otomo

import "otomo/internal/app/domain/entity/user"

type ID string

type Otomo struct {
	ID     ID
	UserID user.ID
}
