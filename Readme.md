### Start development environment

To start the development environment, you need to have Docker installed on your machine.
If you don't have it installed, you can download it from [here](https://www.docker.com/products/docker-desktop).

To start the development environment, run the following commands to build the Docker image and run the container:

```sh
docker build -t "pseudo/appimagename" -f Dockerfile.dev .
docker build -f Dockerfile.dev -t pseudo/appimagename:tag .
docker volume create "volume-name"
docker run -v volume-name:/usr/src/app pseudo/appimagename -it /bin/bash
```

Once you are inside the container, you can run the following commands to start the development server,
note that we preconize to use a terminal multiplexer like tmux or screen to run the following commands for more convenience:

```sh
make tailwind
make webpack
air
make templ
make db
```

You can now start by creating your first go file entrypoint in the `cmd` folder and your first template in the `templ` folder.

SAMPLE CODE:

```go
package main

import (
	"fmt"
	"github.com/a-h/templ"
	"net/http"
	"my-module-name/views"
)

func main() {
	component := views.Index("Adam Fraga")
	http.Handle("/assets/", http.StripPrefix("/assets/", http.FileServer(http.Dir("assets"))))
	http.Handle("/", templ.Handler(component))
	fmt.Println("Server running on port 3000")

	http.ListenAndServe(":3000", nil)
}

```

```templ
package views

templ Index(name string) {
<!DOCTYPE html>
<html>

<head>
  <title>Page Title</title>
  <link rel="stylesheet" type="text/css" href="/assets/styles/styles.css" />
</head>

<body>
  <h1 class="text-blue-400">Hello, {name}</h1>

  <script src="/assets/scripts/bundle.js"></script>
</body>

</html>
}
```

#### TODO

1. ADD POSTGRES DB SUPPORT TO THE DOCKERFILE
2. RUN DEV CONTAINER -IT AND FIX Tailwind + FIX WEBPACK BY ADDING PLUGINS WITH NPM
3. ADD PRODUCTION BUILD STEP TO THE DOCKERFILE.PROD
4. FINALIZE THE README TO INCLUDE ALL THE STEPS TO RUN THE PROJECT
5. ADD NVM SUPPORT FOR DOCKER DEV CONTAINER

### Build the project for production
