# CDH-5.13.1_centos7_install

![avatar](cloudera-manager�ܹ�ͼ.png)

## һ������
* ϵͳ:centos7
* ����:8��/16G�ڴ�/100GӲ�� ������
* ��������:3̨������
* jdk:1.7������
* python:2.7
* mysql:����汾

## �������谲װ��
1. CM��:
http://archive.cloudera.com/cm5/cm/5/cloudera-manager-centos7-cm5.13.1_x86_64.tar.gz
2. PARCEL����
http://archive.cloudera.com/cdh5/parcels/5.13.1/CDH-5.13.1-1.cdh5.13.1.p0.2-el7.parcel
http://archive.cloudera.com/cdh5/parcels/5.13.1/CDH-5.13.1-1.cdh5.13.1.p0.2-el7.parcel.sha1
http://archive.cloudera.com/cdh5/parcels/5.13.1/manifest.json
3. java-mysql����jar����
http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.22/mysql-connector-java-5.1.22.jar

## ����������������
1. ������
	* 3̨�������޸�/etc/sysconfig/network������������(CDH1,CDH2,CDH3)
	* hostname CDH1 // hostname CDH2 // hostname CDH3
2. hosts����
	* 3̨�����޸�hosts��
		```
		* 192.168.*.* CDH1
		* 192.168.*.* CDH2
		* 192.168.*.* CDH3
		```
3. ssh���ܵ�¼
	* 3̨��������ssh���ܵ�¼
		```
		* ssh-keygen
		* ssh-copy-id CDH1
		* ssh-copy-id CDH2
		* ssh-copy-id CDH3
		```
4. jdk����ȷ��
	* echo $JAVA_HOME ����
	* java --version ȷ��jdk��������
5. ��װntp
	```
	* yum install ntp -y
	* systemctl start ntpd.service����#��������
	* systemctl enable ntpd.service����#����Ϊ��������
	```
6. �رշ���ǽ
	```
	* systemctl stop firewalld.service #ֹͣfirewall
	* systemctl disable firewalld.service #��ֹfirewall��������
	```
7. yum��װ
	```
	* yum install -y chkconfig python bind-utils psmisc libxslt zlib sqlite cyrus-sasl-plain cyrus-sasl-gssapi fuse fuse-libs redhat-lsb bzip2
	```
8. ����
	* (1) echo never > /sys/kernel/mm/transparent_hugepage/defrag
	* (2) echo never > /sys/kernel/mm/transparent_hugepage/enabled
	* vim /etc/rc.local #��(1),(2)������ӽ�ȥ
	
	* sysctl vm.swappiness=10
	* vim /etc/sysctl.conf ���vm.swappiness=10
	
	* setenforce 0
	* vim /etc/selinux/config  #��SELINUX=enforcing��ΪSELINUX=disabled�����ùر�

## �ġ���װcloudera-manager
1. mysql��������
	* ��̨��������� mysql-connector-java-5.1.22.jar �� /usr/share/java
	* ��̨������jar�������޸�Ϊmysql-connector-java.jar
2. ��cloudera-manager����ӵ���̨����
	* mkdir /opt/cloudera-manager
	* tar -zxvf cloudera-manager-centos7-cm5.13.1_x86_64.tar.gz -C /opt/cloudera-manager
3. �����û�cloudera-scm
	* ��̨������useradd --system --no-create-home --shell=/bin/false --comment "Cloudera SCM User" cloudera-scm
4. ����CM Agent
	* ��̨����: �޸��ļ�/opt/cloudera-manager/cm-5.13.1/etc/cloudera-scm-agent/config.ini �� server_hostΪ���ڵ�(server�ڵ�)������������CDH1����
5. ����CM Server���ݿ�(ֻ��server�ڵ�)
	```
	mysql -u root -p
	use mysql;
	grant all on *.* to 'temp'@'CDH1' identified by 'temp' with grant option;
		
	cd /opt/cloudera-manager/cm-5.13.1/share/cmf/schema/
	./scm_prepare_database.sh mysql temp -h CDH1 -utemp -ptemp --scm-host CDH1 temp temp
	```
6. ����ParcelĿ¼
	```
	Server�ڵ�
		�C mkdir -p /opt/cloudera/parcel-repo
		�C chown cloudera-scm:cloudera-scm /opt/cloudera/parcel-repo
	Agent�ڵ�
		�C mkdir -p /opt/cloudera/parcels
		�C chown cloudera-scm:cloudera-scm /opt/cloudera/parcels
	```
7. ����CDH����Դ(ֻ��server�ڵ�)
	```
	cp CDH-5.13.1-1.cdh5.13.1.p0.2-el7.parcel  /opt/cloudera/parcel-repo
	cp CDH-5.13.1-1.cdh5.13.1.p0.2-el7.parcel.sha1 /opt/cloudera/parcel-repo/CDH-5.13.1-1.cdh5.13.1.p0.2-el7.parcel.sha
	cp manifest.json /opt/cloudera/parcel-repo
	```
8. ����cloudera-manager
	```
	cd /opt/cloudera-manager/cm-5.13.1/etc/init.d/
	CDH1:ִ��./cloudera-scm-server start
	CDH1,2,3ִ�У�./cloudera-scm-agent start
	```
	��CDH1����7182��7180�˿ڣ���CDH1,02,03�������ӵ�CDH1��7182�ӿ�ʱ��������ɡ�
	��ͨ�����淽ʽ��֤��
	```
	CDH1:ִ��./cloudera-scm-server status
	CDH1,2,3ִ�У�./cloudera-scm-agent status
	
	���� http://CDH1:7180/ ����������
	```
	��������⣬��鿴/opt/cloudera-manager/cm-5.13.1/log�µĶ�Ӧ��־������cloudera-manager-server��cloudera-manager-agent��
## �塢�������
![avatar](install_picture_1/1.png)
![avatar](install_picture_1/2.png)
![avatar](install_picture_1/3.png)
![avatar](install_picture_1/4.png)
![avatar](install_picture_1/5.jpg)
![avatar](install_picture_1/6.jpg)
![avatar](install_picture_1/7.jpg)
![avatar](install_picture_1/8.jpg)
![avatar](install_picture_1/9.jpg)
![avatar](install_picture_1/10.png)
	