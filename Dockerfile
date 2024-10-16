FROM mambaorg/micromamba

USER root

RUN apt-get update && apt-get install -y curl unzip && apt-get clean && rm -rf /var/lib/apt/lists/*

USER mambauser
RUN curl -fsSL https://deno.land/x/install/install.sh | sh

RUN micromamba install --yes --name base -c bioconda -c conda-forge \
      python=3.10 \
      jupyterlab \
      pandas \
      numpy \
      matplotlib \
      seaborn \
      scikit-learn \
      pytorch \
      nltk \
      tensorflow \
      xeus-cling \
      spacy 

RUN micromamba clean --all --yes
RUN ~/.deno/bin/deno jupyter --install --unstable --quiet

#if you need to run pip install in the same environment, uncomment the following lines

ARG MAMBA_DOCKERFILE_ACTIVATE=1

ENV PORT=8008
ENV TOKEN=123123

EXPOSE ${PORT}

CMD ["sh", "-c", "jupyter lab --ip=0.0.0.0 --port=${PORT} --no-browser --allow-root --ServerApp.allow_origin='*' --ServerApp.token=${TOKEN}"]

#RUN pip install --no-cache myPythonPackage