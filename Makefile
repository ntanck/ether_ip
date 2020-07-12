#Makefile at top of application tree
TOP = .

include $(TOP)/configure/CONFIG

DIRS := configure

DIRS += ether_ipApp
ether_ipApp_DEPEND_DIRS = configure

DIRS += testether_ipApp
testether_ipApp_DEPEND_DIRS = ether_ipApp

DIRS += iocBoot
iocBoot_DEPEND_DIRS = configure

include $(TOP)/configure/RULES_TOP


test:
	bin/linux-x86_64/ether_ip_test -i 160.91.232.217 -v 10 K_RealArray_10[2] 

val:
	valgrind -s bin/linux-x86_64/ether_ip_test -i 10.0.38.199 -s 1 -v 10 -T 5 -m 
