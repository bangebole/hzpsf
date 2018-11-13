#!/bin/bash
#1.创建配置文件(windows环境编辑)
#cp ~/share/isolinux_deb_zh.cfg ./

#2.执行生成(isolinux.cfg、myfont.psf)
./hzpsf -e SWISS.F16 -z hzk16s -c myfont.psf -i isolinux_deb_zh.cfg -o isolinux.cfg

#3.
cp myfont.psf ~/cd/isolinux/
cp isolinux.cfg ~/cd/isolinux/

#4.重新做盘
cd ~/cd

md5sum `find -follow -type f` > md5sum.txt

cd ..

sudo genisoimage -r -J -b isolinux/isolinux.bin -c isolinux/boot.cat \
		-no-emul-boot -boot-load-size 4 -boot-info-table \
		-o test.iso cd/

