FROM openanalytics/r-ver:4.1.3

LABEL maintainer="Tobias Verbeke <tobias.verbeke@openanalytics.eu>"

RUN apt-get update && apt-get install --no-install-recommends -y \
    pandoc \
    pandoc-citeproc \
    && rm -rf /var/lib/apt/lists/*

RUN R -q -e "install.packages(c('shiny', 'rmarkdown'))"

COPY rmarkdownDemo.Rmd .

EXPOSE 3838

CMD R -q -e "rmarkdown::run(file = 'rmarkdownDemo.Rmd', shiny_args = list(port = 3838, host = '0.0.0.0'))"

