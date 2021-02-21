package models

import "gorm.io/gorm"

type User struct {
	gorm.Model
	Name string
	Todos []*Todo `gorm:"many2many:user_todos;"`
}

func (u *User) Create(db *gorm.DB) error {
	return db.Create(&u).Error
}
