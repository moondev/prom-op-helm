#!/bin/bash

multipass delete --all -p

multipass launch -n master -c 2 -d 30G -m 4G x
multipass launch -n worker-1 -c 2 -d 30G -m 4G x
multipass launch -n worker-2 -c 2 -d 30G -m 4G x
multipass launch -n worker-3 -c 2 -d 30G -m 4G x

multipass mount `pwd`/scripts master:/scripts
multipass mount `pwd`/scripts worker-1:/scripts
multipass mount `pwd`/scripts worker-2:/scripts
multipass mount `pwd`/scripts worker-3:/scripts

multipass exec master -- /scripts/run.sh
multipass exec worker-1 -- /scripts/run.sh
multipass exec worker-2 -- /scripts/run.sh
multipass exec worker-3 -- /scripts/run.sh

multipass exec master -- /scripts/run-init.sh

multipass exec worker-1 -- /scripts/run-join.sh
multipass exec worker-2 -- /scripts/run-join.sh
multipass exec worker-3 -- /scripts/run-join.sh

multipass exec master -- /scripts/run-addons.sh