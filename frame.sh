#!/bin/bash
docker run --rm -it -v "$(pwd)":/app/work creationsglobal/frame:latest "$@"
