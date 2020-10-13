FROM ubuntu:xenial

ENV USER masc
ENV HOME /home/${USER}
ENV LOCALES en_EN.UTF-8
ENV DEBIAN_FRONTEND noninteractive  

WORKDIR ${HOME}
ADD setup.py ${HOME}/
ADD masc/ ${HOME}/masc/

RUN apt -y update && apt install --no-install-recommends -y \
    locales \
    git \
    python3 \
    python3-pip

RUN pip3 install --upgrade pip \
    && pip3 install python-magic yara-python watchdog termcolor pypandoc progress pyclamd

RUN python3 setup.py install

CMD ["/bin/bash"]