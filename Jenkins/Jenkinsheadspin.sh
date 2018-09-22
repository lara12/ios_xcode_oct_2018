
#cd usbmuxd_bridge
#echo -e "qatraining01" | sudo -S ./hsiosbridge on proxy-us-sf-4
#cd ../..

cd ..
livestub=$1
DESTINATION="id=1bdca0cc57a0a1b4590b3e620b801665a0312e72"
DESTINATION2="id=af8af5a5dd11f2c3a643b644bca201a2decb1f4b"
DESTINATION3="id=0a61558c1715bae4fe225aedc19c0be8539ca71a"
WORKSPACE="orderMe.xcworkspace"

SCHEME="orderMeLiveTest"
XCTESTRUN_PATH=Jenkins/build/Build/Products/${SCHEME}_iphoneos11.2-arm64.xctestrun

build() {
    rm -rf Jenkins/build
    rm -rf Jenkins/reports
    mkdir -p Jenkins/build
    echo "Jenkins.sh: Building binaries"
    xcodebuild \
    -workspace "${WORKSPACE}" \
    -scheme "${SCHEME}" \
    -destination "${DESTINATION}" \
    -derivedDataPath ./Jenkins/build clean build-for-testing
}

run() {
    echo "Jenkins.sh: Start xctestrun"

    rm -rf Jenkins/build/reports

    xcodebuild test-without-building  \
    -xctestrun ${XCTESTRUN_PATH} \
    -destination "${DESTINATION}" | xcpretty -r junit -r html
}


#build
curl -X POST https://33b82400d3744656a1cdb7a564274ec6@api-dev.headspin.io/v0/idevice/1bdca0cc57a0a1b4590b3e620b801665a0312e72/lock
curl -X POST https://33b82400d3744656a1cdb7a564274ec6@api-dev.headspin.io/v0/sessions -d '{"session_type": "capture", "device_address": "1bdca0cc57a0a1b4590b3e620b801665a0312e72", "allow_replace": true}'

run

curl -X PATCH https://33b82400d3744656a1cdb7a564274ec6@api-dev.headspin.io/v0/sessions/{session_id} -d '{"active": false}'
curl -X POST https://33b82400d3744656a1cdb7a564274ec6@api-dev.headspin.io/v0/idevice/1bdca0cc57a0a1b4590b3e620b801665a0312e72/unlock

#cd Jenkins/usbmuxd_bridge
#echo -e "qatraining01" | sudo -S ./hsiosbridge off
#cd ../..s

