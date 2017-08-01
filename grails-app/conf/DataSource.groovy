dataSource {
    driverClassName = "com.mysql.jdbc.Driver"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    
    development {
		dataSource {
		 username = "atcsdevb_shrusr"
		 password = "EsM1)Q8?4hd~"
		 pooled = true
		 dbCreate = "update"
		 driverClassName = "com.mysql.jdbc.Driver"
		 url = "jdbc:mysql://webdev01.bergen.org:3306/atcsdevb_clinicaloutcomes?user=atcsdevb_shrusr&password=EsM1)Q8?4hd~"
		 dialect = org.hibernate.dialect.MySQL5InnoDBDialect
		 properties {
		  validationQuery = "SELECT 1"
		  testOnBorrow = true
		  testOnReturn = true
		  testWhileIdle = true
		  timeBetweenEvictionRunsMillis = 1800000
		  numTestsPerEvictionRun = 3
		  minEvictableIdleTimeMillis = 1800000
		  }
		}
    }
    
    test {
		dataSource {
			username = "hoshida"
			password = "Hoshidalab_ken"
			pooled = true
			dbCreate = "update"
			driverClassName = "com.mysql.jdbc.Driver"
			url = "jdbc:mysql://aa1sw6lboctyto5.c34ro1ahmqac.us-east-1.rds.amazonaws.com:3306/ebdb?user=hoshida&password=Hoshidalab_ken"
			properties {
			validationQuery = "SELECT 1"
			testOnBorrow = true
			testOnReturn = true
			testWhileIdle = true
			timeBetweenEvictionRunsMillis = 1800000
			numTestsPerEvictionRun = 3
			minEvictableIdleTimeMillis = 1800000
			}
		}
    }
production {
		dataSource {
		 username = "hoshida"
		 password = "Hoshidalab_ken"
		 pooled = true
		 dbCreate = "update"
		 driverClassName = "com.mysql.jdbc.Driver"
		 url = "jdbc:mysql://aa1sw6lboctyto5.c34ro1ahmqac.us-east-1.rds.amazonaws.com:3306/ebdb?user=hoshida&password=Hoshidalab_ken"
		 dialect = org.hibernate.dialect.MySQL5InnoDBDialect
		 properties {
		  validationQuery = "SELECT 1"
		  testOnBorrow = true
		  testOnReturn = true
		  testWhileIdle = true
		  timeBetweenEvictionRunsMillis = 1800000
		  numTestsPerEvictionRun = 3
		  minEvictableIdleTimeMillis = 1800000
		  }
		}
	 }
}
