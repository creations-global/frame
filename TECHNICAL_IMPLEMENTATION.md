# Technical Implementation

Based on "Threagile" at https://treagile.io

Based on "Threagile on Github" at https://github.com/threagile

## Introduction

Create Frame as a Docker Image. It can be pulled from a Docker Image host (such as Docker Hub).

Within a script (e.g. frame.sh) the creation of the Frame Docker Container is handled:

```
#!/bin/bash
docker run --rm -it -v "$(pwd)":/app/work frame/frame "$@"
```
frame.sh

Make sure above script is executable:

```
$ chmod +x frame.sh
```

Now when we want to see the ```help``` information of frame, simply run the folliwing command in a terminal of a computer on which Docker is installed and has access to Docker Hub.

```
$ ./frame.sh
```

You should be prompted with something similar to:

```

```

If you want to provide parameters for certain functionality, you can append those at the end of the command, like so:

```
$ ./frame.sh --foo=bar
```

MORE ...
