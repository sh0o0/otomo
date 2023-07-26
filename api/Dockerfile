# Image for build
FROM golang:alpine as builder

# certs for firestore
RUN apk update && apk add --no-cache ca-certificates && update-ca-certificates

# Copy all this dir to builder image
COPY . /goapp
WORKDIR /goapp/cmd/app

# For when go.mod and go sum manage depences
RUN go mod download

# Cross compilation
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /app .

# Image for binary
FROM scratch
WORKDIR /goapp

# Copy binary to image
COPY --from=0 /app ./
COPY --from=0 /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

ENTRYPOINT ["./app"]
