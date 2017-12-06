#!/bin/bash
fly -t concourse set-pipeline -p windowsstem-2012 -c windowsstem.yml --load-vars-from ../../secrets.yml
