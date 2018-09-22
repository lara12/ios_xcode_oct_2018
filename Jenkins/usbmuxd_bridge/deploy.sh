#!/usr/bin/env bash

_SELF_PATH=`dirname "$(pwd)/$0"`
HS_TOOLS_HOME=`realpath "$_SELF_PATH"`

filter=$1


function plist_path_to_host_sub() {
    echo "$1" | sed 's/.*io.headspin.ios_bridge_\(.*\).plist/\1/'
}

function host_sub_to_geo() {
    echo "$1" | sed 's/proxy-\(.*\)-[0-9]\+/\1/'
}


function deploy() {
    target_host_sub=$1
    target_geo=`host_sub_to_geo $target_host_sub`

    plist_path="$HS_TOOLS_HOME/units/io.headspin.ios_bridge_${target_host_sub}.plist"
    if [[ ! -e "$plist_path" ]]; then
        >&2 echo "Unit does not exist \"$plist_path\""
        return 1
    fi
    port=`grep -e '<string>[0-9]\+</string>' "$plist_path" | sed 's:.*<string>\(.*\)</string>.*:\1:'`

    if [[ ! -e "$HS_TOOLS_HOME/certs/${target_geo}_server.pem" ]]; then
        (cd $HS_TOOLS_HOME; ./mkcert $target_geo server)
    fi
    if [[ ! -e "$HS_TOOLS_HOME/certs/${target_geo}_client.crt" ]]; then
        (cd $HS_TOOLS_HOME; ./mkcert $target_geo client)
    fi

    echo "Deploying $target_host_sub (port $port) ..."

    mkdir -p $HS_TOOLS_HOME/.push
    target_internal_host="${target_host_sub}-i.headspin.io"
    _ssh="ssh -F $HEADSPIN_HOME/keys-red/dev/ssh-config"
    _scp="scp -F $HEADSPIN_HOME/keys-red/dev/ssh-config"
    $_ssh pbox@$target_internal_host "/usr/local/bin/brew update > /dev/null; /usr/local/bin/brew install socat"
    $_ssh pbox@$target_internal_host "mkdir -p /Users/pbox/headspinio-remotecontrol/certs"
    $_scp $HS_TOOLS_HOME/certs/${target_geo}_server.pem pbox@$target_internal_host:/Users/pbox/headspinio-remotecontrol/certs/usbmuxd_server.pem
    $_scp $HS_TOOLS_HOME/certs/${target_geo}_client.crt pbox@$target_internal_host:/Users/pbox/headspinio-remotecontrol/certs/usbmuxd_client.crt
    cp $HS_TOOLS_HOME/io.headspin.usbmuxd_bridge.plist $HS_TOOLS_HOME/.push/io.headspin.usbmuxd_bridge.plist
    sed -i "s/\$EXTERNAL_USBMUXD_PORT/$port/g" $HS_TOOLS_HOME/.push/io.headspin.usbmuxd_bridge.plist
    $_scp $HS_TOOLS_HOME/.push/io.headspin.usbmuxd_bridge.plist pbox@$target_internal_host:/Users/pbox/Library/LaunchAgents/io.headspin.usbmuxd_bridge.plist
    $_ssh pbox@$target_internal_host "chmod u=rw,go=r /Users/pbox/Library/LaunchAgents/io.headspin.usbmuxd_bridge.plist"
    $_ssh pbox@$target_internal_host "launchctl unload /Users/pbox/Library/LaunchAgents/io.headspin.usbmuxd_bridge.plist"
    $_ssh pbox@$target_internal_host "launchctl load /Users/pbox/Library/LaunchAgents/io.headspin.usbmuxd_bridge.plist"
    echo "  deployed $target_geo:$port"
    echo "  unit $target_internal_host:/Users/pbox/Library/LaunchAgents/io.headspin.usbmuxd_bridge.plist"
}


# all hosts
for plist_path in "$HS_TOOLS_HOME"/units/io.headspin.ios_bridge_*.plist; do
    host_sub=`plist_path_to_host_sub "$plist_path"`
    if [[ ! "$filter" || "$filter" == "$host_sub" ]]; then
        deploy $host_sub
    else
        >&2 echo "Skipping $host_sub"
    fi
done
