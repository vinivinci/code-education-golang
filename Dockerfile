FROM golang:1.18 as builder

WORKDIR /usr/src/app

RUN go mod init example/hello
RUN go mod download && go mod verify

COPY . .
RUN go build hello.go

FROM scratch
COPY --from=builder /usr/src/app .
CMD ["/hello"]

