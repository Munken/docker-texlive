FROM sumdoc/texlive-2017

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    &&    python get-pip.py \
    &&	  pip install latexdiffcite


