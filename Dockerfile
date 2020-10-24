FROM debian:10.6

ENV TZ=Europe/Madrid
ENV USER masc
ENV HOME /home/${USER}
ENV DEBIAN_FRONTEND noninteractive
WORKDIR /opt

RUN apt -y update \
    && apt install --no-install-recommends -y \
        tzdata \
        unzip \
        python3 \
        python3-pip \
        python3-dev \
        libmagic1 \
        build-essential \
        python3-setuptools \
    && rm -rf /var/cache/apt/archives /var/lib/apt/lists/*

RUN pip3 install --upgrade pip \
    && pip3 install \
        setuptools \
        yara-python \
        python-magic \
        watchdog \
        termcolor \
        pypandoc \
        progress \
        pyclamd 

COPY . /opt
RUN mkdir -p ${HOME} && unzip samples.zip -d ${HOME} && rm samples.zip
RUN python3 setup.py install

WORKDIR ${HOME}

CMD ["/usr/local/bin/masc","-h"]