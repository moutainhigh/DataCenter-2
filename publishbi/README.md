# README

## ���
	�÷�����Ҫ���ڽű�����ͷ�����
	1��ͨ��svn���ű��ύ��svn��������
	2��ͨ���÷���svn�еĽű�������ִ�з�������
	3���ڷ����Ĺ����У���ʹ��mysql����

## һ������׼��
	* python3.6
	TODO:
	pip install svn
	pip install sqlalchemy
	pip install DBUtils
	
	* svn-1.7.14
	svn����
	���ڷ���������ϣ��½�һ���ļ��У�checkout��svnĿ¼��
	������Ҫ����svn update���û����롣
	
	* mysql-�汾����
	mysql��ʼ������ű�,�ο�publish.sql��
	
	* ��������Ҫ�Ӳ������������ִ�нű����������ܵ�¼��
## ��������
	* dev����������ҪȨ�޹��������
	util/staticUtil.py����
	env = 'dev'
	svn_root = "/home/jerry/che/SVN/bi_service_test" #���ò��������checkout��svnĿ¼
	remote_root = "/root/SVN"	#����ִ�з������ϣ���Ҫ���ű����õ��ļ��У����з�������Ҫ��ͬ��
	remote_hosts = ["root@escnode6","root@escnode5"]	#����ִ�нű�������
	
	* prod��������ҪȨ�޹��������
	util/staticUtil.py������dev����ͬ
	�����������ݿ�t_biservice_user��
	userid��������Ȩ�ޣ��ӿڴ���ʱ����cookie�е�LOGIN_USER_ID��ȡ����
	username�������⡣
	pathΪsvn_rootĿ¼�µ����·��
## ��������
	1��config/config.conf���ö˿ںź�mysql��Ϣ��
	2��ֱ�ӽ���Ŀ���Ƶ�������ĳĿ¼�£�python index.py ���ɡ�
## �ġ�ʹ��
	���vueǰ��ʹ�ã�������Ҫ�У�
	1��ͨ���ļ�����ѯsvnȫ·����
	2��ͨ��svnȫ·����ѯ��ǰ������svn�汾��
	3��ͨ��svnȫ·����svn�汾�����ű���
	4��ͨ��svnȫ·�������������°汾�Ľű���