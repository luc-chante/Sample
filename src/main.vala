/*
 * main.vala
 * Copyright (C) 2015 Luc Chante
 *
 */
public int main (string[] args) {
    Intl.bindtextdomain (Config.GETTEXT_PACKAGE, Config.PACKAGE_LOCALE_DIR);
    Intl.bind_textdomain_codeset (Config.GETTEXT_PACKAGE, "UTF-8");
    Intl.textdomain (Config.GETTEXT_PACKAGE);
	GLib.Environment.set_prgname(Config.PACKAGE_NAME);
    GLib.Environment.set_application_name (_("Sample"));

	GLib.message("Initializing with Gtk+ version %u.%u.%u.",
             Gtk.get_major_version (),
             Gtk.get_minor_version (),
             Gtk.get_micro_version ());
	
	var app = new Sample.App ();
	return app.run (args);
}
