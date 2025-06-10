#!/usr/bin/env bash

mkdir -p /opt/org.bluebuild.cli/
curl -L -o /opt/org.bluebuild.cli/installer https://raw.githubusercontent.com/blue-build/cli/main/install.sh
chmod +x /opt/org.bluebuild.cli/installer
/opt/org.bluebuild.cli/installer
