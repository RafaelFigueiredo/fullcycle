FROM golang:alpine as build
WORKDIR /app
COPY main.go .
RUN go build -ldflags "-w" -o bin/codeeducation

FROM scratch as release
COPY --from=build /app/bin /

CMD ["/codeeducation"]


