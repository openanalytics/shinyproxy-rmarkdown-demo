# Running Rmarkdown documents (with Shiny backend) inside ShinyProxy

This repository describes how to add an Rmarkdown document (with Shiny backend) inside ShinyProxy (at least version 2.5.0).

# Build the Docker image

To pull the image made in this repository from Docker Hub, use

```
sudo docker pull openanalytics/shinyproxy-rmarkdown-demo
```

the relevant Docker Hub repository can be found at https://hub.docker.com/r/openanalytics/shinyproxy-rmarkdown-demo

To build the image from the Dockerfile, clone this repository, then navigate to its root directory and run

```
sudo docker build -t openanalytics/shinyproxy-rmarkdown-demo .
```

# ShinyProxy Configuration

To add the streamlit application to ShinyProxy add the following lines to its configuration file (see [application.yml](./application.yml) for a complete file):
```
specs:
  - id: rmarkdown-demo
    display-name: Rmarkdown Demo Application
    container-image: openanalytics/shinyproxy-rmarkdown-demo
```

# References
* https://rmarkdown.rstudio.com/authoring_shiny_prerendered


**(c) Copyright Open Analytics NV, 2024.**