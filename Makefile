######################################################################
## FMakefile
## Created at    : Sun Jan 17 22:01:58 2010
## Modified at   :  Sun Jan 17 22:01:59 2010
## URL           : $HeadURL$
## Author        : $Author$
## Revision      : $Revision$
######################################################################




DOC=thesis

all:
	-rm ${DOC}.pdf
	cd tex; ${MAKE} DOC=${DOC}
	cp tex/${DOC}.pdf pdf

clean:
	cd tex; ${MAKE} clean
