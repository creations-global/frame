#!/bin/bash
docker run --rm -it -v "$(pwd)":/app/work frame/frame:latest "$@"
