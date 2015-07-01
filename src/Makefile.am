## Process this file with automake to produce Makefile.in

AM_CPPFLAGS =                                      \
	-include config.h                          \
	-DPACKAGE_LOCALE_DIR=\""$(localedir)"\"    \
	-DPACKAGE_SRC_DIR=\""$(srcdir)"\"          \
	-DPACKAGE_DATA_DIR=\""$(pkgdatadir)"\"     \
	$(SAMPLE_CFLAGS)

AM_CFLAGS =    \
	-Wall  \
	-g

gresource_file = $(top_srcdir)/data/sample.gresource.xml

resource_files = $(shell $(GLIB_COMPILE_RESOURCES) --generate-dependencies --sourcedir=$(top_srcdir)/data $(gresource_file))
resources.c: $(gresource_file) $(resource_files)
	$(AM_V_GEN) $(GLIB_COMPILE_RESOURCES) --target=$@ --sourcedir=$(top_srcdir)/data --generate-source $<

BUILT_SOURCES = resources.c

bin_PROGRAMS = sample

sample_SOURCES =            \
	$(BUILT_SOURCES)    \
	config.vapi         \
	main.vala           \
	sample-app.vala            \
	sample-app-window.vala

sample_VALAFLAGS =                       \
	--target-glib=2.38.0             \
	--pkg gtk+-3.0                   \
	--pkg gio-2.0                    \
	--gresources=$(gresource_file)


sample_LDFLAGS =

sample_LDADD = $(SAMPLE_LIBS)

if PLATFORM_WIN32
sample_LDFLAGS += -Wl,--export-all-symbols
else
sample_LDFLAGS += -Wl,--export-dynamic
endif

if NATIVE_WIN32
sample_LDFLAGS += -mwindows
endif

