FROM ubuntu:focal

ENV USER masc
ENV HOME /home/${USER}
ENV DEBIAN_FRONTEND noninteractive  

WORKDIR ${HOME}
ADD setup.py ${HOME}/
ADD masc/ ${HOME}/masc/
ADD README.md ${HOME}/

RUN apt -y update \
    && apt install --no-install-recommends -y \
        git \
        python3 \
        python3-pip \
        python3-dev \
        libmagic1 \
        build-essential 

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

CMD ["/usr/local/bin/masc","-h"]