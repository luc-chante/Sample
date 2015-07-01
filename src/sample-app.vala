/*
 * sample-app.vala
 * Copyright (C) 2015 Luc Chante
 *
 */
internal class Sample.App : Gtk.Application {

	private const ActionEntry[] app_entries =
    {
        { "preferences", null, null, null, null },
        { "about", about, null, null, null },
        { "quit", quit, null, null, null },
    };
	 
    // Constructor
    public App () {
        Object (application_id: "org.ldev.gtk.Sample",
                flags: ApplicationFlags.FLAGS_NONE);
    }

    public override void startup () {
        base.startup ();

		add_action_entries (app_entries, this);
		
		try {
			Gtk.Builder builder = new Gtk.Builder ();
			builder.add_from_resource ("/org/ldev/gtk/Sample/menu.ui");
			MenuModel menu = builder.get_object ("app-menu") as MenuModel;
			set_app_menu (menu);
		}
		catch (Error e) {
			GLib.error ("Error %d: %s", e.code, e.message);
		}
    }
     
    public override void activate () {
		if (active_window == null) {
			var window = new Sample.AppWindow (this);
			window.present ();
		}
	}

	private void about () {
		try {
			string[] authors = { "Luc Chante" };
		    Bytes bytes = resources_lookup_data ("/org/ldev/gtk/Sample/LICENCE", ResourceLookupFlags.NONE);
			string license = (string) bytes.get_data ();
		    Gtk.show_about_dialog (active_window,
		                       "authors", authors,
		                       "comments", _("A GNOME 3 application sample"),
		                       "copyright", "Copyright (C) 2015 Luc Chante",
		                       "license-type", Gtk.License.CUSTOM,
							   "license", license,
		                       "logo-icon-name", "sample",
		                       "version", Config.VERSION,
		                       "website", Config.PACKAGE_URL,
		                       "wrap-license", false);
		}
		catch (Error e) {
			GLib.error ("Error %d: %s", e.code, e.message);
		}
	}
}
