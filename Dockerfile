FROM phusion/baseimage

LABEL maintainer="Carlos López <cladev@gmail.com>"

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -q -y \
    libsqlite3-dev \
    ruby \
    ruby-dev \
    build-essential \
  && gem install --no-ri --no-rdoc mailcatcher \
  && apt-get remove -y build-essential \
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists

# smtp port
EXPOSE 1025

# webserver port
EXPOSE 1080

CMD ["mailcatcher", "--foreground", "--ip=0.0.0.0"]
