make clean
make -j8 || make -j8 || make
make install DESTDIR=/opt/osx-pkg/$PKG_NAME
for INST in $EXTRA_INST
do
	install $INST /opt/osx-pkg/$PKG_NAME/opt/osx/bin
done

cd /opt/osx-pkg/$PKG_NAME/opt/osx
/misc/branches/packaging/osx-copy-deps.pl

cd /opt/osx-pkg/$PKG_NAME/opt

set +e
find . -type f | grep /bin/ | xargs -rn1 x86_64-apple-darwin12-strip 2>/dev/null
find . -type f | grep /lib/ | xargs -rn1 x86_64-apple-darwin12-strip 2>/dev/null
find . -type f -name '*.a' | xargs -rn1 x86_64-apple-darwin12-strip 2>/dev/null
set -e
mv osx $PKG_NAME
#zip -9r $PKG_NAME-$PKG_VER.zip $PKG_NAME
7za a $PKG_NAME-$PKG_VER.7z $PKG_NAME
rm -fv ~apertium/public_html/osx/nightly/$PKG_NAME-[0-9]*.zip ~apertium/public_html/osx/nightly/$PKG_NAME-[0-9]*.7z
mv -v *.7z ~apertium/public_html/osx/nightly/
cd ~apertium/public_html/osx/nightly/
#ln -sfv $PKG_NAME-$PKG_VER.zip $PKG_NAME-latest.zip
ln -sfv $PKG_NAME-$PKG_VER.7z $PKG_NAME-latest.7z
chown -R apertium:apertium ~apertium/public_html/osx