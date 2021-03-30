FROM alpine:3.13.3 as builder
RUN apk add build-base
WORKDIR /app
COPY . .
RUN make

FROM alpine:3.13.3
WORKDIR /app
RUN apk --no-cache add tini socklog
ADD ./docker-entrypoint.sh /docker-entrypoint.sh
COPY --from=builder /app/poc .
ENTRYPOINT ["/sbin/tini", "--", "/docker-entrypoint.sh"]
