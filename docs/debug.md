# Debugging ScaleIO

## Port 6611
The mdm service will listen on port 6611 for the master server in the cluster.
More importantly though because the role of the master can change in the cluster,
the mdm service will not not always listen on port 6611. Until you have created
a cluster with ```scli --create_mdm_cluster``` the mdm service will also not be
listening on port 6611.

## Basic commands
* Query the cluster: ```scli --mdm_ip <cluster ip> --query_cluster```
* View cluster events: ```/opt/emc/scaleio/mdm/bin/showevents.py```

## Default locations
* Logs:  /opt/emc/scaleio/[mdm,sdc,sds]/logs/
* Config: /opt/emc/scaleio/[mdm,sdc,sds]/cfg/
