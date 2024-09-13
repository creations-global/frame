# Technical Implementation

Based on "Threagile" at https://treagile.io

Based on "Threagile on Github" at https://github.com/threagile

Based on "Threagile - The Open-Source Agile Threat Modeling Toolkit" at https://www.youtube.com/watch?v=5n-8LqHMoJ0

Based on "Push to GitHub Container Registry using GitHub Actions" at https://codesalad.dev/blog/push-to-github-container-registry-using-github-actions-7

## Introduction

Create Frame as a Docker Image. It can be pulled from a Docker Image host (such as Docker Hub or Github Container Registry). It makes Frame platform independent.

Within a script (e.g. ```frame.sh```) the creation of the Frame Docker Container is handled:

```
#!/bin/bash
docker run --rm -it -v "$(pwd)":/app/work creationsglobal/frame:latest "$@"
```
frame.sh

Make sure above script is executable:

```
$ chmod +x frame.sh
```

This script will (first time only) pull the Frame Docker Image from DockerHub, run it as a Container interactively (hence ```-it```), mount the current directory as a volume inside the Frame Docker Container (path: ```/app/work```) and destroy the Frame Docker Container as soon as the command has been completed (hence ```-rm```).

Now when we want to see the ```help``` information of frame, simply run the following command in a terminal of a computer on which Docker is installed and has access to Docker Hub.

```
$ ./frame.sh
```

You should be prompted with something similar to:

```
Unable to find image 'creationsglobal/frame:latest' locally
latest: Pulling from creationsglobal/frame
c6a83fedfae6: Pull complete 
4e7c96a80194: Pull complete 
17469ffba11c: Pull complete 
4f4fb700ef54: Pull complete 
Digest: sha256:abb9eccb111a2059c4876759a24245db02ad295b1608d3a4634ec250f38d9640
Status: Downloaded newer image for creationsglobal/frame:latest


  ______                        
 |  ____|                       
 | |__ _ __ __ _ _ __ ___   ___ 
 |  __| '__/ _` | '_ ` _ \ / _ \
 | |  | | | (_| | | | | | |  __/
 |_|  |_|  \__,_|_| |_| |_|\___|
                                       
Frame - Tagline


Documentation: https://creations.global/frame
Docker Images: https://hub.docker.com/r/creationsglobal/frame <---- To Do: Consider changing to Github Container Registry
Sourcecode: https://github.com/creations-global/frame
License: Open-Source (MIT License)
Version: 1.0.0 (20240730113903)


Usage: frame [options]


Options:

  -background string
        background pdf file (default "background.pdf")
  -create-editing-support
        just create some editing support stuff in the output directory
  -create-example-model
        just create an example model named frame-example-model.yaml in the output directory
  -create-stub-model
        just create a minimal stub model named frame-stub-model.yaml in the output directory
  -custom-risk-rules-plugins string
        comma-separated list of plugins (.so shared object) file names with custom risk rules to load
  -diagram-dpi int
        DPI used to render: maximum is 240 (default 120)
  -execute-model-macro string
        Execute model macro (by ID)
  -explain-model-macros
        Detailed explanation of all the model macros
  -explain-risk-rules
        Detailed explanation of all the risk rules
  -explain-types
        Detailed explanation of all the types
  -generate-data-asset-diagram
        generate data asset diagram (default true)
  -generate-data-flow-diagram
        generate data-flow diagram (default true)
  -generate-report-pdf
        generate report pdf, including diagrams (default true)
  -generate-risks-excel
        generate risks excel (default true)
  -generate-risks-json
        generate risks json (default true)
  -generate-stats-json
        generate stats json (default true)
  -generate-tags-excel
        generate tags excel (default true)
  -generate-technical-assets-json
        generate technical assets json (default true)
  -ignore-orphaned-risk-tracking
        ignore orphaned risk tracking (just log them) not matching a concrete risk
  -list-model-macros
        print model macros
  -list-risk-rules
        print risk rules
  -list-types
        print type information (enum values to be used in models)
  -model string
        input model yaml file (default "frame.yaml")
  -output string
        output directory (default ".")
  -print-3rd-party-licenses
        print 3rd-party license information
  -print-license
        print license information
  -raa-plugin string
        RAA calculation plugin (.so shared object) file name (default "raa.so")
  -server int
        start a server (instead of commandline execution) on the given port
  -skip-risk-rules string
        comma-separated list of risk rules (by their ID) to skip
  -verbose
        verbose output
  -version
        print version


Examples:

If you want to create an example model (via docker) as a starting point to learn about Frame just run: 
 docker run --rm -it -v "$(pwd)":/app/work creationsglobal/frame -create-example-model -output /app/work

If you want to create a minimal stub model (via docker) as a starting point for your own model just run: 
 docker run --rm -it -v "$(pwd)":/app/work creationsglobal/frame -create-stub-model -output /app/work

If you want to execute Frame on a model yaml file (via docker): 
 docker run --rm -it -v "$(pwd)":/app/work creationsglobal/frame -verbose -model /app/work/frame.yaml -output /app/work

If you want to run Frame as a server (REST API) on some port (here 8080): 
 docker run --rm -it --shm-size=256m -p 8080:8080 --name frame-server --mount 'type=volume,src=frame-storage,dst=/data,readonly=false' creationsglobal/frame -server 8080

If you want to find out about the different enum values usable in the model yaml file: 
 docker run --rm -it creationsglobal/frame -list-types

If you want to use some nice editing help (syntax validation, autocompletion, and live templates) in your favourite IDE: 
 docker run --rm -it -v "$(pwd)":/app/work creationsglobal/frame -create-editing-support -output /app/work

If you want to list all available model macros (which are macros capable of reading a model yaml file, asking you questions in a wizard-style and then update the model yaml file accordingly): 
 docker run --rm -it creationsglobal/frame -list-model-macros

If you want to execute a certain model macro on the model yaml file (here the macro add-build-pipeline): 
 docker run --rm -it -v "$(pwd)":/app/work creationsglobal/frame -model /app/work/frame.yaml -output /app/work -execute-model-macro add-build-pipeline
```

**NOTE**: For the Text-to-Ascii in the help information we used https://patorjk.com/software/taag/#p=display&f=Big&t=Frame

If you want to provide parameters for certain functionality, you can append those at the end of the command, like so:

```
$ ./frame.sh --foo=bar
```

MORE ...
