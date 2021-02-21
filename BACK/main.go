package main

import (
	"SoftwareGoDay2/database"
	"SoftwareGoDay2/models"
	router "SoftwareGoDay2/routes"
	"github.com/gin-gonic/gin"
	"log"
)

func ApplyRoutes(r *gin.Engine) {
	r.GET("/get-all-to-do", router.GetAllList)
	r.GET("/get-to-do", router.GetOneList)
	r.POST("/set-to-do", router.ModifyOnelist)
}

func main() {
	r := gin.Default()
	var db database.Database
	err := db.Init()
	if err != nil {
		log.Fatal(err)
	}
	u := models.User{Name: "usr"}
	_ = u.Create(db.DB)
	i := models.Todo{Name: "todo"}
	_ = i.Create(db.DB)
	j := models.TodoList{Name: "todolist"}
	_ = j.Create(db.DB)
	ApplyRoutes(r)
	err = r.Run()
	if err != nil {
		log.Fatal(err)
	}
}