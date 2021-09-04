# COSC2101 SEPT

# Doctor Appointment Booking System 
[![Build Status](https://travis-ci.org/s3740805/SEPT_Group13.svg?branch=master)](https://travis-ci.org/s3740805/SEPT_Group13) 
[![Heroku](https://pyheroku-badge.herokuapp.com/?app=doctorbookingsystem)](https://doctorbookingsystem.herokuapp.com/login)

### Group 13
> * Nguyen Le Thuy Linh
> * Nguyen Phuoc Cuong
> * Truong Phu Cuong
> * Le Ngoc Danh

## BACKEND
### Backend using:
* MySQL
* Spring MVC
* Hibernate

### Before running:
- Go to file `.../config/AppConfig.java` and make changes based on your database.    
```
  dataSource.setDriverClassName("com.mysql.jdbc.Driver");
  dataSource.setUrl("jdbc:mysql://localhost:[your port]/[your schema]");
  dataSource.setUsername([your username]);
  dataSource.setPassword([your password]);
```
### Running:
- Open terminal
```
  cd [your path to ../Backend]
  mvn clean install
  mvn jetty:run
```

`Access through:` http://localhost:8080/

##  FRONTEND
### Frontend with Registration & Login using:
* MySQL
* Spring Boot
* Spring Security
* Spring Data JPA
* Hibernate
* JSP
* Bootstrap

### Before running:
- Go to file `.../resources/application.properties` and make changes based on your database.
    
```spel
  spring.datasource.url=jdbc:mysql://localhost:[your port]/[your schema]?allowPublicKeyRetrieval=true&useSSL=false
  spring.datasource.username=[your username]
  spring.datasource.password=[your password]
  spring.datasource.driver-class-name=com.mysql.jdbc.Driver
```
### Running:
- Open terminal
```
  cd [your path to ../Frontend+Register+Login]
  mvn clean install
  mvn spring-boot:run
```
`Access through:` http://localhost:9090/

`Default ADMIN account:`
> * Username: admin
> * Password: admin123

`Default PATIENT/USER account:`
> * Username: patient
> * Password: patient123
