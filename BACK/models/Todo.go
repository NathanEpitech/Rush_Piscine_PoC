package models

import (
	"gorm.io/gorm"
)

type Todo struct {
	gorm.Model
	Name string
	TodoListID uint
}

func (i *Todo) Create(db *gorm.DB) error {
	return db.Create(&i).Error
}