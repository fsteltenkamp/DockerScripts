# Bash completion for DockerScripts (dvbr, dvfbr, dvls, dvsh, dvsmbcr)
#
# Install system-wide (requires the bash-completion package):
#   cp dockerscripts-completion.bash /etc/bash_completion.d/dockerscripts
# Or for your user only, add this to your ~/.bashrc:
#   source /path/to/dockerscripts-completion.bash

_dvs_flags="--update --install"

# list the names of all docker volumes
_dvs_volumes() {
    docker volume ls -q 2>/dev/null
}

# fill COMPREPLY with volume names (or flags, if the current word starts with -)
_dvs_complete_volume() {
    local cur=$1
    if [[ $cur == -* ]]; then
        COMPREPLY=( $(compgen -W "$_dvs_flags" -- "$cur") )
    else
        COMPREPLY=( $(compgen -W "$(_dvs_volumes)" -- "$cur") )
    fi
}

# fill COMPREPLY with paths inside a docker volume, listed by a throwaway container
_dvs_complete_volume_path() {
    local volume=$1 cur=$2 dir="" entry
    # never mount a volume that does not exist, docker would silently create it
    docker volume inspect "$volume" &>/dev/null || return
    [[ $cur == */* ]] && dir=${cur%/*}/
    while IFS= read -r entry; do
        [[ $dir$entry == "$cur"* ]] && COMPREPLY+=("$dir$entry")
    done < <(docker run --rm -v "$volume":/volume:ro alpine ls -1Ap "/volume/$dir" 2>/dev/null)
    # don't add a space after directories, so the user can keep descending
    [[ ${#COMPREPLY[@]} -eq 1 && ${COMPREPLY[0]} == */ ]] && compopt -o nospace
}

_dvbr() {
    local cur=${COMP_WORDS[COMP_CWORD]} mode=${COMP_WORDS[1]} volume=${COMP_WORDS[2]}
    COMPREPLY=()
    case $COMP_CWORD in
        1)
            COMPREPLY=( $(compgen -W "backup restore $_dvs_flags" -- "$cur") )
            ;;
        2)
            [[ $mode == backup || $mode == restore ]] && _dvs_complete_volume "$cur"
            ;;
        3)
            [[ $mode == restore ]] || return
            compopt -o filenames
            # offer the existing backups of this volume first, fall back to regular files
            local backup
            for backup in "/srv/dvbr/$volume"/*.tar.gz; do
                [[ -f $backup && $backup == "$cur"* ]] && COMPREPLY+=("$backup")
            done
            if [[ ${#COMPREPLY[@]} -eq 0 ]]; then
                COMPREPLY=( $(compgen -f -- "$cur") )
            fi
            ;;
    esac
}

_dvfbr() {
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=()
    case $COMP_CWORD in
        1) _dvs_complete_volume "$cur" ;;
        2) COMPREPLY=( $(compgen -W "8000" -- "$cur") ) ;;
    esac
}

# shared by dvls and dvsh: <volume> [subpath]
_dvs_volume_and_subpath() {
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=()
    case $COMP_CWORD in
        1) _dvs_complete_volume "$cur" ;;
        2) _dvs_complete_volume_path "${COMP_WORDS[1]}" "$cur" ;;
    esac
}

_dvsmbcr() {
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=()
    case $COMP_CWORD in
        # the volume is created by dvsmbcr, so existing volumes are not useful here
        1) [[ $cur == -* ]] && COMPREPLY=( $(compgen -W "$_dvs_flags" -- "$cur") ) ;;
        2) COMPREPLY=( $(compgen -A hostname -- "$cur") ) ;;
        6) COMPREPLY=( $(compgen -W "$(id -u)" -- "$cur") ) ;;
        7) COMPREPLY=( $(compgen -W "$(id -g)" -- "$cur") ) ;;
        8) COMPREPLY=( $(compgen -W "0644 0664 0600" -- "$cur") ) ;;
        9) COMPREPLY=( $(compgen -W "0755 0775 0700" -- "$cur") ) ;;
    esac
}

complete -F _dvbr dvbr
complete -F _dvfbr dvfbr
complete -F _dvs_volume_and_subpath dvls dvsh
complete -F _dvsmbcr dvsmbcr
