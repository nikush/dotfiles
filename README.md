nikush's dotfiles
=================

Install
-------
Run `dotfiles.sh up` to install all config files into to the home directory using symlinks.

Uninstall
---------
Run `dotfiles.sh down` to remove all of the symlinks.

Local Settings
--------------
To add to or override any of the existing settings without directly editing the
files in the repository, create a `*.local` file in your home directory and add
your settings there.  For example, to add local setting to your `.bashrc` file,
create a `.bashrc.local` file, the settings in the local file will be sourced
after the `.bashrc` file.
