FROM sumdoc/texlive-2017

RUN apt-get -y update && apt-get -y install --no-install-recommends \
    ghostscript pip\
    && rm -rf /var/lib/apt/lists/*

RUN pip install latexdiffcite


