#!/bin/bash
exec 2>&-

# Assign variables
VST3="${base}/VST3"
VST2="${base}/VST"
AU="${base}/Components"
VST3Paths=()
VST2Paths=()
AUPaths=()

filenames="$(find "${VST3}" -type d | sort -V | grep "/Contents/MacOS" | sed 's! !\\ !g')"
IFS=$'\n' read -r -d '' -a filenames <<< "$filenames"
for filename in "${filenames[@]}"; do
	VST3Paths+=("$filename")
done

for v in "${VST3Paths[@]}"; do
	u="$(find "${v}" -type f | sort -V)"
	j=$'\n' read -r -d '' -a q <<< "$u"
	for y in "${q[@]}"; do
		file "${y}" | tee -a VST3_Results.log
		printf "\n" | tee -a VST3_Results.log
	done
done

######################################################

filenames2="$(find "${VST2}" -type d | sort -V | grep "/Contents/MacOS" | sed 's! !\\ !g')"
IFS2=$'\n' read -r -d '' -a filenames2 <<< "$filenames2"
for filename in "${filenames2[@]}"; do
	VST2Paths+=("$filename")
done

for v in "${VST2Paths[@]}"; do
	d="$(find "${v}" -type f | sort -V)"
	p=$'\n' read -r -d '' -a h <<< "$u"
	for y in "${h[@]}"; do
		file "${y}" | tee -a VST2_Results.log
		printf "\n" | tee -a VST2_Results.log
	done
done

######################################################

filenames3="$(find "${AU}" -type d | sort -V | grep "/Contents/MacOS" | sed 's! !\\ !g')"
IFS3=$'\n' read -r -d '' -a filenames3 <<< "$filenames3"
for filename in "${filenames3[@]}"; do
	AUPaths+=("$filename")
done

for v in "${AUPaths[@]}"; do
	u="$(find "${v}" -type f | sort -V)"
	m=$'\n' read -r -d '' -a q <<< "$u"
	for y in "${q[@]}"; do
		file "${y}" | tee -a AU_Results.log
		printf "\n" | tee -a AU_Results.log
	done
done


