#!/bin/bash
if [ -z $1 ]; then
	echo "Usage: ./androidSourceBuild.sh userId androidBuildBranchInfo deviceInfo"
	echo "We need the user id for setting the permissions."
else
	if [ -z $2 ]; then
		echo "We need the branch info. Is it 'android-4.0.1_r1' or something else?"
	else
		if [ -z $3 ]; then
			echo "We need the device info. Is it 'hammerhead' or something else?"
		else
			sudo $1
			mkdir ~/bin
			PATH=~/bin:$PATH
			sudo curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
			chmod a+x ~/bin/repo
			mkdir -p ../builds/$3/$2
			cd ../builds/$3/$2
			repo init -u https://android.googlesource.com/platform/manifest -b $2
			repo sync
			# For build tags llok at https://source.android.com/source/build-numbers.html
			# Downloading the source
			# Build	Branch	Version	Supported devices
			# NMF26Q	android-7.1.1_r6	Nougat	Pixel XL, Pixel
			# NMF26O	android-7.1.1_r4	Nougat	Pixel XL, Pixel
			# NMF26J	android-7.1.1_r3	Nougat	Nexus Player
			# NMF26H	android-7.1.1_r2	Nougat	Pixel C
			# NMF26F	android-7.1.1_r1	Nougat	Nexus 5X, Nexus 6P, Nexus 9 (volantis/volantisg)
			# NDE63X	android-7.1.0_r7	Nougat	Pixel XL, Pixel
			# NDE63V	android-7.1.0_r6	Nougat	Pixel XL, Pixel
			# NDE63U	android-7.1.0_r5	Nougat	Pixel XL, Pixel
			# NDE63P	android-7.1.0_r4	Nougat	Pixel XL, Pixel
			# NDE63L	android-7.1.0_r2	Nougat	Pixel XL, Pixel
			# NDE63H	android-7.1.0_r1	Nougat	Pixel XL, Pixel
			# NBD91U	android-7.0.0_r24	Nougat	Nexus 6
			# N5D91L	android-7.0.0_r21	Nougat	Nexus 5X
			# NBD91P	android-7.0.0_r19	Nougat	Nexus 6
			# NRD91K	android-7.0.0_r17	Nougat	Nexus 6P
			# NRD91N	android-7.0.0_r15	Nougat	Nexus 5X, Pixel C, Nexus Player, Nexus 9 (volantis/volantisg)
			# NBD90Z	android-7.0.0_r14	Nougat	Nexus 6
			# NBD90X	android-7.0.0_r13	Nougat	Nexus 6P
			# NBD90W	android-7.0.0_r12	Nougat	Nexus 5X
			# NRD91D	android-7.0.0_r7	Nougat	Pixel C, Nexus Player, Nexus 9 (Wi-Fi)
			# NRD90U	android-7.0.0_r6	Nougat	Nexus 6P
			# NRD90T	android-7.0.0_r5	Nougat	Nexus 6P
			# NRD90S	android-7.0.0_r4	Nougat	Nexus 5X
			# NRD90R	android-7.0.0_r3	Nougat	Nexus 5X, Nexus 9 (volantis), Nexus Player, Pixel C
			# NRD90M	android-7.0.0_r1	Nougat	Nexus 5X, Nexus 9 (volantis), Nexus Player, Pixel C
			# M4B30Z	android-6.0.1_r77	Marshmallow	Nexus 5
			# MOB31K	android-6.0.1_r74	Marshmallow	Nexus 6
			# MMB31C	android-6.0.1_r73	Marshmallow	Nexus 6
			# M4B30X	android-6.0.1_r72	Marshmallow	Nexus 5
			# MOB31H	android-6.0.1_r70	Marshmallow	Nexus 6
			# MMB30Y	android-6.0.1_r69	Marshmallow	Nexus 6
			# MTC20K	android-6.0.1_r67	Marshmallow	Nexus 5X
			# MOB31E	android-6.0.1_r66	Marshmallow	Nexus 5, Nexus 6, Nexus 9 (volantis)
			# MMB30W	android-6.0.1_r65	Marshmallow	Nexus 6
			# MXC89L	android-6.0.1_r63	Marshmallow	Pixel C
			# MTC20F 	android-6.0.1_r62 	Marshmallow 	Nexus 5X, Nexus 6P
			# MOB30Y 	android-6.0.1_r60 	Marshmallow 	Nexus 5
			# MOB30X 	android-6.0.1_r59 	Marshmallow 	Nexus 7 (flo/deb)
			# MOB30W 	android-6.0.1_r58 	Marshmallow 	Nexus 6, Nexus 9 (volantis/volantisg), Nexus Player
			# MMB30S 	android-6.0.1_r57 	Marshmallow 	Nexus 7 (deb)
			# MMB30R 	android-6.0.1_r56 	Marshmallow 	Nexus 6
			# MXC89K 	android-6.0.1_r55 	Marshmallow 	Pixel C
			# MTC19Z 	android-6.0.1_r54 	Marshmallow 	Nexus 5X
			# MTC19X 	android-6.0.1_r53 	Marshmallow 	Nexus 6P
			# MOB30P 	android-6.0.1_r50 	Marshmallow 	Nexus 5, Nexus 7 (flo/deb), Nexus 9 (volantis/volantisg), Nexus Player
			# MOB30O 	android-6.0.1_r49 	Marshmallow 	Nexus 6
			# MMB30M 	android-6.0.1_r48 	Marshmallow 	Nexus 7 (deb)
			# MMB30K 	android-6.0.1_r47 	Marshmallow 	Nexus 6
			# MOB30M 	android-6.0.1_r46 	Marshmallow 	Nexus 5, Nexus 6, Nexus 7 (flo/deb), Nexus 9 (volantis/volantisg), Nexus Player
			# MTC19V 	android-6.0.1_r45 	Marshmallow 	Nexus 5X, Nexus 6P
			# MOB30J 	android-6.0.1_r43 	Marshmallow 	Nexus 7 (flo/deb)
			# MOB30I 	android-6.0.1_r42 	Marshmallow 	Nexus 6
			# MOB30H 	android-6.0.1_r41 	Marshmallow 	Nexus 5
			# MOB30G 	android-6.0.1_r40 	Marshmallow 	Nexus 9 (volantis/volantisg), Nexus Player
			# MXC89H 	android-6.0.1_r33 	Marshmallow 	Pixel C
			# MXC89F 	android-6.0.1_r32 	Marshmallow 	Pixel C
			# MMB30J 	android-6.0.1_r28 	Marshmallow 	Nexus 6, Nexus 7 (deb)
			# MTC19T 	android-6.0.1_r25 	Marshmallow 	Nexus 5X, Nexus 6P
			# M5C14J 	android-6.0.1_r31 	Marshmallow 	Pixel C
			# MOB30D 	android-6.0.1_r30 	Marshmallow 	Nexus 5, Nexus 6, Nexus 7 (flo/deb), Nexus 9 (volantis/volantisg), Nexus Player
			# MHC19Q 	android-6.0.1_r24 	Marshmallow 	Nexus 5X, Nexus 6P
			# MHC19J	android-6.0.1_r22	Marshmallow		Nexus 5X
			# MXC14G	android-6.0.1_r18	Marshmallow		Pixel C
			# MMB29V	android-6.0.1_r17	Marshmallow		Nexus 5, Nexus 5X, Nexus 6, Nexus 6P, Nexus 7 (flo/deb), Nexus 9 (volantis/volantisg)
			# MXB48T	android-6.0.1_r16	Marshmallow		Pixel C
			# MMB29U	android-6.0.1_r13	Marshmallow		Nexus Player
			# MMB29R	android-6.0.1_r12	Marshmallow		Nexus 9 (volantis/volantisg)
			# MMB29Q	android-6.0.1_r11	Marshmallow		Nexus 5, Nexus 5X, Nexus 6, Nexus 6P, Nexus 7 (flo/deb)
			# MMB29T	android-6.0.1_r10	Marshmallow		Nexus Player
			# MMB29S	android-6.0.1_r9	Marshmallow		Nexus 5, Nexus 6, Nexus 9 (volantis/volantisg)
			# MMB29P	android-6.0.1_r8	Marshmallow		Nexus 5X, Nexus 6P
			# MMB29O	android-6.0.1_r7	Marshmallow		Nexus 7 (flo/deb)
			# MXB48K	android-6.0.1_r5	Marshmallow		Pixel C
			# MXB48J	android-6.0.1_r4	Marshmallow		Pixel C
			# MMB29M	android-6.0.1_r3	Marshmallow		Nexus 6P, Nexus Player
			# MMB29K	android-6.0.1_r1	Marshmallow		Nexus 5, Nexus 5X, Nexus 6, Nexus 7 (flo/deb), Nexus 9 (volantis/volantisg)
			# MMB29N	android-6.0.0_r41	Marshmallow		Nexus 6P
			# MDB08M	android-6.0.0_r26	Marshmallow		Nexus 5X, Nexus 6P
			# MDB08L	android-6.0.0_r25	Marshmallow		Nexus 5X, Nexus 6P
			# MDB08K	android-6.0.0_r24	Marshmallow		Nexus 6P
			# MDB08I	android-6.0.0_r23	Marshmallow		Nexus 5X
			# MDA89E	android-6.0.0_r12	Marshmallow		Nexus 5X
			# MDA89D	android-6.0.0_r11	Marshmallow		Nexus 6P
			# MRA58V	android-6.0.0_r5	Marshmallow		Nexus 7 (flo/deb)
			# MRA58U	android-6.0.0_r4	Marshmallow		Nexus 7 (flo)
			# MRA58N	android-6.0.0_r2	Marshmallow		Nexus 5, Nexus 6, Nexus 7 (flo/deb), Nexus 9 (volantis/volantisg), Nexus Player
			# MRA58K	android-6.0.0_r1	Marshmallow		Nexus 5, Nexus 6, Nexus 7 (flo/deb), Nexus 9 (volantis/volantisg), Nexus Player
			# LMY48W	android-5.1.1_r24	Lollipop		Nexus 6
			# LVY48H	android-5.1.1_r23	Lollipop		Nexus 6 (For Project Fi ONLY)
			# LYZ28M	android-5.1.1_r22	Lollipop		Nexus 6 (For T-Mobile ONLY)
			# LMY48U	android-5.1.1_r20	Lollipop		Nexus 7 (deb)
			# LMY48T	android-5.1.1_r19	Lollipop		Nexus 4, Nexus 6, Nexus 9 (volantis/volantisg), Nexus 10
			# LVY48F	android-5.1.1_r18	Lollipop		Nexus 6 (For Project Fi ONLY)
			# LYZ28K	android-5.1.1_r17	Lollipop		Nexus 6 (For T-Mobile ONLY)
			# LMY48P	android-5.1.1_r16	Lollipop		Nexus 7 (deb)
			# LMY48N	android-5.1.1_r15	Lollipop		Nexus Player
			# LMY48M	android-5.1.1_r14	Lollipop		Nexus 4, Nexus 5, Nexus 6, Nexus 7 (flo), Nexus 9 (volantis/volantisg), Nexus 10
			# LVY48E	android-5.1.1_r13	Lollipop		Nexus 6 (For Project Fi ONLY)
			# LYZ28J	android-5.1.1_r12	Lollipop		Nexus 6 (For T-Mobile ONLY)
			# LMY48J	android-5.1.1_r10	Lollipop		Nexus Player
			# LMY48I	android-5.1.1_r9	Lollipop		Nexus 4, Nexus 5, Nexus 6, Nexus 7 (flo), Nexus 9 (volantis/volantisg), Nexus 10
			# LVY48C	android-5.1.1_r8	Lollipop		Nexus 6 (For Project Fi ONLY)
			# LMY48G	android-5.1.1_r6	Lollipop		Nexus 7 (flo)
			# LYZ28E	android-5.1.1_r5	Lollipop		Nexus 6 (For T-Mobile ONLY)
			# LMY47Z	android-5.1.1_r4	Lollipop		Nexus 6 (All carriers except T-Mobile US)
			# LMY48B	android-5.1.1_r3	Lollipop		Nexus 5
			# LMY47X	android-5.1.1_r2	Lollipop		Nexus 9 (volantis)
			# LMY47V	android-5.1.1_r1	Lollipop		Nexus 7 (flo/grouper), Nexus 10, Nexus Player
			# LMY47O	android-5.1.0_r5	Lollipop		Nexus 4, Nexus 7 (flo/deb)
			# LMY47M	android-5.1.0_r4	Lollipop		Nexus 6 (For T-Mobile ONLY)
			# LMY47I	android-5.1.0_r3	Lollipop		Nexus 5, Nexus 6
			# LMY47E	android-5.1.0_r2	Lollipop		Nexus 6
			# LMY47D	android-5.1.0_r1	Lollipop		Nexus 5, Nexus 6, Nexus 7 (grouper), Nexus 10
			# LRX22G	android-5.0.2_r1	Lollipop		Nexus 7 (flo/deb/grouper/tilapia), Nexus 10
			# LRX22C	android-5.0.1_r1	Lollipop		Nexus 4, Nexus 5, Nexus 6 (shamu), Nexus 7 (flo), Nexus 9 (volantis/volantisg), Nexus 10
			# LRX21V	android-5.0.0_r7.0.1	Lollipop	Nexus Player (fugu)
			# LRX21T	android-5.0.0_r6.0.1	Lollipop	Nexus 4
			# LRX21R	android-5.0.0_r5.1.0.1	Lollipop	Nexus 9 (volantis)
			# LRX21Q	android-5.0.0_r5.0.1	Lollipop	Nexus 9 (volantis)
			# LRX21P	android-5.0.0_r4.0.1	Lollipop	Nexus 7 (flo/grouper), Nexus 10
			# LRX21O	android-5.0.0_r3.0.1	Lollipop	Nexus 5 (hammerhead), Nexus 6 (shamu)
			# LRX21M	android-5.0.0_r2.0.1	Lollipop	Nexus Player (fugu)
			# LRX21L	android-5.0.0_r1.0.1	Lollipop	Nexus 9 (volantis)
			# KTU84Q	android-4.4.4_r2	KitKat	Nexus 5 (hammerhead) (For 2Degrees/NZ, Telstra/AUS and India ONLY)
			# KTU84P	android-4.4.4_r1	KitKat	Nexus 5, Nexus 7 (flo/deb/grouper/tilapia), Nexus 4, Nexus 10
			# KTU84M	android-4.4.3_r1.1	KitKat	Nexus 5 (hammerhead)
			# KTU84L	android-4.4.3_r1	KitKat	Nexus 7 (flo/deb/grouper/tilapia), Nexus 4, Nexus 10
			# KVT49L	android-4.4.2_r2	KitKat	Nexus 7 (deb Verizon)
			# KOT49H	android-4.4.2_r1	KitKat	Nexus 5, Nexus 7 (flo/deb/grouper/tilapia), Nexus 4, Nexus 10
			# KOT49E	android-4.4.1_r1	KitKat	Nexus 5, Nexus 7 (flo/deb/grouper/tilapia), Nexus 4, Nexus 10
			# KRT16S	android-4.4_r1.2	KitKat	Nexus 7 (flo/deb/grouper/tilapia), Nexus 4, Nexus 10
			# KRT16M	android-4.4_r1	KitKat	Nexus 5 (hammerhead)
			# JLS36I	android-4.3.1_r1	Jelly Bean	Nexus 7 (deb)
			# JLS36C	android-4.3_r3	Jelly Bean	Nexus 7 (deb)
			# JSS15R	android-4.3_r2.3	Jelly Bean	Nexus 7 (flo)
			# JSS15Q	android-4.3_r2.2	Jelly Bean	Nexus 7 (flo)
			# JSS15J	android-4.3_r2.1	Jelly Bean	Nexus 7 (flo/deb)
			# JSR78D	android-4.3_r2	Jelly Bean	Nexus 7 (deb)
			# JWR66Y	android-4.3_r1.1	Jelly Bean	Galaxy Nexus, Nexus 7 (grouper/tilapia), Nexus 4, Nexus 10
			# JWR66V	android-4.3_r1	Jelly Bean	Galaxy Nexus, Nexus 7 (grouper/tilapia), Nexus 4, Nexus 10
			# JWR66N	android-4.3_r0.9.1	Jelly Bean	Galaxy Nexus, Nexus 7 (grouper/tilapia/flo), Nexus 4, Nexus 10
			# JWR66L	android-4.3_r0.9	Jelly Bean	Nexus 7
			# JDQ39E	android-4.2.2_r1.2	Jelly Bean	Nexus 4
			# JDQ39B	android-4.2.2_r1.1	Jelly Bean	Nexus 7
			# JDQ39	android-4.2.2_r1	Jelly Bean	Galaxy Nexus, Nexus 7, Nexus 4, Nexus 10
			# JOP40G	android-4.2.1_r1.2	Jelly Bean	Nexus 4
			# JOP40F	android-4.2.1_r1.1	Jelly Bean	Nexus 10
			# JOP40D	android-4.2.1_r1	Jelly Bean	Galaxy Nexus, Nexus 7, Nexus 4, Nexus 10
			# JOP40C	android-4.2_r1	Jelly Bean	Galaxy Nexus, Nexus 7, Nexus 4, Nexus 10
			# JZO54M	android-4.1.2_r2.1	Jelly Bean	
			# JZO54L	android-4.1.2_r2	Jelly Bean	
			# JZO54K	android-4.1.2_r1	Jelly Bean	Nexus S, Galaxy Nexus, Nexus 7
			# JRO03S	android-4.1.1_r6.1	Jelly Bean	Nexus 7
			# JRO03R	android-4.1.1_r6	Jelly Bean	Nexus S 4G
			# JRO03O	android-4.1.1_r5	Jelly Bean	Galaxy Nexus
			# JRO03L	android-4.1.1_r4	Jelly Bean	Nexus S
			# JRO03H	android-4.1.1_r3	Jelly Bean	
			# JRO03E	android-4.1.1_r2	Jelly Bean	Nexus S
			# JRO03D	android-4.1.1_r1.1	Jelly Bean	Nexus 7
			# JRO03C	android-4.1.1_r1	Jelly Bean	Galaxy Nexus
			# IMM76L	android-4.0.4_r2.1	Ice Cream Sandwich	 
			# IMM76K	android-4.0.4_r2	Ice Cream Sandwich	Galaxy Nexus
			# IMM76I	android-4.0.4_r1.2	Ice Cream Sandwich	Galaxy Nexus
			# IMM76D	android-4.0.4_r1.1	Ice Cream Sandwich	Nexus S, Nexus S 4G, Galaxy Nexus
			# IMM76	android-4.0.4_r1	Ice Cream Sandwich	
			# IML77	android-4.0.3_r1.1	Ice Cream Sandwich	
			# IML74K	android-4.0.3_r1	Ice Cream Sandwich	Nexus S
			# ICL53F	android-4.0.2_r1	Ice Cream Sandwich	Galaxy Nexus
			# ITL41F	android-4.0.1_r1.2	Ice Cream Sandwich	Galaxy Nexus
			# ITL41D	android-4.0.1_r1.1	Ice Cream Sandwich	Galaxy Nexus
			# ITL41D	android-4.0.1_r1	Ice Cream Sandwich	Galaxy Nexus
			# GWK74	android-2.3.7_r1	Gingerbread	Nexus S 4G
			# GRK39F	android-2.3.6_r1	Gingerbread	Nexus One, Nexus S
			# GRK39C	android-2.3.6_r0.9	Gingerbread	Nexus S
			# GRJ90	android-2.3.5_r1	Gingerbread	Nexus S 4G
			# GRJ22	android-2.3.4_r1	Gingerbread	Nexus One, Nexus S, Nexus S 4G
			# GRJ06D	android-2.3.4_r0.9	Gingerbread	Nexus S 4G
			# GRI54	android-2.3.3_r1.1	Gingerbread	Nexus S
			# GRI40	android-2.3.3_r1	Gingerbread	Nexus One, Nexus S
			# GRH78C	android-2.3.2_r1	Gingerbread	Nexus S
			# GRH78	android-2.3.1_r1	Gingerbread	Nexus S
			# GRH55	android-2.3_r1	Gingerbread	earliest Gingerbread version, Nexus S
			# FRK76C	android-2.2.3_r2	Froyo	 
			# FRK76	android-2.2.3_r1	Froyo	
			# FRG83G	android-2.2.2_r1	Froyo	Nexus One
			# FRG83D	android-2.2.1_r2	Froyo	Nexus One
			# FRG83	android-2.2.1_r1	Froyo	Nexus One
			# FRG22D	android-2.2_r1.3	Froyo	
			# FRG01B	android-2.2_r1.2	Froyo	
			# FRF91	android-2.2_r1.1	Froyo	Nexus One
			# FRF85B	android-2.2_r1	Froyo	Nexus One
			# EPF21B	android-2.1_r2.1p2	Eclair	 
			# ESE81	android-2.1_r2.1s	Eclair	
			# EPE54B	android-2.1_r2.1p	Eclair	Nexus One
			# ERE27	android-2.1_r2	Eclair	Nexus One
			# ERD79	android-2.1_r1	Eclair	Nexus One
			# ESD56	android-2.0.1_r1	Eclair	
			# ESD20	android-2.0_r1	Eclair	 
			# DMD64	android-1.6_r1.5	Donut	 
			# DRD20	android-1.6_r1.4		
			# DRD08	android-1.6_r1.3		
			# DRC92	android-1.6_r1.2				
		fi
	fi
fi
