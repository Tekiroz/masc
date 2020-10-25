FROM debian:10.6

ENV TZ=Europe/Madrid
ENV USER masc
ENV HOME /home/${USER}
<<<<<<< HEAD
ENV DEBIAN_FRONTEND noninteractive
WORKDIR /opt

RUN apt -y update \
    && apt install --no-install-recommends -y \
        tzdata \
=======
ENV DEBIAN_FRONTEND noninteractive  

WORKDIR ${HOME}
ADD . ${HOME}

RUN apt -y update \
    && apt install --no-install-recommends -y \
	    tzdata \
>>>>>>> develop
        unzip \
        python3 \
        python3-pip \
        python3-dev \
        libmagic1 \
        build-essential \
<<<<<<< HEAD
        python3-setuptools \
    && rm -rf /var/cache/apt/archives /var/lib/apt/lists/*

RUN python3 -m pip install --upgrade pip \
    && python3 -m pip install \
        wheel \
    && python3 -m pip install \
=======
    && apt clean && rm -rf /var/cache/apt/*
    
RUN pip3 install --upgrade pip \
    && pip3 install \
>>>>>>> develop
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

<<<<<<< HEAD
WORKDIR ${HOME}

CMD ["/usr/local/bin/masc","-h"]
=======
RUN unzip samples.zip && rm samples.zip

CMD ["/usr/local/bin/masc","-h"]
>>>>>>> develop
