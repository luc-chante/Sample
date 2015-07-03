AC_INIT(
  [ValaTemplate],
  [1.0],
  [http://github.com/luc-chante/ValaTemplate/issues],
  [vala-template],
  [http://github.com/luc-chante/ValaTemplate])

AC_CONFIG_HEADERS([config.h])

AC_CONFIG_MACRO_DIR([m4])

AM_INIT_AUTOMAKE([1.11])

AM_SILENT_RULES([yes])

AC_PROG_CC

dnl ***************************************************************************
dnl Check for Windows
dnl ***************************************************************************
AC_CANONICAL_HOST

case $host_os in
  *mingw*)
    platform_win32=yes
    native_win32=yes
    ;;
  pw32* | *cygwin*)
    platform_win32=yes
    native_win32=no
    ;;
  *)
    platform_win32=no
    native_win32=no
    ;;
esac
AM_CONDITIONAL(PLATFORM_WIN32, test x"$platform_win32" = "xyes")
AM_CONDITIONAL(NATIVE_WIN32, test x"$native_win32" = "xyes")


LT_INIT([win32-dll])

dnl i18n support
IT_PROG_INTLTOOL(0.40.0)

GETTEXT_PACKAGE=AC_PACKAGE_TARNAME
AC_DEFINE_UNQUOTED(GETTEXT_PACKAGE, "$GETTEXT_PACKAGE", [The name of the gettext domain])
AC_SUBST(GETTEXT_PACKAGE)
AM_GNU_GETTEXT_VERSION([1.11])
AM_GLIB_GNU_GETTEXT

dnl GResource
AC_PATH_PROG(GLIB_COMPILE_RESOURCES, glib-compile-resources)

dnl Check for vala
AM_PROG_VALAC([0.10.0])

PKG_CHECK_MODULES(VALA_TEMPLATE, [
  gtk+-3.0 >= 3.10.0
  glib-2.0 >= 2.38.0
  gio-2.0
])


AC_OUTPUT([
  Makefile
  data/Makefile
  data/icons/Makefile
  po/Makefile.in
  src/Makefile
])

AC_MSG_NOTICE([

        Vala Template $VERSION
        ============

        prefix:          ${prefix}
        c compiler:      ${CC} ${CFLAGS}
        vala compiler:   ${VALAC} ${VALAFLAGS}
        gettext domain:  ${GETTEXT_PACKAGE}
])
