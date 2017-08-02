# Kismet package
kismet-pkg:
  pkg.installed:
    - name: kismet

# Kismet sevice file
/etc/systemd/system/kismet.service:
  file.managed:
    - source: salt://piwids/files/kismet.service
    - user: root
    - group: root
    - mode: 664
  require:
    - pkg: kismet-pkg

# reload systemd
systemd-reload:
  cmd.wait:
    - name: systemctl daemon-reload 
    - watch:
      - file: /etc/systemd/system/kismet.service

# Kismet config
/etc/kismet/kismet.conf:
  file.managed:
    - source: salt://piwids/files/kismet.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 664
  require:
    - pkg: kismet-pkg

# Data dir
/var/cache/kismet:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644

# Kismet service
kismet-service:
  service.running:
    - name: kismet
    - enable: True
    - require:
      - file: /var/cache/kismet
      - file: /etc/systemd/system/kismet.service
      - pkg: kismet
    - watch:
      - file: /etc/kismet/kismet.conf
