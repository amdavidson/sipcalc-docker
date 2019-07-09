FROM alpine as builder

RUN apk add git gcc musl-dev make automake autoconf

RUN git clone https://github.com/sii/sipcalc.git \
    && cd sipcalc \
    && ./configure \
    && make

FROM alpine

COPY --from=builder /sipcalc/src/sipcalc /bin/sipcalc

ENTRYPOINT ["/bin/sipcalc", "-"]

