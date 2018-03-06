# Copyright 2014 Netflix, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM netflixoss/java:8
LABEL maintainer="paolo.contessi@gmail.com"

RUN apt-get -qq update &&\
    apt-get -qq -y install ca-certificates &&\
    mkdir -p /apps/atlas &&\
    wget -q -P /apps/atlas 'https://github.com/Netflix/atlas/releases/download/v1.5.3/atlas-1.5.3-standalone.jar' &&\
    wget -q -P /apps/atlas 'https://raw.githubusercontent.com/Netflix/atlas/v1.5.x/conf/memory.conf'

EXPOSE 7101

ENTRYPOINT ["/usr/bin/java", "-jar", "/apps/atlas/atlas-1.5.3-standalone.jar", "/apps/atlas/memory.conf"]

CMD ["run"]