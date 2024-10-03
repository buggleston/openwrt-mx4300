#!/bin/sh

mkdir release

cp bin/targets/qualcommax/ipq807x/openwrt-qualcommax-ipq807x-linksys_mx4300-* release/
cp bin/targets/qualcommax/ipq807x/openwrt-qualcommax-ipq807x-linksys_mx4300.manifest release/
cp bin/targets/qualcommax/ipq807x/openwrt-imagebuilder* release/

cd release

cat openwrt-qualcommax-ipq807x-linksys_mx4300.manifest | grep ^kernel > ../note.md
echo "
**SHA256SUM**" >> ../note.md
sha256sum * >> ../note.md
echo '

-------

"kernel dependency error" [fix](https://github.com/arix00/openwrt-mx4300/blob/doc/snapshot-dependency-guide.md)' >> ../note.md

cd ..

