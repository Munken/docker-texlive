FROM debian:sid
LABEL maintainer "Oliver Kopp <kopp.dev@gmail.com>"
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    TERM=dumb
ARG BUILD_DATE

# we additionally need python, java (because of pax), perl (because of pax), pdftk, ghostscript, and unzip (because of pax)
RUN apt-get update -qq && apt-get upgrade -qq && \
    # proposal by https://github.com/sumandoc/TeXLive-2017
    apt-get install -y wget curl libgetopt-long-descriptive-perl libdigest-perl-md5-perl fontconfig && \
    # libfile-copy-recursive-perl is required by ctanify
    # for plantuml, we need graphviz and inkscape. For inkscape, there is no non-X11 version, so 200 MB more
    # install texlive-full. The documentation ( texlive-latex-base-doc- texlive-latex-extra-doc- texlive-latex-recommended-doc-	texlive-metapost-doc- texlive-pictures-doc- texlive-pstricks-doc- texlive-publishers-doc- texlive-science-doc- texlive-fonts-extra-doc- texlive-fonts-recommended-doc- texlive-humanities-doc-) is also required
    apt-get install -y --no-install-recommends texlive-full fonts-texgyre latexml && \
    # texlive-full depends on pyhton3. These packages curently depend on python2.7.
    # install pygments to enable minted
    apt-get install -y python-pygments python-pip && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get -y update && apt-get -y install --no-install-recommends \
    ghostscript git zip unzip\
    && rm -rf /var/lib/apt/lists/*

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python get-pip.py

RUN git clone https://gitlab.com/git-latexdiff/git-latexdiff.git \
    && cp git-latexdiff/git-latexdiff /usr/bin/ \
    && rm -rf git-latexdiff


