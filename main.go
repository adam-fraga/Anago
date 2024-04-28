package main

import (
	"fmt"
	"github.com/a-h/templ"
	"github.com/adam-fraga/hananime/views"
	"net/http"
)

func main() {
	component := views.Index("Adam Fraga")
	http.Handle("/assets/", http.StripPrefix("/assets/", http.FileServer(http.Dir("assets"))))
	http.Handle("/", templ.Handler(component))
	fmt.Println("Server running on port 3000")

	http.ListenAndServe(":3000", nil)
}
