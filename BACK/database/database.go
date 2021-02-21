package database

import (
	"SoftwareGoDay2/models"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

type Database struct {
	*gorm.DB
}

func (d *Database) Init() (err error)  {
	d.DB, err = gorm.Open(gorm.Open("postgres"), &gorm.Config{})
	if err != nil {
		return
	}
	err = d.DB.AutoMigrate(&models.User{}, &models.TodoList{}, &models.Todo{})
	return
}