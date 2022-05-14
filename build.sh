#!/bin/bash

add-apt-repository ppa:xubuntu-dev/extras -y

#----------------------------------------------------------------------------------------------------------------------------------------------------------

sed -i 's|# deb-src|deb-src|g' /etc/apt/sources.list

cat /etc/apt/sources.list
apt-get update

apt-get build-dep xfce4-panel
apt-get source xfce4-panel

apt-get install xfce4-dev-tools

cd xfce4-panel-*

linha1=$(grep -n "^static GtkMenu \*$" libxfce4panel/xfce-panel-plugin.c  | cut -d\: -f1)
linha2=$(grep -n "return plugin->priv->menu;" libxfce4panel/xfce-panel-plugin.c  | cut -d\: -f1)
sed -i "${linha1},${linha2}s/gtk_widget_show (item);/\/\/ gtk_widget_show (item);/" libxfce4panel/xfce-panel-plugin.c

#----------------------------------------------------------------------------------------------------------------------------------------------------------

linha1=$(grep -n "^xfce_panel_plugin_button_press_event (GtkWidget      \*widget,$" libxfce4panel/xfce-panel-plugin.c  | cut -d\: -f1)
linha2=$(($(grep -n "gtk_menu_popup_at_pointer (menu, (GdkEvent \*) event);$" libxfce4panel/xfce-panel-plugin.c  | cut -d\: -f1)+1))

sed -i "${linha1},${linha2}s/gtk_menu_popup_at_pointer (menu, (GdkEvent/\/\/ gtk_menu_popup_at_pointer (menu, (GdkEvent/" libxfce4panel/xfce-panel-plugin.c

dpkg-buildpackage -b

cd ..

#----------------------------------------------------------------------------------------------------------------------------------------------------------

tar -cvf pacotes.tar.gz *.deb
