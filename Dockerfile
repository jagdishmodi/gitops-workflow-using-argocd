FROM golang:1.21 as builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o server
FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/server .
EXPOSE 8081
CMD ["./server"]
