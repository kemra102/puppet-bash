# kernel-install(8) completion                                   -*- shell-script -*-
#
# This file is part of systemd.
#
# Copyright 2013 Kay Sievers
# Copyright 2013 Harald Hoyer
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

_kernel_install() {
        local comps
        local MACHINE_ID
        local cur=${COMP_WORDS[COMP_CWORD]}

        case $COMP_CWORD in
            1)
                comps="add remove"
                ;;
            2)
                comps=$(cd /lib/modules; echo [0-9]*)
                if [[ ${COMP_WORDS[1]} == "remove" ]] && [[ -f /etc/machine-id ]]; then
                    read MACHINE_ID < /etc/machine-id
                    if [[ $MACHINE_ID ]] && ( [[ -d /boot/$MACHINE_ID ]] || [[ -L /boot/$MACHINE_ID ]] ); then
                        comps=$(cd "/boot/$MACHINE_ID"; echo [0-9]*)
                    fi
                fi
                ;;
            3)
                [[ "$cur" ]] || cur=/boot/vmlinuz-${COMP_WORDS[2]}
                comps=$(compgen -f -- "$cur")
                compopt -o filenames
                ;;
        esac

        COMPREPLY=( $(compgen -W '$comps' -- "$cur") )
        return 0
}

complete -F _kernel_install kernel-install
