FROM golang:1.17.5-alpine AS buildeGo
WORKDIR /go/src
COPY . .
RUN go build main.go

FROM scratch
COPY --from=buildeGo /go/src .
CMD ["./main"]