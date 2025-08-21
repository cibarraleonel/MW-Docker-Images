# Ejercicio 5: Dockerfile -> SIN ROOT
FROM alpine:latest
RUN adduser -D -s /bin/sh userRandom
USER userRandom
ENTRYPOINT ["sh", "-c", "dd if=/dev/zero of=/tmp/created-file bs=1 count=${1:-10M}", "sh"]
CMD ["10M"]