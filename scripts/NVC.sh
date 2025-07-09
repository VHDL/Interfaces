#!/bin/bash
# ==================================================================================================================== #
# Copyright 2016-2025 Open Source VHDL Group                                                                           #
#                                                                                                                      #
# Licensed under the Apache License, Version 2.0 (the "License");                                                      #
# you may not use this file except in compliance with the License.                                                     #
# You may obtain a copy of the License at                                                                              #
#                                                                                                                      #
#    http://www.apache.org/licenses/LICENSE-2.0                                                                        #
#                                                                                                                      #
# Unless required by applicable law or agreed to in writing, software                                                  #
# distributed under the License is distributed on an "AS IS" BASIS,                                                    #
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.                                             #
# See the License for the specific language governing permissions and                                                  #
# limitations under the License.                                                                                       #
# ==================================================================================================================== #
CompileOrderList="${1:-../compileorder.list}"
UnittestSummaryFile="${2:-unittest.xml}"
UnittestTestsuitename="${3:-Interfaces}"

printf "Open '${UnittestSummaryFile}' ...\n"
exec 3>${UnittestSummaryFile}

printf "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"                      >&3
printf "<testsuites time=\"%%TIME%%\">\n"                                    >&3
printf "\t<testsuite name=\"${UnittestTestsuitename}\" time=\"%%TIME%%\">\n" >&3

libraryBegin=$(date +%s%N)
while read -r packagePath; do
	package=$(basename "${packagePath}")
	testname="$package"
	classname=$(dirname "${packagePath}" | sed 's|/|.|g')

	printf "Analyzing '${packagePath}' ... "
	analyzeBegin=$(date +%s%N)
	output=$(nvc --std=2019 -a "../${packagePath}")
	retCode=$?
	duration=$((($(date +%s%N) - ${analyzeBegin})/1000))
	if [[ $retCode -eq 0 ]]; then
		printf "  OK\n"
		printf "\t\t<testcase name=\"${testname}\" classname=\"${classname}\" time=\"${duration}\" />\n" >&3
	else
		printf "  FAILED\n"
		printf "\t\t<testcase name=\"${testname}\" classname=\"${classname}\" time=\"${duration}\" >\n"  >&3
		printf "\t\t\t<failure>${output}</failure>\n"                                                    >&3
		printf "\t\t</testcase>\n"                                                                       >&3
	fi
done < <(grep -vP '^\s*$|^\s*\#' ${CompileOrderList})
duration=$((($(date +%s%N) - ${libraryBegin})/1000))

printf "\t</testsuite>\n" >&3
printf "</testsuites>\n"  >&3
exec 3>-

printf "Duration: ${duration} s\n"
sed -i "s/%%TIME%%/${duration}/g" ${UnittestSummaryFile}

printf "=========================\n"
cat ${UnittestSummaryFile}
printf "=========================\n"
