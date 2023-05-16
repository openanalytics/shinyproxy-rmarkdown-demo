FROM rocker/r-ver:4.2.3


RUN apt-get update && apt-get install -y pandoc libxt6

RUN R -q -e "install.packages(c('rmarkdown', 'shiny', 'flexdashboard'))"

WORKDIR /app
COPY index.Rmd .

RUN R -e "rmarkdown::render('index.Rmd')"
#ENV RMARKDOWN_RUN_PRERENDER=0

CMD ["R", "-q", "-e", "rmarkdown::run(shiny_args = list(port = 3838, host = '0.0.0.0'))"]
