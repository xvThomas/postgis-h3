FROM postgis/postgis:15-3.4


# H3 stuff 
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        cmake \
        gcc \
        git \
        make \
        pgxnclient \
        postgresql-server-dev-15 \
        python3-pip \
    && pip install --upgrade cmake \
	# version 4 of h3 requires a new version of cmake
    && pgxn install h3==4.1.3 \
    && apt-get remove -y \
        cmake \
        gcc \ 
        git \
        make \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY ./initdb-h3.sh /docker-entrypoint-initdb.d/1_h3.sh
