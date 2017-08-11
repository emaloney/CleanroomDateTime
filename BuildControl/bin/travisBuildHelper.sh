#!/bin/bash

set -o pipefail

if [[ $# != 2 ]]; then
	echo "error: Expecting 2 arguments; <operation> <platform>"
	exit 1
fi

OPERATION="$1"
PLATFORM="$2"

#
# this function compensates for the fact that macOS is still on bash 3.x
# and therefore a more sensible implementation using associative
# arrays is not currently possible
#
runDestinationForPlatform()
{
	case $1 in
	iOS)
		SIMULATOR_ID=`xcrun simctl list | grep -v unavailable | grep "iPad Pro" | tail -1 | sed "s/^.*inch) (//" | sed "s/).*$//"`
		echo "id=$SIMULATOR_ID"
		;;

	macOS)
		echo "platform=macOS"
		;;

	tvOS)
		SIMULATOR_ID=`xcrun simctl list | grep -v unavailable | grep "Apple TV" | tail -1 | sed "s/) (.*)\$//" | sed "s/^.*(//"`
		echo "id=$SIMULATOR_ID"
		;;

	watchOS)
		SIMULATOR_ID=`xcrun simctl list | grep -v unavailable | grep -v "Watch:" | grep "Apple Watch Series" | tail -1 | sed "s/) (.*)\$//" | sed "s/^.*(//"`
		echo "id=$SIMULATOR_ID"
		;;

	esac
}

case $OPERATION in
	build)
		MAXIMUM_TRIES=1
		XCODE_ACTION="clean build";;

	test)
		MAXIMUM_TRIES=3
		XCODE_ACTION="test";;

	*)
		echo "error: Unknown operation: $OPERATION"
		exit 1;;
esac

DESTINATION=$(runDestinationForPlatform $PLATFORM)

#
# this retry loop is an unfortunate hack; Travis unit tests periodically fail
# without explanation with an exit code of 65. Sometimes this is just a temporary
# glitch and re-trying will succeed. We retry a few times if we keep hitting 65
# to avoid the temporary error. If it fails enough times, we assume it's a 'real'
# failure
#
THIS_TRY=0
while [[ $THIS_TRY < $MAXIMUM_TRIES ]]; do
	THIS_TRY=$(( $THIS_TRY + 1 ))
	if [[ $MAXIMUM_TRIES > 1 ]]; then
		echo "Attempt $THIS_TRY of $MAXIMUM_TRIES..."
	fi

	( set -o pipefail && xcodebuild -project CleanroomDateTime.xcodeproj -configuration Debug -scheme "CleanroomDateTime" -destination "$DESTINATION" -destination-timeout 300 $XCODE_ACTION 2>&1 | tee "CleanroomDateTime-$PLATFORM-$OPERATION.log" | xcpretty )
	XCODE_RESULT="${PIPESTATUS[0]}"
	if [[ "$XCODE_RESULT" == "0" ]]; then
		rm "CleanroomDateTime-$PLATFORM-$OPERATION.log"
		exit 0
	elif [[ "$XCODE_RESULT" != "65" ]]; then
		echo "Failed with exit code $XCODE_RESULT."
		exit $XCODE_RESULT
	elif [[ $MAXIMUM_TRIES > 1 && $THIS_TRY < $MAXIMUM_TRIES ]]; then
		echo "Failed with exit code 65. This may be a transient error; trying again."
		echo
	fi
done

exit $XCODE_RESULT
