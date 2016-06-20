#!/bin/bash
set -e

. win32-funcs.sh

# Apertium all-dev
rm -rf /opt/win32
install_dep lttoolbox
install_dep apertium
install_dep apertium-lex-tools
install_dep hfst
install_dep hfst-ospell
install_dep cg3ide
install_dep cg3
#install_dep trie-tools

cd /opt
rm -rf apertium-all-dev
mv win32 apertium-all-dev
chmod -R uga+r apertium-all-dev
zip -9r apertium-all-dev.zip apertium-all-dev
7za a -l apertium-all-dev.7z apertium-all-dev
mv -fv apertium-all-dev.zip ~apertium/public_html/win32/$BUILDTYPE/
mv -fv apertium-all-dev.7z ~apertium/public_html/win32/$BUILDTYPE/
rm -rf apertium-all-dev

# CG-3 IDE
rm -rf /opt/win32
install_dep cg3ide
install_dep cg3

cd /opt
rm -rf cg3ide
mv win32 cg3ide
zip -9r cg3ide.zip cg3ide
7za a -l cg3ide.7z cg3ide
mv -fv cg3ide.zip ~apertium/public_html/win32/$BUILDTYPE/cg3ide-[0-9]*.zip
mv -fv cg3ide.7z ~apertium/public_html/win32/$BUILDTYPE/cg3ide-[0-9]*.7z
rm -rf cg3ide

chown -R apertium:apertium ~apertium/public_html/win32
