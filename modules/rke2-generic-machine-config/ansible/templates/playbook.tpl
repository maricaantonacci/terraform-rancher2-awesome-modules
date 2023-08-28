---
- name: prepare => nodes
  hosts: all
  become: true
  vars:
    install_keepalived: ${install_keepalived}
  tasks:
    - name: install => linux-modules-extra for raspi4
      apt:
       name:
       - linux-modules-extra-raspi
      when: ansible_architecture == "arm64" and ansible_distribution == 'Ubuntu'

    - name: install => keepalived
      apt:
       name:
       - keepalived
      when: install_keepalived == true

- name: configure => master keepalived
  hosts: master_nodes[0]
  become: true
  vars: 
    install_keepalived: ${install_keepalived}
    keepalived_vrrp_instance_name: MASTER
    keepalived_priority: 100
  tasks:
    - name: copy => keepalived.conf
      template:
       dest: /etc/keepalived/keepalived.conf
       src: ./keepalived.conf.j2
      when: install_keepalived == true

- name: configure => backup keepalived
  hosts: master_nodes[1:]
  become: true
  vars:
    install_keepalived: ${install_keepalived}
    keepalived_vrrp_instance_name: BACKUP
    keepalived_priority: 101
  tasks:
    - set_fact: keepalived_priority={{ keepalived_priority | int + 1 }}

    - name: copy => keepalived.conf
      template:
       dest: /etc/keepalived/keepalived.conf
       src: ./keepalived.conf.j2
      when: install_keepalived == true

- name: restart & enable => keepalived
  hosts: master_nodes
  become: true
  vars:
    install_keepalived: ${install_keepalived}
  tasks:
    - name: restart & enable => keepalived.conf
      systemd:
       name: keepalived
       state: restarted
       daemon_reload: yes
       enabled: yes
      when: install_keepalived == true

- name: register => master nodes 
  hosts: master_nodes
  vars:
    all_in_one: ${all_in_one}
  tasks:
    - name: Register Nodes to the Cluster.
      shell: ${cluster_node_command} --etcd --controlplane
      when: all_in_one == false

- name: register => worker nodes 
  hosts: worker_nodes
  vars:
    all_in_one: ${all_in_one}
  tasks:
    - name: Register Nodes to the Cluster.
      shell: ${cluster_node_command} --worker
      when: all_in_one == false

- name: register => all-in-one nodes 
  hosts: all
  vars:
    all_in_one: ${all_in_one}
  tasks:
    - name: Register Nodes to the Cluster.
      shell: ${cluster_node_command} --etcd --controlplane --worker
      when: all_in_one == true