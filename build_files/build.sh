#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y tmux ibus-skk xdg-desktop-portal-kde neovim flatpak greetd dnf5-plugins google-noto-sans-cjk-fonts google-noto-color-emoji-fonts redhat-display-fonts tuigreet xdg-user-dirs libva-intel-media-driver

dnf5 -y copr enable pgdev/ghostty
dnf5 install -y ghostty

dnf5 -y copr enable solopasha/hyprland
dnf5 -y install hyprland xdg-desktop-portal-hyprland hyprpaper hyprlock hyprsysteminfo hypridle hyprpolkitagent

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
systemctl enable greetd
