FROM resin/armv7hf-debian:jessie

# Install deps
RUN apt-get update
RUN apt-get install liblivemedia-dev liblog4cpp5-dev git cmake gcc g++ make libasound2-dev kmod v4l-utils net-tools
RUN rm -rf /var/lib/apt/lists/*

# Install v4l2rtspserver
RUN git clone https://github.com/mpromonet/v4l2rtspserver.git /app/v4l2rtspserver \
    && ( cd /app/v4l2rtspserver  && git checkout v0.0.6 && cmake . && make)

# Source files
COPY ./src/ /app/

# Run command
CMD /bin/bash /app/run.sh
