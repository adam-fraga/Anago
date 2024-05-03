github_pseudo="adam-fraga"
repo_name_git="github.com:$github_pseudo/"
repo_name_go="github.com/$github_pseudo/"
app_name="$(basename "$PWD")"
firstname="Adam"

mkdir -p ./cmd/$app_name

echo '
package main

import (
	"fmt"
	"github.com/a-h/templ"
	"net/http"
	"'$repo_name_go$app_name'/views" 
)

func main() {
	component := views.Index("'$firstname'")
	http.Handle("/assets/", http.StripPrefix("/assets/", http.FileServer(http.Dir("assets"))))
	http.Handle("/", templ.Handler(component))
	fmt.Println("Server running on port 3000")

	http.ListenAndServe(":3000", nil)
}
'> "$PWD/cmd/$app_name/main.go"

echo "package views

templ Index(name string) {
<!DOCTYPE html>
<html>

<head>
  <title>Page Title</title>
  <link rel=\"stylesheet\" type=\"text/css\" href=\"/assets/styles/styles.css\" />
</head>

<body>
  <h1 class=\"text-blue-400\">Welcome, {name}</h1>

  <script src=\"/assets/scripts/bundle.js\"></script>
</body>

</html>
}" > "$PWD/views/index.templ"

echo "@tailwind base;\n@tailwind components;\n@tailwind utilities;" > $PWD/src/styles/input.css
echo "console.log('Anago TS Loaded!');" > $PWD/src/scripts/index.ts

git init
touch .gitignore && echo "node_modules" > .gitignore
gh repo create $app_name --public --confirm
git add .
git commit -m "Initial commit"
git remote add origin "git@$repo_name_git$app_name.git"
git branch -M main
git push -u origin main

go mod init $repo_name_go$app_name
go get $app_name
go mod tidy
go mod download && go mod verify
templ generate

mv ./config/.air.toml .
mv ./config/.env .

rm -rf ./config
rm Dockerfile.dev
rm Dockerfile.prod

docker run --mount type=bind,source=$(pwd),target=/usr/src/app --name $app_name -p 8080:3000 -p 8081:3001 adamfraga/anago:1.0 air
