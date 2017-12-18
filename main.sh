#!/bin/sh

# Setting directory variables
export LC_ALL=C
pushd $(dirname $0) > /dev/null
SCRIPTPATH=$(pwd -P)
popd > /dev/null

CURRENTPATH="$SCRIPTPATH"
cd ${CURRENTPATH}

# Flag for debugging
# set -x

set -u  # Treat unset variables as error
set -e  # exits as soon as a command fails
set -o pipefail  # Raises error if a pipeline fails


# Now on to main program

# Storing all the packages available in a list
availablePackages=(${SCRIPTPATH}/package-info/*)

# Test whether the folder contains the required package
function contains() {
    local n=$#
    local value=${!n}
    for ((i=1;i < $#;i++)) {
        if [ "${!i}" == "${value}" ]; then
            echo "y"
            return 0
        fi
    }
    echo "n"
    return 1
}

# To install all the programs listed in a file
function installListedPackages() {
    local packageConfigFile="$1"

    # For each package get its info from the folder
    while read -r packageName
    do
        packagePath="${SCRIPTPATH}/package-info/${packageName}"
        if [ $(contains "${availablePackages[@]}" "${packagePath}") == "y" ]; then
            echo "Installing ${packageName}"
            while read -r executeInfo
            do
                ${executeInfo}
            done < ${packagePath}
        else
            echo "Package ${packageName} information is not available"
        fi
    done < ${SCRIPTPATH}/${packageConfigFile}
}

# set install packages file name
installFileName="install.config"

installListedPackages ${installFileName}