FROM alpine
WORKDIR /src
COPY test* .
COPY README.md .
RUN stat -c '%a %n' *
