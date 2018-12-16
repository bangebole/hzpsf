## 1.软件名称
* hzpsf 版本(0.1)

## 2.软件功能
* 实现isolinux启动支持汉字

## 3.源码结构
* src/
* ├── hzpsf             {hzpsf程序函数实现}
* │   └── hzpsf.c
* ├── include           {所需的头文件:hzpsf程序变量、函数声明,ini配置文件头}
* │   ├── dictionary.h
* │   ├── hzpsf.h
* │   └── iniparser.h
* ├── ini               {ini配置文件静态库}
* │   └── libiniparser.a
* └── main              {hzpsf程序主体实现}
*     └── main.c
* hzpsfini/             {ini配置文件}
*     └── hzpsf.ini         

## 4.编译
> * 可选操作(生成configure)
> * ```aclocal```
> * ```automake -a```
> * ```autoconf```

* ```./configure --prefix=/usr```
* ```make```

## 5.安装
* ```sudo make install```

## 6.卸载
* ```sudo make uninstall```

## 7.使用:
* Usage:	hzpsf	OBJECT={-i <in_isolinux.cfg> | [-t] | -h}	[OPTIONS]
	* where	OBJECT	:={
		* -i <in_isolinux.cfg> &emsp;&emsp;```Intput configuration file```
		* -t &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;```Turn off transcoding```
		* -h &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;```Get help information```}
	* OPTIONS	:={
		* -e <GREEK.F16> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;```English font```
		* -c <hzk16s> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;```Chinese font library```
		* -o <out_isolinx.cfg> &emsp;&emsp;&emsp;&emsp;```Output configuration file```
		* -p <myfont.psf> &emsp;&emsp;&emsp;&emsp;```Output psf font file```
		* -s &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;```Skip file coverage check```
		* -a &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;```Allow space spacing Chinese characters```}
* **Use the /etc/hzpsfini/hzpsf.ini file to set up the program!**
* **The program font file is installed at: $prefix/shar/fonts/psfzk/!**
* Example:
* ```hzpsf -i isolinux_utf.cfg ```
* ```hzpsf -t -i isolinux_gb.cfg -e GREEK.F16 -c hzk16s -o isolinux.cfg -p myfont.psf```
* -i:输入处理文件;      -t:关闭转码功能;        -h:获取帮助信息;
* -e:F16字库文件;       -c:中文字库文件;        -o:输出经过处理后的文件;
* -p:生成的psf字体文件;  -s:跳过检查文件覆盖;	  -a:允许空格间隔汉字

## 8.生成文件
* isolinux.cfg:生成的配置文件,结合myfont.psf字体文件一起使用
* myfont.psf:生成的字体文件

## 9.其他
* fonts/psfzk:字体库
* hzpsfini/hzpsf.ini:配置文件
* 如果找不到配置文件或字库文件,执行:
* ```sudo cp -rvf fonts/psfzk /usr/share/fonts/``` //代码中设置默认字库读取路径
* ```sudo cp -rvf hzpsfini /etc/``` //安装后配置文件解析路径

## 10.关于作者
* Hesong Li <hsli@linx-info.com>
