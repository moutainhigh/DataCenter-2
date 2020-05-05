CREATE TABLE `t_biservise_dir` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '���ļ���ID',
  `name` varchar(255) NOT NULL COMMENT '�ļ�������',
  `path` varchar(1500) NOT NULL COMMENT '�ļ���·��',
  `cutime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='biservise�ļ��й���';

CREATE TABLE `t_biservise_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL COMMENT '���ļ���ID',
  `name` varchar(255) NOT NULL COMMENT '�ļ�������',
  `path` varchar(1500) NOT NULL COMMENT '�ļ���·��',
  `svn_version` int(11) NOT NULL DEFAULT '0' COMMENT 'svn���°汾',
  `svn_author` varchar(255) NOT NULL DEFAULT '' COMMENT 'svn����',
  `check_version` int(11) NOT NULL DEFAULT '0' COMMENT '���ͨ�����°汾',
  `check_author` varchar(255) NOT NULL DEFAULT '' COMMENT '���ͨ������',
  `publish_version` int(11) NOT NULL DEFAULT '0' COMMENT '�������°汾',
  `publish_author` varchar(255) NOT NULL DEFAULT '' COMMENT '��������',
  `cutime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='biservise�ļ�����';

CREATE TABLE `t_biservise_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL COMMENT '�û�ID',
  `username` varchar(255) NOT NULL COMMENT '�û���',
  `path` varchar(1500) NOT NULL COMMENT '�û�ӵ�е�Ȩ��',
  `cutime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='biservise�û�Ȩ�޹���';


insert into t_biservise_dir (pid,name,path) values (0,'','');
insert into t_biservise_user (userid,username,path) values (0,'dr.who','');
