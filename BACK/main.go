package main

import (
	router "SoftwareGoDay2/routes"
	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
)

func ApplyRoutes(r *gin.Engine) {
	r.POST("/repeat-my-body", router.BodyRequest)
}

func main() {
	r := gin.Default()
	godotenv.Load()
	ApplyRoutes(r)
	r.Run()
}