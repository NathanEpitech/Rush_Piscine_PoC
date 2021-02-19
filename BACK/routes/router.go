package router

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

func BodyRequest(c *gin.Context) {
	var msg string
	if err := c.ShouldBind(&msg); err != nil {
		c.AbortWithError(http.StatusBadRequest, err)
	} else {
		c.String(http.StatusOK, "")
	}
}