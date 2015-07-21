# systemd-cgtop(1) completion                  -*- shell-script -*-
#
# This file is part of systemd.
#
# Copyright 2014 Thomas H.P. Andersen
#
# systemd is free software; you can redistribute it and/or modify it
# under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation; either version 2.1 of the License, or
# (at your option) any later version.
#
# systemd is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with systemd; If not, see <http://www.gnu.org/licenses/>.

__contains_word() {
        local w word=$1; shift
        for w in "$@"; do
                [[ $w = "$word" ]] && return
        done
}

_systemd_cgtop() {
        local cur=${COMP_WORDS[COMP_CWORD]} prev=${COMP_WORDS[COMP_CWORD-1]}
        local comps

        local -A OPTS=(
               [STANDALONE]='-h --help --version -p -t -c -m -i -b --batch -n --iterations -d --delay'
               [ARG]='--cpu --depth'
               )

        _init_completion || return

        COMPREPLY=( $(compgen -W '${OPTS[*]}' -- "$cur") )
}

complete -F _systemd_cgtop systemd-cgtop
