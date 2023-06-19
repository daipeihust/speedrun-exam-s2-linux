FROM alpine AS locbuilder
WORKDIR /tmp

RUN apk add unzip
ADD "https://www.phpbb.com/customise/db/download/201461?sid=9389208966044ae80a03ba99703d16c4" /tmp/phpbb.zip

RUN unzip phpbb.zip
RUN mv mandarin_chinese_traditional_script_3_3_10 loc

FROM bitnami/phpbb:3.3.10 AS runtime
COPY --from=locbuilder /tmp/loc/ /bitnami/phpbb/
