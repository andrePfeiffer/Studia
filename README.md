# Studia

Precisa criar o arquivo: /src/main/resources/persistence-mysql.properties

jdbc.driver=com.mysql.jdbc.Driver
jdbc.url=jdbc:mysql://localhost:3306/studia?useSSL=false&amp;serverTimezone=UTC
jdbc.user=NOME-DO-USUARIO-MYSQL
jdbc.password=SENHA-DO-USUARIO-MYSQL

connection.pool.initialPoolSize=5
connection.pool.minPoolSize=5
connection.pool.maxPoolSize=20
connection.pool.maxIdleTime=3000

hibernate.dialect=org.hibernate.dialect.MySQLDialect
hibernate.show_sql=true
hibernate.packagesToScan=cc.studia.video.entity
