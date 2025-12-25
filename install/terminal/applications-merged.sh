sudo mkdir -p /etc/xdg/menus/applications-merged/
sudo tee /etc/xdg/menus/applications-merged/codecompass.menu <<EOF
<!DOCTYPE Menu PUBLIC "-//freedesktop//DTD Menu 1.0//EN"
"http://www.freedesktop.org/standards/menu-spec/1.0/menu.dtd">
<Menu>
  <Name>Applications</Name>
  <Menu>
    <Name>CodeCompass</Name>
    <Directory>codecompass.directory</Directory>
    <Include>
      <Category>X-CodeCompass</Category>
    </Include>
  </Menu>
</Menu>
EOF
