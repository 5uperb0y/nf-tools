#!/bin/bash
extract_available_options () {
	awk '
		/"""/ { inDoc = !inDoc; next}
		inDoc && /^Options/ { inOpt = 1; next }
		inDoc && inOpt && /\s*-/ { print }
		inDoc && !inOpt && /^$/ { inOpt = 0 }
		' "$1"
}
append_to_cmd () {
	local text="$1"
	READLINE_LINE="${READLINE_LINE}${text} "
	READLINE_POINT=$(( READLINE_POINT + ${#text} + 1 ))
}
_nf_complete(){
	local cmd="${READLINE_LINE}"
	local -a words=(${cmd})
	if [[ "${words[0]}" == "nextflow" && "${words[1]}" == "run" && "${words[2]}" == *.nf ]]; then
		local nf_script="${words[2]}"
		local cmd_options=$(echo "${cmd}" | grep -o -E -- "--?\w*")
		local exclusions=$(echo ${cmd_options} | sed 's/ /|/g') 
		local options=$(extract_available_options "${nf_script}" | grep -v -E -- "${exclusions:-\$^}")
		local selected_option=$(
			echo "${options}" |\
			sed 's/^\s//' |\
			fzf --height 20% --reverse --header="${cmd}" |\
			awk -F " " '{print $1}'
			)
		append_to_cmd "${selected_option}"
	fi
}

bind -x '"\C-n":_nf_complete'