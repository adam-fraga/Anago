<!-- PROJECT LOGO -->
<br />
<div align="center">

<img src="https://i.ibb.co/4W3Vrc9/image.png" alt="Logo" alt="image" border="0">


  <h3 align="center">Anago</h3>

  <p align="center">
    An awesome starter kit for your Go + Templ + Tailwind project with Docker support.
    <br />
    <a href="https://github.com/othneildrew/Best-README-Template">View Demo video (SOON)</a>
    ·
    <a href="https://github.com/othneildrew/Best-README-Template/issues/new?labels=bug&template=bug-report---.md">Report Bug</a>
    ·
    <a href="https://github.com/othneildrew/Best-README-Template/issues/new?labels=enhancement&template=feature-request---.md">Request Feature</a>
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->

## About The Project

Are you tired of spending valuable time setting up your development environment every time you start a new project? Say goodbye to repetitive setup tasks with this Dockerized Development Environment!

Introduction
I use this setupe on my workflow to simplify the process of creating a development environment by packaging all the necessary tools and dependencies into a Docker container.
Whether you're working on a small script or a complex application, this Dockerized setup ensures consistency, reproducibility, and ease of use.
No need for you to install development tool localy.

Key Features
Comprehensive Stack:

This Dockerized environment includes the following stack:

Go, Templ, Tailwind, Postgres, and Typescript providing you with everything you need for modern web development.

Type Safety with Typescript: Enjoy the benefits of type safety with Typescript, catching errors early and improving the stability of your codebase.

Streamlined Workflow: With just a few simple steps, you can have a fully functional development environment up and running, allowing you to focus on what matters most: building amazing projects.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## Getting Started

This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

### Developer Prerequisites

You need to have the following tools installed on your machine to be able to run the project.

- [Node.js](https://nodejs.org/en/)
- [Go](https://golang.org/)
- [Air](https://github.com/cosmtrek/air)
- [Make](https://www.gnu.org/software/make/)

### Developer kick starter

1. Clone the repo

   ```sh
   git clone https://github.com/adam-fraga/hananime.git
   ```

2. To start the development environment, you need to have Docker installed on your machine.
   If you don't have it installed, you can download it from [here](https://www.docker.com/products/docker-desktop).

To start the development environment, run the following commands to build the Docker image and run the container:

```sh
docker build -t "pseudo/appimagename" -f Dockerfile.dev .
docker build -f Dockerfile.dev -t pseudo/appimagename:tag .
docker volume create "volume-name"
docker run -v volume-name:/usr/src/app pseudo/appimagename -it /bin/bash
```

3. Once you are inside the container, you can run the following commands to start the development server,
   note that we preconize to use a terminal multiplexer like tmux or screen to run the following commands for more convenience:

```sh
make tailwind
make webpack
air
make templ
make db
```

<!-- USAGE EXAMPLES -->

## Usage

You can now start by creating your first go file entrypoint in the `cmd` folder and your first template in the `templ` folder.

_/usr/src/app/cmd/main.go_

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

_/usr/src/app/templ/index.templ_

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

## Roadmap

- [x] Add Postgres database support
- [x] Finalize Dockerfile for Prod support
- [ ] Add "components" document to easily copy & paste sections of the readme
- [ ] Multi-language Support

## Fix list

1. ADD POSTGRES DB SUPPORT TO THE DOCKERFILE
2. ADD PRODUCTION BUILD STEP TO THE DOCKERFILE.PROD
3. FINALIZE THE README TO INCLUDE ALL THE STEPS TO RUN THE PROJECT
4. ADD NVM SUPPORT FOR DOCKER DEV CONTAINER

See the [open issues](https://github.com/othneildrew/Best-README-Template/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->

## Contact

[Mail Adam Fraga](mailto:adam.fraga@live.fr)

Anago Link: [https://github.com/adam-fraga/Anago](https://github.com/adam-fraga/Anago)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->

## Acknowledgments

You will find bellow different link related to the technologie i use in this project:

- [Docker](https://www.docker.com)
- [Air](https://github.com/cosmtrek/air)
- [Tailwind](https://tailwindcss.com)
- [Makefile Documentation](https://www.gnu.org/software/make/manual/make.html)
- [Go templ Documentation](https://templ.guide/)
- [Webpack Documentation](https://webpack.js.org/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com
[JQuery.com]: https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white
[JQuery-url]: https://jquery.com
