cd ..

livestub=$1
DESTINATION='platform=iOS Simulator,name=iPhone 8,OS=latest'
WORKSPACE="orderMe.xcworkspace"
SDK="iphonesimulator"
if [ livestub == "live" ]; then SCHEME="orderMeLiveTest"; else SCHEME="orderMeStubTest"; fi
XCTESTRUN_PATH=Jenkins/build/Build/Products/orderMeStubTest_iphonesimulator*x86_64.xctestrun

run() {
    echo "Jenkins.sh: Start xctestrun"

    rm -rf Jenkins/build/reports

    xcodebuild test-without-building  \
    -xctestrun ${XCTESTRUN_PATH} \
    -destination "${DESTINATION}" | xcpretty -r junit -r html
}

run
