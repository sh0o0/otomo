# Image bulider
FROM golang:alpine as builder

# certs for firestore
RUN apk update && apk add --no-cache ca-certificates && update-ca-certificates

COPY . /goapp
WORKDIR /goapp/cmd/app

# Used when managing dependencies with go.mod and go.sum in goapp
RUN go mod download

# Cross compile
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /app .

# Image
FROM scratch
WORKDIR /goapp

# Copy binary and certs to image
COPY --from=0 /app ./
COPY --from=0 /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

ENTRYPOINT ["./app"]
