package router

import (
	"errors"
	"fmt"
	"github.com/gin-gonic/gin"
	"net/http"
)

func ModifyOnelist(c *gin.Context) {
	var msg string
	if err := c.ShouldBind(&msg); err != nil {
		c.AbortWithError(http.StatusBadRequest, err)
	} else {
		fmt.Printf("%s\n", msg)
		fmt.Println(msg)
		c.String(http.StatusOK, "")
	}
}

func GetOneList(c *gin.Context) {
	var msg string
	if err := c.ShouldBind(&msg); err != nil {
		c.AbortWithError(http.StatusBadRequest, err)
	} else {
		fmt.Printf("%s\n", msg)
		fmt.Println(msg)
		c.String(http.StatusOK, "")
	}
}

func GetAllList(c *gin.Context) {
	usrId := c.Query("usr_id")
	if usrId == "" {
		_ = c.AbortWithError(http.StatusBadRequest, errors.New("no user query params"))
		return
	}
	fmt.Println(usrId)
	c.String(http.StatusOK, "")
}
