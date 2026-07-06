#!/bin/bash
grep -q "USE_SID_AS_SERVICE_LISTENER" /opt/oracle/oradata/dbconfig/FREE/listener.ora || echo "USE_SID_AS_SERVICE_LISTENER = ON" >> /opt/oracle/oradata/dbconfig/FREE/listener.ora
lsnrctl reload
