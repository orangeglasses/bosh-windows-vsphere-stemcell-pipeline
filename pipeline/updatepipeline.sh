#!/bin/bash
fly -t concourse set-pipeline -p windowsstem -c windowsstem.yml --load-vars-from ../../secrets.yml
