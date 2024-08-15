#!/bin/bash
docker run --rm -it -v "$(pwd)":/app/work creations-global/frame:latest "$@"
