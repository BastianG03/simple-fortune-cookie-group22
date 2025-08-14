FROM golang:1.25 AS builder
WORKDIR /app
COPY . /app
RUN go mod download && go mod verify
RUN cd /app && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o goapp
FROM alpine
WORKDIR /app
COPY --from=builder /app /app/
EXPOSE 8080
ENTRYPOINT ["./goapp"]