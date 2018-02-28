#!/usr/bin/env sh

echo "Starting provisioning of 'my-omf-config'..."
echo "Current working directory is: ${PWD}"
echo $(realpath $0)
if test -z "${OMF_CONFIG}"; then
    echo "Could not provision oh-my-fish config to \$OMG_CONFIG as it's not set."
    exit 1
fi

cp ./bundle ${OMF_CONFIG}
cp ./init.fish ${OMF_CONFIG}
cp ./theme ${OMF_CONFIG}

echo "Done."

