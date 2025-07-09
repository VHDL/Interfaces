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
VHDLLibrary="Interfaces"

UnittestSummaryFile="${2:-unittest.xml}"
UnittestTestsuitename="${3:-Interfaces}"

printf "Open '${UnittestSummaryFile}' ...\n"
exec 3>${UnittestSummaryFile}

printf "%s\n" "Analyzing '${VHDLLibrary}' ..."

printf "<?xml version=\"%s\" encoding=\"%s\"?>\n" "1.0" "utf-8"                       >&3
printf "<testsuites time=\"%s\">\n"               "%TIME%"                            >&3
printf "  <testsuite name=\"%s\" time=\"%s\">\n"  "${UnittestTestsuitename}" "%TIME%" >&3

libraryBegin=$(date +%s%N)
while read -r packagePath; do
	package=$(basename "${packagePath}")
	testname="$package"
	classname=$(dirname "${packagePath}" | sed 's|/|.|g')

	printf "  %-60s " "Analyzing '${packagePath}' ..."
	analyzeBegin=$(date +%s%N)
	output=$(nvc --std=2019 -a "../${packagePath}")
	retCode=$?
	duration=$((($(date +%s%N) - ${analyzeBegin})/1000000000))
	printf "    <testcase name=\"%s\" classname=\"%s\" time=\"%s\"" "${testname}" "${classname}" "${duration}" >&3
	if [[ $retCode -eq 0 ]]; then
		printf "  OK\n"
		printf " />\n"                                      >&3
	else
		printf "  FAILED\n"
		printf " >\n"                                       >&3
		printf "      <failure>%s</failure>\n" "${output}"  >&3
		printf "    </testcase>\n"                          >&3
	fi
done < <(grep -vP '^\s*$|^\s*\#' ${CompileOrderList})
duration=$((($(date +%s%N) - ${libraryBegin})/1000000000))

printf "  </testsuite>\n"   >&3
printf "</testsuites>\n"    >&3
exec 3>-

printf "Duration: %s s\n\n" "${duration}"
sed -i "s/%TIME%/${duration}/g" ${UnittestSummaryFile}

printf "=========================\n"
cat ${UnittestSummaryFile}
printf "=========================\n"
