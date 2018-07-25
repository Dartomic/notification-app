/*
* Copyright (c) 2018 Herbert Smith (https://dartomic.com)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Author <president@atomictech.org>
*/

public class MyApp : Gtk.Application {

    public MyApp () 
    {
        Object (
            application_id: "com.github.dartomic.valaTest3",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () 
    {
        
        var grid = new Gtk.Grid ();
        grid.orientation = Gtk.Orientation.VERTICAL;
        grid.row_spacing = 6;

        var title_label = new Gtk.Label ("Notifications");
        var show_button = new Gtk.Button.with_label ("Show");

        grid.add (title_label);
        grid.add (show_button);

        //var label = new Gtk.Label ("Hello Again World!");
        var main_window = new Gtk.ApplicationWindow (this);
        main_window.add (grid);

        show_button.clicked.connect (() => {
            var notification = new Notification ("Hello World");
            notification.set_body ("This is my first notification!");
            this.send_notification ("notify.app", notification);
        });

        main_window.show_all ();
    }

    public static int main (string[] args) 
    {
        var app = new MyApp ();
        return app.run (args);
    }
}
