# COSC2101 SEPT

# Doctor Appointment Booking System

### Group 13
> * Nguyen Le Thuy Linh
> * Nguyen Phuoc Cuong
> * Truong Phu Cuong
> * Le Ngoc Danh

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
> Username: admin
> Password: admin123

`Default PATIENT account:`
> Username: patient
> Password: patient123
    
   
