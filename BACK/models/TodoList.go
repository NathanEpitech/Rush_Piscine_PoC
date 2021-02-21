package models

import "gorm.io/gorm"

type TodoList struct {
	gorm.Model
	Name    string
	Content string
	Users   []*User `gorm:"many2many:user_todos;"`
	Todos   []Todo
}

func (j *TodoList) Create(db *gorm.DB) error {
	return db.Create(&j).Error
}
