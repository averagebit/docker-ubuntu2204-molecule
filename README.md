# Ubuntu 22.04 (Docker Image)

[![CI](https://github.com/averagebit/docker-ubuntu2204-molecule/workflows/Release/badge.svg?branch=main&event=push)](https://github.com/averagebit/docker-molecule-ubuntu2204/actions?query=workflow%3ARelease) [![Docker pulls](https://img.shields.io/docker/pulls/averagebit/docker-ubuntu2204-molecule)](https://hub.docker.com/r/averagebit/docker-ubuntu2204-molecule/)

## Description

Ubuntu 22.04 (Jammy Jellyfish) Docker image for testing Ansible roles with [Molecule](https://molecule.readthedocs.io/en/latest/index.html).

## Usage

```yaml
# molecule.yml
dependency:
  name: galaxy
driver:
  name: docker
platforms:
  - name: instance
    image: "averagebit/docker-${MOLECULE_DISTRO:-ubuntu2204}-molecule:latest"
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:ro
    tmpfs:
      - /tmp
      - /run
    capabilities:
      - SYS_ADMIN
    privileged: true
    pre_build_image: true
provisioner:
  name: ansible
  playbooks:
    converge: ${MOLECULE_PLAYBOOK:-converge.yml}
```

## Legal

Copyright 2022 averagebit <[averagebit@pm.me](mailto:averagebit@pm.me)>

Licensed under the Apache License, Version 2.0 (the "License"); you may
not use this file except in compliance with the License. You may obtain
a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
