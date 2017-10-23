#!/usr/bin/env bash

# Copyright 2017 F5 Networks Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -x

set +e

# Setup container mailbox for ansible playbooks
./prepare_controller.sh

# Optionally install heat plugins
if [[ ${HA_TYPE} == "pair" ]]; then
  ./ansible_install_heat_plugins.sh
  /tools/bin/tlc --session ${TEST_SESSION} --debug cmd configure_cluster
fi

# Install lbaas components
./ansible_install_lbaasv2.sh
