#!/bin/bash
VERSION="13"
VERSION_2="130"
DISTROS=( unstable buster bullseye bionic focal groovy hirsute )
for d in "${DISTROS[@]}"
do
	echo $d
	sh create-new-job.sh $d $VERSION release/$VERSION.x $VERSION
# sh create-new-job.sh unstable 3.5 release_35 3.5
	if test "$d" == "unstable"; then
		d=""
	else
		d="-$d"
	fi
	echo "sed -i -e 's|llvm-toolchain$d-binaries,|llvm-toolchain$d-binaries, llvm-toolchain$d-$VERSION-binaries,|' ../llvm-toolchain$d-binaries-sync/config.xml"
done
echo "update the sync job to upload the version"
echo "Disable i386 on recent versions of Ubuntu"
