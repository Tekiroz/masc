FROM ubuntu:focal

ENV TZ=Europe/Madrid
ENV USER masc
ENV HOME /home/${USER}
ENV DEBIAN_FRONTEND noninteractive  

WORKDIR ${HOME}
ADD . ${HOME}

RUN apt -y update \
    && apt install --no-install-recommends -y \
	    tzdata \
        unzip \
        python3 \
        python3-pip \
        python3-dev \
        libmagic1 \
        build-essential \
    && apt clean && rm -rf /var/cache/apt/*
    
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

RUN python3 setup.py install

RUN unzip samples.zip && rm samples.zip

CMD ["/usr/local/bin/masc","-h"]
