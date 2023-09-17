  - name: Download ufw-docker
    become: yes
    get_url:
      url: https://github.com/chaifeng/ufw-docker/raw/master/ufw-docker
      dest: /usr/local/bin/ufw-docker
      mode: '0755'
