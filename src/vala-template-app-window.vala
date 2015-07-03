/*
 * vala-template-app-window.vala
 * Copyright (C) 2015 Luc Chante
 *
 */
[GtkTemplate (ui = "/org/ldev/gtk/ValaTemplate/ui/app-window.ui")]
internal class ValaTemplate.AppWindow : Gtk.ApplicationWindow {

	private const ActionEntry[] window_entries =
    {
        { "reset", reset, null, null, null }
	};
	
    [GtkChild]
    Gtk.MenuButton menu_button;
	
    [GtkChild]
    Gtk.Button test_button;
    
    // Constructor
    public AppWindow (Gtk.Application app) {
        Object (application: app);

		add_action_entries (window_entries, this);
		
		// Necessary to use Gtk.HeaderBar and keep compatibility with Glade 3.18.3 and earlier
		Gtk.HeaderBar header_bar = new Gtk.HeaderBar();
		header_bar.show_close_button = true;
		header_bar.title = title;
		header_bar.has_subtitle = false;
		header_bar.show ();
		set_titlebar (header_bar);

		try {
			Gtk.Builder builder = new Gtk.Builder ();
			builder.add_from_resource ("/org/ldev/gtk/ValaTemplate/menu.ui");
			MenuModel menu = builder.get_object ("win-menu") as MenuModel;

			menu_button.menu_model = menu;
			menu_button.show ();
			header_bar.pack_end (menu_button);
		}
		catch (Error e) {
			GLib.error ("Error %d: %s", e.code, e.message); 
		}
	}

    [GtkCallback]
    public void on_test_button_clicked(Gtk.Button button) {
		test_button.sensitive = false;
    }
    
    protected void reset (SimpleAction action, Variant? parameter) {
    	test_button.sensitive = true;
    }
}
