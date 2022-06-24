FROM golang:1.18-alpine

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./

RUN mkdir -p /app/pkg/bot
WORKDIR /app/pkg/bot
COPY pkg/bot/*.go ./

WORKDIR /app

RUN go build main.go

EXPOSE 8080

CMD [ "./main" ]