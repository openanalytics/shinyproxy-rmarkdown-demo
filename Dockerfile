FROM rocker/r-ver:4.2.3

RUN apt-get update && \
    apt-get install -y --no-install-recommends pandoc libxt6 && \
    rm -rf /var/lib/apt/lists/*


RUN R -q -e "install.packages(c('rmarkdown', 'shiny', 'flexdashboard'))"

WORKDIR /app
COPY index.Rmd .

CMD ["R", "-q", "-e", "rmarkdown::run(shiny_args = list(port = 3838, host = '0.0.0.0'))"]
