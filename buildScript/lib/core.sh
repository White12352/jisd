#!/bin/bash

buildScript/lib/core/init.sh
cd ..
ls -la
cd jisd
ls -la
libcore
ls -la
rm -rf sing-box
#git clone -b building https://github.com/PuerNya/sing-box.git sing-box
#git clone -b dev-next-yaott https://github.com/CHIZI-0618/sing-box.git sing-box
git clone -b sing-box-b-t https://github.com/White12352/sing-box.git sing-box
git clone -b dev https://github.com/White12352/sing sing
#git clone -b main https://github.com/matsuridayo/libneko libneko
#svn co https://github.com/MatsuriDayo/sing-box/branches/1.6.a2/nekoutils sing-box/nekoutils
#awk '/^replace/ && !found {print "replace github.com/sagernet/sing => ../sing"; found=1} 1' sing-box-extra/go.mod > go.mod.tmp && mv -f go.mod.tmp sing-box-extra/go.mod
cd sing-box-extra
go mod tidy
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
cd ../jisd/libcore
awk '{if(index($0, "// replace github.com/sagernet/sing =>") > 0) $0 = "replace github.com/sagernet/sing => ../../sing"}1' go.mod > temp_file && mv -f temp_file go.mod
awk '{if ($0 ~ /\/\/ replace github\.com\/sagernet\/sing-dns => \.\.\/\.\.\/sing-dns/) {print "// replace github.com/sagernet/sing-dns => ../../sing-dns"; print ""; print "replace github.com/sagernet/sing-quic => ../../sing-quic"} else {print $0}}' go.mod > temp_file && mv -f temp_file go.mod
go mod tidy
cd ..
buildScript/lib/core/build.sh
