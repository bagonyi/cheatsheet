#!/usr/bin/env bash

function my-command () {

    print-usage () {
            echo "
    NAME
        my-command - Some description of the command.

    SYNOPSIS
        my-command [-ho] ARGUMENT1 ARGUMENT2

    OPTIONS
        -h    Show this help.
        -o    Some option.

    ARGUMENTS
        ARGUMENT1    Description of argument 1.
        ARGUMENT2    Description of argument 2.

    EXAMPLES
        # Some description of this example
        $ my-command hello world"
        }

        OPTION_SELECTED=false

        local OPTIND
        while getopts ":ho" OPTION
        do
            case ${OPTION} in
                h)
                    print-usage
                    exit
                ;;

                o)
                    OPTION_SELECTED=true
                ;;

                \?)
                    echo "Invalid option -$OPTARG"
                    print-usage
                    exit
                ;;

                :)
                    echo "Option -$OPTARG requires an argument"
                    print-usage
                    exit
                ;;
            esac
        done

        shift $((OPTIND -1))

        ARGUMENT1=$1
        ARGUMENT2=$2

        if [[ "${OPTION_SELECTED}" = true ]]; then
            echo "Option -o was selected"
        fi
}
