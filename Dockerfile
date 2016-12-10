FROM alpine:latest
MAINTAINER DerEnderKeks <admin@derenderkeks.me>

# Get upstream builds from: https://build.syncthing.net/job/strelaysrv/lastSuccessfulBuild/artifact/
ENV NAME     strelaysrv
ENV JOB      323
ENV VERSION  v0.14.13+18-g5070d52
ENV ARCH     linux-amd64
ENV RELEASE  ${NAME}-${ARCH}-${VERSION}

# Busybox wget needs TLS support, curl is less painful to get working
RUN apk add --update ca-certificates curl && \
    curl -L https://build.syncthing.net/job/${NAME}/${JOB}/artifact/${RELEASE}.tar.gz | tar xzf - && \
    mv ${RELEASE}/strelaysrv /usr/local/bin/ && \
    rm -rf ${RELEASE} && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

# Run unprivileged out of /relaysrv
RUN mkdir /relaysrv && chown nobody:nobody /relaysrv
USER nobody
WORKDIR /relaysrv

EXPOSE 22067 22070

CMD /usr/local/bin/strelaysrv -provided-by="${PROVIDER}"
