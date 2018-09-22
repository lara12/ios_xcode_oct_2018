cd ..

WORKSPACE="orderMe.xcworkspace"
SCHEME="orderMe"

API_KEY='5d0fab03cfdfe7cc226ea2d20f67e431b3a3e96e'
SECRET='2906fe386f0925971771ae22678c399eb7ce309965acfe92281f2951f995f912'

archive() {
    echo "Jenkins.sh: Start archiving"
    xcodebuild -workspace $WORKSPACE -scheme $SCHEME -archivePath orderme.xcarchive archive
    echo "Jenkins.sh: Exporting archive"
    xcodebuild -exportArchive -archivePath orderme.xcarchive -exportPath ordermeproduct -exportOptionsPlist orderMe/Info.plist
}

beta() {
    echo "Jenkins.sh: Exporting archive"
    Pods/Crashlytics/submit "${API_KEY}" "${SECRET}" \
    -ipaPath ordermeproduct/orderMe.ipa -emails bogdankosh@gmail.com \
    -notifications YES
}

archive
beta
