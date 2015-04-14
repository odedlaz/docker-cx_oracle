#
# Oracle Instant Client Dockerfile
#

# Pull base image.
FROM sxoded/python-runtime

ENV ORACLE_HOME /opt/oracle/instantclient_12_1
ENV LD_RUN_PATH=$ORACLE_HOME

COPY instantclient/* /tmp/

RUN \
	mkdir -p /opt/oracle && \
	unzip "/tmp/instantclient*.zip" -d /opt/oracle && \
	ln -s $ORACLE_HOME/libclntsh.so.12.1 $ORACLE_HOME/libclntsh.so && \
	pip install cx_Oracle
