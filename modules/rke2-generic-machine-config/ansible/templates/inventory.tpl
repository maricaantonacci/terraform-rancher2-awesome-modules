[master_nodes]
%{ for master_nodes_ip in master_nodes_ips ~}
${master_nodes_ip}
%{ endfor ~}
[worker_nodes]
%{ for worker_nodes_ip in worker_nodes_ips ~}
${worker_nodes_ip}
%{ endfor ~}
