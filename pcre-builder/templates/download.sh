#!/bin/bash
set -e

path=sourceforge.net/projects/pcre/files/pcre/{{ .pack.version }}
srcName=pcre-{{ .pack.version }}.tar.gz
cacheDir="/root/$path"
artefactPath="${cacheDir}/${srcName}"
mkdir -p "${cacheDir}"
if [ ! -f "${artefactPath}" ]; then
	wget "https://${path}/${srcName}" -O "$artefactPath"
fi
#chown -R {{ .pack.xbeeUser }}:{{ .pack.xbeeGroup }}
tar xf "${artefactPath}" -C /usr/src
