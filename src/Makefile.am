## Process this file with automake to produce Makefile.in

AM_CPPFLAGS =                                      \
	-include config.h                          \
	-DPACKAGE_LOCALE_DIR=\""$(localedir)"\"    \
	-DPACKAGE_SRC_DIR=\""$(srcdir)"\"          \
	-DPACKAGE_DATA_DIR=\""$(pkgdatadir)"\"     \
	$(VALA_TEMPLATE_CFLAGS)

AM_CFLAGS =    \
	-Wall  \
	-g

gresource_file = $(top_srcdir)/data/vala-template.gresource.xml

resource_files = $(shell $(GLIB_COMPILE_RESOURCES) --generate-dependencies --sourcedir=$(top_srcdir)/data $(gresource_file))
resources.c: $(gresource_file) $(resource_files)
	$(AM_V_GEN) $(GLIB_COMPILE_RESOURCES) --target=$@ --sourcedir=$(top_srcdir)/data --generate-source $<

win32_icon.o: $(top_srcdir)/data/icons/vala-template.rc $(top_srcdir)/data/icons/vala-template.ico
	windres $(top_srcdir)/data/icons/vala-template.rc win32_icon.o

BUILT_SOURCES = resources.c

bin_PROGRAMS = vala-template

vala_template_SOURCES =            \
	$(BUILT_SOURCES)    \
	config.vapi         \
	main.vala           \
	vala-template-app.vala            \
	vala-template-app-window.vala

vala_template_VALAFLAGS =                       \
	--target-glib=2.38.0             \
	--pkg gtk+-3.0                   \
	--pkg gio-2.0                    \
	--gresources=$(gresource_file)

vala_template_LDFLAGS =

vala_template_LDADD = $(VALA_TEMPLATE_LIBS)

if PLATFORM_WIN32
vala_template_LDFLAGS += -Wl,--export-all-symbols win32_icon.o
else
vala_template_LDFLAGS += -Wl,--export-dynamic
endif

if NATIVE_WIN32
vala_template_LDFLAGS += -mwindows
endif

