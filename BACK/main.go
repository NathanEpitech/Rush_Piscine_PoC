package main

import (
	router "SoftwareGoDay2/routes"
	"github.com/gin-gonic/gin"
)

func ApplyRoutes(r *gin.Engine) {
	r.GET("/get-verb", router.GetRequest)
	r.POST("/post-verb", router.BodyRequest)
}

func main() {
	r := gin.Default()
	ApplyRoutes(r)
	r.Run()
}