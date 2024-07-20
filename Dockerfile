FROM golang:1.21 as builder
WORKDIR /app
COPY . .
ENV CGO_ENABLED=0
ENV GOOS=linux
RUN  go build -o ./server
FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/server .
EXPOSE 8081
CMD ["./server"]
