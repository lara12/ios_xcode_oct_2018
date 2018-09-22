cd ..

WORKSPACE="orderMe.xcworkspace"
SCHEME="orderMe"

run() {
    echo "Jenkins.sh: Start archiving"
    xcodebuild -workspace $WORKSPACE -scheme $SCHEME -archivePath orderme.xcarchive archive
    echo "Jenkins.sh: Exporting archive"
    xcodebuild -exportArchive -archivePath orderme.xcarchive -exportPath ordermeproduct -exportOptionsPlist orderMe/Info.plist
}

run
