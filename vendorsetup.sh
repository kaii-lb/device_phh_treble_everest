#!/bin/sh

ROOTDIR=~/everestos-kaii
TOKEN=$(cat $ROOTDIR/keytoken.txt)

resetAllPatches() {
	$ROOTDIR/treblestuff/patches/apply.sh . personal --reset
	$ROOTDIR/treblestuff/patches/apply.sh . pickedout --reset
	$ROOTDIR/treblestuff/patches/apply.sh . trebledroid --reset
}

applyAllPatches() {
	$ROOTDIR/treblestuff/patches/apply.sh . personal
	$ROOTDIR/treblestuff/patches/apply.sh . pickedout
	$ROOTDIR/treblestuff/patches/apply.sh . trebledroid
}

# clone in everest patches and sepolicies (not used for now)
rm -rf treblestuff/
git clone https://github.com/kaii-lb/treble_everest.git treblestuff/ && echo && echo "--> Added necessary treble patches and sepolicies"

resetAllPatches

if [[ ! -z "${TOKEN}" ]]; then
	# signing no longer needed cuz pif passes without it now but still
	rm -rf vendor/lineage/signing/keys
	git clone "https://${TOKEN}@github.com/kaii-lb/everestos_keys.git" vendor/lineage/signing/keys && echo && echo "--> Added personal signing keys"
else
	echo "--> No token provided! Skipping signing keys cloning..."
fi

applyAllPatches

cp -v $ROOTDIR/treblestuff/TrebleApp.apk $ROOTDIR/vendor/hardware_overlay/TrebleApp/app.apk && echo "--> Copied TrebleApp.apk"

export TARGET_RELEASE=ap2a
