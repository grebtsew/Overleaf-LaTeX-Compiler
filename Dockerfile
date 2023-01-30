FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir /article/
WORKDIR /article/

# --- Install necessary programs ---
RUN apt-get update

# in order to compile thesis
RUN apt-get install -y texlive-base \
    texlive-metapost \
    texlive-music \
    texlive-xetex \
    texlive-luatex \
    texlive-games \
    texlive-humanities \
    texlive-pstricks \
    texlive-pictures \
    texlive-publishers \
    texlive-science \
    texlive-latex-recommended \
    texlive \
    texlive-latex-extra \
    texlive-full  \
    latexmk \
    unzip \
    dos2unix

# Copy project to workdir
ADD ./ /article

# Fix Windows line ending problems
RUN dos2unix /article/compile.tex.sh
RUN dos2unix /article/compilelist.txt

# Make entrypoint executable
RUN chmod +x /article/compile.tex.sh
ENTRYPOINT ["/article/compile.tex.sh" ]
