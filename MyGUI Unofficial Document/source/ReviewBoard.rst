ReviewBoard
===========

`ReviewBoard <https://www.reviewboard.org>`_

安装
----

* 添加数据源

	``rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm``

	.. warning:: 容易出现无法连接 epel 的问题，如果出现这个问题，编辑 vim /etc/yum.repos.d/epel.repo ，把 https 替换成 http 

	``yum install ReviewBoard``

* 执行以下命令 ::

	yum install httpd
	chkconfig httpd on
	yum install mysql-server
	chkconfig mysqld on
	yum install python-setuptools
	yum install python-devel
	yum install memcached
	yum install subversion
	yum install python-subvertpy

* MySQL

	* ``service mysqld start``
	* ``mysqladmin -u root password 123456``
	* ``mysql -uroot -p123456``
	* 执行以下 ::
	  
		insert into mysql.user(Host,User,Password) values("localhost","reviewboard",password("chenliang")); flush privileges; create database reviewboard default charset utf8 collate utf8_general_ci; GRANT ALL PRIVILEGES ON reviewboard.* TO 'reviewboard'@'localhost' identified by 'chenliang';
	
	  
* 启动网站

	* ``rb-site install --console /var/www/reviewboard``
	* :file:`/etc/sysconfig/iptables` ，增加一行，开放端口 **80**
	* 执行命令::
	  
		chown -R apache:apache /var/www/reviewboard/
		cp /var/www/reviewboard/conf/apache-wsgi.conf /etc/httpd/conf.d
		service iptables restart
		service httpd start
		setsebool -P httpd_can_network_connect 1
		setsebool -P httpd_can_network_connect_db 1

常见问题
--------

* 如果文件编码有问题(例如包含 ^M 字符)，会导致 ReviewBoard 无法正确显示 Diff，如图:

  .. image:: /images/ReviewBoardCantDisplayDiff.png