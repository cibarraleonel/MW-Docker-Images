FROM alpine:latest
ENTRYPOINT ["sh", "-c", "dd if=/dev/zero of=/tmp/created-file bs=1 count=${1:-10M}", "sh"]
CMD ["10M"]