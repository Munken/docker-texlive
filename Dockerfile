FROM sumdoc/texlive-2017

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    &&    python get-pip.py \
    &&	  pip install latexdiffcite

RUN apt-get -y update && apt-get -y install --no-install-recommends \
    ghostscript
    && rm -rf /var/lib/apt/lists/*


