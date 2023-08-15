suntar overlay
==============

This is an unofficial gentoo repository (overlay) with packages that I use on my gentoo computer.
These ebuilds were never tested on clean gentoo installation.

To add this overlay run

#emerge --ask app-eselect/eselect-repository
#mkdir -p /etc/portage/repos.conf
#eselect repository enable suntar
#emaint sync --repo suntar
