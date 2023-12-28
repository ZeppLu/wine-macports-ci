case $(sw_vers --productVersion) in
	14.*)
		SUFFIX="14-Sonoma"
		;;
	13.*)
		SUFFIX="13-Ventura"
		;;
	12.*)
		SUFFIX="12-Monterey"
		;;
	11.*)
		SUFFIX="11-BigSur"
		;;
	10.15.*)
		SUFFIX="10.15-Catalina"
		;;
	*)
		exit 1
		;;
esac

PORT_VER="2.8.1"
PORT_PKG="MacPorts-$PORT_VER-$SUFFIX.pkg"
PORT_URL="https://github.com/macports/macports-base/releases/download/v$PORT_VER/$PORT_PKG"

curl -L "$PORT_URL" -o "$PORT_PKG"

sudo installer -pkg "$PORT_PKG" -tgt /
