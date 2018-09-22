#!/usr/bin/env bash

if [[ "0" != "$EUID" ]]; then
    >&2 echo "error: must run as root"
    exit 1
fi

geo=$1

function usage() {
    >&2 echo "Usage:"
    >&2 echo "  forward_usbmuxd.sh off"
    >&2 echo "  forward_usbmuxd.sh <geo> <port>"
}

if [[ ! "$geo" ]]; then
    usage
    exit 1
fi

if [[ ! "$HS_TOOLS_HOME" ]]; then
    >&2 echo "error: HS_TOOLS_HOME is not defined."
    exit 1
fi

SOCAT_BIN='/usr/local/bin/socat'

if [[ "off" == "$geo" ]]; then
    if [[ -e "/var/run/usbmuxd.system" ]]; then
        mv /var/run/usbmuxd.system /var/run/usbmuxd
    elif [[ -e "/var/run/usbmuxd" ]]; then
        rm /var/run/usbmuxd
    fi
else
    # on
    port=$2
    if [[ ! "$port" ]]; then
        usage
        exit 1
    fi
    if [[ -e "/var/run/usbmuxd" ]]; then
        mv /var/run/usbmuxd /var/run/usbmuxd.system
    fi
    # debugging
    # echo "$SOCAT_BIN UNIX-LISTEN:/var/run/usbmuxd,fork,unlink-early,mode=777 OPENSSL-CONNECT:${geo}.headspin.io:${port},cert=$HS_TOOLS_HOME/certs/${geo}_client.pem,cafile=$HS_TOOLS_HOME/certs/${geo}_server.crt"
    $SOCAT_BIN \
        UNIX-LISTEN:/var/run/usbmuxd,fork,unlink-early,mode=777 \
        "OPENSSL-CONNECT:${geo}.headspin.io:${port},cert=$HS_TOOLS_HOME/certs/${geo}_client.pem,cafile=$HS_TOOLS_HOME/certs/${geo}_server.crt"
fi
