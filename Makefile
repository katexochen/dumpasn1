CC                 ?= gcc
CFLAGS             ?= -g -Wall
DESTDIR            ?=
INSTALL            ?= install
INSTALL_PROGRAM    ?= $(INSTALL)
INSTALL_DATA       ?= $(INSTALL) -m 0644
prefix             ?= /usr/local
exec_prefix        ?= $(prefix)
bindir             ?= $(exec_prefix)/bin
sysconfdir         ?= $(prefix)/etc

dumpasn1: dumpasn1.c
	$(CC) $(CFLAGS) -o $@ $<

install:
	$(INSTALL_PROGRAM) -v -m 0755 -D dumpasn1 $(DESTDIR)$(bindir)/dumpasn1
	$(INSTALL_DATA) -v -D dumpasn1.cfg $(DESTDIR)$(sysconfdir)/dumpasn1.cfg

clean:
	$(RM) dumpasn1 *.o
