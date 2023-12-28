PREFIX="/opt/local"
OVERLAY="wine-overlay"

pushd "$PREFIX/share"
sudo git clone https://github.com/Gcenx/macports-wine.git "$OVERLAY"
cd "$OVERLAY"
sudo git checkout -b wine-8.21 585ac78f3e921fad403a81ba9eca21466a5029dd
sudo git remote add dummy "$PREFIX/share/$OVERLAY/.git"
sudo git push --set-upstream dummy
git remote -v
popd

sudo sed -i'' "1s|^|file://$PREFIX/share/$OVERLAY\n|" "$PREFIX/etc/macports/sources.conf"
sudo port -v sync
