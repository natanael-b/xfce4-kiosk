#!/bin/bash

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

apt install ./*.deb  # Instalar os pacotes gerados é necessário para recompilar plugins que não vem por padrão

plugins=("xfce4-docklike-plugin")
baseurl="https://archive.xfce.org/src/panel-plugins/"

echo 
echo "---------------------------------------------------------------------------------------------"
echo 

for plugin in ${plugins[@]}; do
  version=$(wget -q -O - "${baseurl}/${plugin}/"             | sed '$d' | sed '$d' | tail -n1 | cut -d\" -f2)
  package=$(wget -q -O - "${baseurl}/${plugin}/${version}/"  | sed '$d' | sed '$d' | tail -n1 | cut -d\" -f2)
  full_url="${baseurl}/${plugin}/${version}/${package}"
  
  echo 
  echo " Plugin: ${plugin}"
  echo "Version: ${version}"
  echo "    URL: ${full_url}"
  echo
  wget "${full_url}"
  echo
  (
    source_dir=$(basename -s.tar.bz2 "${package}")
    
    tar -xf "${package}"
    
    cd "${source_dir}"
    
    ./configure
    make
    make install
  )
  echo
  echo "---------------------------------------------------------------------------------------------"
done




#----------------------------------------------------------------------------------------------------------------------------------------------------------

tar -cvf pacotes.tar.gz *.deb
