## Process this file with automake to produce Makefile.in
ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}

SUBDIRS = src data po

dist_doc_DATA =      \
	README       \
	COPYING      \
	AUTHORS      \
	ChangeLog    \
	INSTALL      \
	NEWS

# Remove doc directory on uninstall
uninstall-local:
	-rm -r $(docdir)

-include $(top_srcdir)/git.mk
