# dslider - dynamic menu
# See LICENSE file for copyright and license details.

include config.mk

SRC = drw.c dslider.c util.c
OBJ = $(SRC:.c=.o)

all: options dslider

options:
	@echo dslider build options:
	@echo "CFLAGS   = $(CFLAGS)"
	@echo "LDFLAGS  = $(LDFLAGS)"
	@echo "CC       = $(CC)"

.c.o:
	$(CC) -c $(CFLAGS) $<

config.h:
	cp config.def.h $@

$(OBJ): arg.h config.h config.mk drw.h

dslider: dslider.o drw.o util.o
	$(CC) -o $@ dslider.o drw.o util.o $(LDFLAGS)

clean:
	rm -f dslider $(OBJ) dslider-$(VERSION).tar.gz

dist: clean
	mkdir -p dslider-$(VERSION)
	cp LICENSE Makefile README arg.h config.def.h config.mk dslider.1\
		drw.h util.h $(SRC)\
		dslider-$(VERSION)
	tar -cf dslider-$(VERSION).tar dslider-$(VERSION)
	gzip dslider-$(VERSION).tar
	rm -rf dslider-$(VERSION)

install: all
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f dslider $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dslider
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	sed "s/VERSION/$(VERSION)/g" < dslider.1 > $(DESTDIR)$(MANPREFIX)/man1/dslider.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/dslider.1

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/dslider\
		$(DESTDIR)$(MANPREFIX)/man1/dslider.1\

.PHONY: all options clean dist install uninstall
