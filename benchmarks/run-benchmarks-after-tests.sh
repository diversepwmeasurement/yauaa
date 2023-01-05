#!/usr/bin/env bash
#
# Yet Another UserAgent Analyzer
# Copyright (C) 2013-2023 Niels Basjes
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an AS IS BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

( cd .. && mvn clean install -DskipTests=true && mvn test ) || exit
version=$(grep -F '<version>' pom.xml | head -1 | sed 's@.*>\(.*\)<.*$@\1@g')
echo "Testing version ${version}" && \
java -jar target/benchmarks.jar > "results/version-${version}-$(date +%Y%m%d-%H%M%S).txt"
