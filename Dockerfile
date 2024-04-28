FROM golang:1.22

RUN apt update && apt install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt install -y nodejs
RUN go install github.com/cosmtrek/air@latest

WORKDIR /usr/src/app

# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change
COPY ./ /usr/src/app

RUN make init

RUN go mod download && go mod verify

COPY . .
RUN go build -v -o /usr/local/bin/app ./...

CMD ["app"]
