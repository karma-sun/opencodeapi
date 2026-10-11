FROM alpine

RUN apk add --no-cache curl ca-certificates
RUN adduser -S opencode

USER opencode
WORKDIR /app
RUN curl -o opencode2api.tar.gz -L https://github.com/jasonxu114514/opencode2api/releases/download/v1.3.5/opencode2api_v1.3.5_linux_amd64.tar.gz && tar zxf opencode2api.tar.gz && mv opencode2api_*/opencode2api ./ && rm -r opencode2api_* *.gz
RUN curl -o wild-work -L https://github.com/rockswang/wild-work/releases/latest/download/wild-work-linux-amd64 && chmod +x wild-work
COPY --chown=opencode --chmod=0755 entrypoint.sh ./entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]
