#!/bin/bash
# Copyright (C) 2019, Apertium Project Management Committee <apertium-pmc@dlsi.ua.es>
# Licensed under the GNU GPL version 2 or later; see http://www.gnu.org/licenses/

echo ""
echo "Building $1 from $2"
echo ""

timeout 120m docker run --rm --network none --user '1234:1234' -v "$2/:/build/" --name "$1" "$1" /build/build.sh 2>&1 | tee $2/build.log
EC=$?
if [ $EC -ne 0 ]; then
	docker stop -t 10 "$1"
	docker rm -f "$1"
fi
exit $EC
