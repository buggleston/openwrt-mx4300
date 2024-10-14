#!/bin/sh

mkdir kmods
cp bin/targets/qualcommax/ipq807x/packages/Packages* kmods
cp bin/targets/qualcommax/ipq807x/packages/kmod-* kmods
tar cfz kmods.tar.gz kmods/

MD="note.md"
mkdir release
cp bin/targets/qualcommax/ipq807x/openwrt-qualcommax-ipq807x-linksys_mx4300-* release/
cp bin/targets/qualcommax/ipq807x/openwrt-qualcommax-ipq807x-linksys_mx4300.manifest release/
cp kmods.tar.gz release/

kernel=$(cat release/openwrt-qualcommax-ipq807x-linksys_mx4300.manifest | grep ^kernel | cut -d '~' -f 1)
checksum=$(sha256sum release/* | sed 's/release\///')
#echo $checksum
echo "- $kernel

- sha256sum
\`\`\`
$checksum
\`\`\`

- [use kmods](https://github.com/arix00/openwrt-mx4300/blob/doc/nss-kmods.md)" > $MD
