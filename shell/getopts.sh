#!/usr/bin/env bash

function my-command () {

    print-usage () {
            echo "
    NAME
        my-command - Some description of the command.

    SYNOPSIS
        my-command [-ho] [-p PARAMETER] ARGUMENT1 ARGUMENT2

    OPTIONS
        -h    Show this help.
        -o    Some option without parameter.
        -p    Some option with parameter.

    ARGUMENTS
        ARGUMENT1    Description of argument 1.
        ARGUMENT2    Description of argument 2.

    EXAMPLES
        # Some description of this example
        $ my-command hello world"
    }

    local OPTION1_SELECTED=false
    local OPTION2_SELECTED=false
    local OPTION2_PARAMETER=

    local OPTIND
    while getopts ":hop:" OPTION
    do
        case ${OPTION} in
            h)
                print-usage
                exit
            ;;

            o)
                OPTION1_SELECTED=true
            ;;

            p)
                OPTION2_SELECTED=true
                OPTION2_PARAMETER="${OPTARG}"
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

    if [[ "${OPTION1_SELECTED}" = true ]]; then
        echo "Option -o was selected"
    fi

    if [[ "${OPTION2_SELECTED}" = true ]]; then
        echo "Option -p was selected with parameter ${OPTION2_PARAMETER}"
    fi
}
