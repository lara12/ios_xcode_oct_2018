cd ..

livestub=$1
DESTINATION='platform=iOS Simulator,name=iPhone 8,OS=latest'
WORKSPACE="orderMe.xcworkspace"
SDK="iphonesimulator"
if [ livestub == "live" ]; then SCHEME="orderMeLiveTest"; else SCHEME="orderMeStubTest"; fi
XCTESTRUN_PATH=Jenkins/build/Build/Products/${SCHEME}_iphonesimulator*x86_64.xctestrun

build() {
    rm -rf Jenkins/build
    rm -rf Jenkins/reports
    mkdir -p Jenkins/build
    echo "Jenkins.sh: Building binaries"
    xcodebuild \
    -workspace "${WORKSPACE}" \
    -scheme "${SCHEME}" \
    -sdk "${SDK}" \
    -destination "${DESTINATION}" \
    -derivedDataPath ./Jenkins/build clean build-for-testing
}

build
