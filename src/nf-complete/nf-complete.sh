#!/bin/bash
_nf_complete(){
	local cmd_line=${READLINE_LINE}
	local -a words=(${cmd_line})
	if [[ "${words[0]}" == "nextflow" ]] && [[ "${words[1]}" == "run" ]] && [[ "${words[2]}" == *.nf ]]; then
		nf_script="${words[2]}"
		selected=$(awk '
			/"""/ { inDoc = !inDoc; next}
			inDoc && /^Options/ { inOpt = 1; next }
			inDoc && inOpt && /\s*-/ { print }
			inDoc && !inOpt && /^$/ { inOpt = 0 }
			' ${nf_script} | sed 's/^\s//' | fzf --height 20% --reverse --header="${cmd_line}" | awk -F " " '{print $1}')
		READLINE_LINE="${READLINE_LINE:0:$READLINE_POINT}${selected} ${READLINE_LINE:$READLINE_POINT}"
		READLINE_POINT=$(( READLINE_POINT + ${#selected} + 1 ))
	fi
}

bind -x '"\C-n":_nf_complete'