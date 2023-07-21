package otomo

import "otomo/internal/app/domain/entity/user"

type Otomo struct {
	UserID user.ID
}

func RestoreOtomo(
	UserID user.ID,
) *Otomo {
	return &Otomo{
		UserID: UserID,
	}
}
