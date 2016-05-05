#!/usr/bin/env bash

/usr/local/bin/tarsnap --fsck --keyfile "{{ item.keypath }}" \
--cachedir "{{ item.cache }}" && \
tarsnapper --config /etc/tarsnapper.yml expire "{{ item.name }}"

