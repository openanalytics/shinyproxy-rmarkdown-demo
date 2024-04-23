# Running Rmarkdown documents (with Shiny backend) inside ShinyProxy

This repository describes how to add an Rmarkdown document (with Shiny backend) inside ShinyProxy (at least version 2.5.0).

# Build the Docker image

To pull the image made in this repository from Docker Hub, use

```bash
sudo docker pull openanalytics/shinyproxy-rmarkdown-demo
```

the relevant Docker Hub repository can be found at <https://hub.docker.com/r/openanalytics/shinyproxy-rmarkdown-demo>.

To build the image from the Dockerfile, clone this repository, then navigate to its root directory and run

```bash
cd rmarkdownDemo
sudo docker build -t openanalytics/shinyproxy-rmarkdown-demo .
```

This repository also contains an example of an Rmarkdown document that is
pre-rendered during the Docker build. This reduces the startup time of the
application. This image is available on Docker Hub:


```bash
sudo docker pull openanalytics/shinyproxy-rmarkdown-demo:prerendered
```

To build the image:

```bash
cd rmarkdownDemo_prerendered
sudo docker build -t openanalytics/shinyproxy-rmarkdown-demo:prerendered .
```

# ShinyProxy Configuration

To add the Rmarkdown application to ShinyProxy add the following lines to its configuration file (see [application.yml](./application.yml) for a complete file):

```yaml
specs:
  - id: rmarkdown-demo
    display-name: Rmarkdown Demo Application
    container-image: openanalytics/shinyproxy-rmarkdown-demo
  - id: rmarkdown-demo-prerendered
    display-name: Rmarkdown Demo Application (prerendered)
    container-image: openanalytics/shinyproxy-rmarkdown-demo:prerendered
```

## References

- <https://rmarkdown.rstudio.com/authoring_shiny_prerendered>
- [ShinyProxy.io](https://shinyproxy.io/)
- [All demos](https://shinyproxy.io/documentation/demos/)

**(c) Copyright Open Analytics NV, 2024.**
