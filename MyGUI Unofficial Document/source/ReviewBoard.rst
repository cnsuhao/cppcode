ReviewBoard
===========

`ReviewBoard <https://www.reviewboard.org>`_

安装
----

* httpd
  
	* 执行 ``yum install httpd``
	* 编辑 :file:`/etc/sysconfig/iptables` ，增加一行，开放商端口 **80**
	* 执行 ``chkconfig httpd on``

* MySQL

	* 执行 ``yum install mysql-server``
	* 执行 ``chkconfig mysqld on``
	* 执行 ``service mysqld start``
	* 执行 ``mysqladmin -u root password 123456``
	* 执行 ``mysql -uroot -p123456``
	* 执行 ``insert into mysql.user(Host,User,Password) values("localhost","reviewboard",password("chenliang"));``
	* 执行 ``flush privileges;``
	* 执行 ``create database reviewboard default charset utf8 collate utf8_general_ci;``
	* 执行 ``GRANT ALL PRIVILEGES ON reviewboard.* TO 'reviewboard'@'127.0.0.1' identified by 'reviewboard';``
	* 执行 ``GRANT ALL PRIVILEGES ON reviewboard.* TO 'reviewboard'@'127.0.0.1' identified by 'reviewboard';``

* ReviewBoard
	* ``su -c 'rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm'``
	* ``yum install ReviewBoard``
	* ``yum install python-setuptools``
	* ``yum install python-devel``
	* ``yum install memcached``
	* ``yum --enablerepo=epel install python-subvertpy``
	  
* 启动网站

	* ``rb-site install /var/www/reviewboard``
	* ``chown -R apache:apache /var/www/reviewboard/``
	* ``cp /var/www/reviewboard/conf/apache_wsgi.conf /etc/httpd/conf.d``
	* 执行 ``service httpd start``