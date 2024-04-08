FROM openanalytics/r-ver:4.3.3

RUN apt-get update && apt-get install --no-install-recommends -y \
    pandoc \
    pandoc-citeproc \
    libxt6 \
    && rm -rf /var/lib/apt/lists/*

RUN R -q -e "install.packages(c('shiny', 'rmarkdown'))"

RUN mkdir /app
WORKDIR /app

COPY rmarkdownDemo.Rmd .

EXPOSE 3838

RUN groupadd -g 1000 shiny && useradd -c 'shiny' -u 1000 -g 1000 -m -d /home/shiny -s /sbin/nologin shiny
USER shiny

CMD R -q -e "rmarkdown::run(file = 'rmarkdownDemo.Rmd', shiny_args = list(port = 3838, host = '0.0.0.0'))"
