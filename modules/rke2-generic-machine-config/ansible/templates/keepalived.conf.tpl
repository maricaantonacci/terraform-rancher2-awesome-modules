global_defs {
   notification_email {
     sysadmin@home.lab
   }
   notification_email_from {{ansible_hostname}}
   smtp_server localhost
   smtp_connect_timeout 30
}

vrrp_instance VI_1 {
    state {{keepalived_vrrp_instance_name}}
    interface eth0
    virtual_router_id 101
    priority {{keepalived_priority}}
    advert_int 1
    authentication {
        auth_type PASS
        auth_pass 1111
    }
    virtual_ipaddress {
        ${keepalived_vip}
    }
}
