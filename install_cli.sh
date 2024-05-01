#!/bin/bash
set -e pipefail

CLI_URL="https://app-updates.agilebits.com/product_history/CLI2"

# Fetch the latest version of 1Password CLI (on stable or beta channel)
get_latest_cli_version() {
    conditional_path="/beta/"
    if [ "$1" == "non_beta" ]; then
        conditional_path="!/beta/"
    fi
    # This long command parses the HTML page at "CLI_URL" and finds the latest CLI version
    # based on the release channel we're looking for (stable or beta).
    #
    # The ideal call (i.e. 'curl https://app-updates.agilebits.com/check/1/0/CLI2/en/2.0.0/Y -s | jq -r .version')
    # doesn't retrieve the latest CLI version on a channel basis.
    # If the latest release is stable and we want the latest beta, this command will return the stable still.
    OP_CLI_VERSION="v$(curl -s $CLI_URL | awk -v RS='<h3>|</h3>' 'NR % 2 == 0 {gsub(/[[:blank:]]+/, ""); gsub(/<span[^>]*>|<\/span>|[\r\n]+/, ""); gsub(/&nbsp;.*$/, ""); if (!'"$1"' && '"$conditional_path"'){print; '"$1"'=1;}}')"
}

if [[ "$OP_CLI_VERSION" == "latest" ]]; then
    get_latest_cli_version non_beta
elif [[ "$OP_CLI_VERSION" == "latest-beta" ]]; then
    get_latest_cli_version beta
else
    OP_CLI_VERSION="v$OP_CLI_VERSION"
fi

echo $OP_CLI_VERSION

# install linux/intel arch
curl -sSfLo op.zip "https://cache.agilebits.com/dist/1P/op2/pkg/${OP_CLI_VERSION}/op_linux_amd64_${OP_CLI_VERSION}.zip"
sudo unzip -od "/usr/local/bin/" op.zip && rm op.zip
