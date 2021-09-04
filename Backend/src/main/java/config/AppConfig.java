package config;

import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import javax.sql.DataSource;
import java.util.Properties;

/**
 * Created by CoT on 10/14/17.
 */
@Configuration
@EnableTransactionManagement
@EnableWebMvc
@ComponentScan({"controller", "service"})
public class AppConfig extends WebMvcConfigurerAdapter {

    @Override
    public void addResourceHandlers(final ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**")
                .addResourceLocations("/WEB-INF/classes/static/");
    }


    @Bean
    public LocalSessionFactoryBean sessionFactory() {

        Properties properties = new Properties();
        //For mysql
        properties.put("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
        properties.put("hibernate.show_sql", true);
        properties.put("hibernate.hbm2ddl.auto", "update");

        LocalSessionFactoryBean sessionFactoryBean = new LocalSessionFactoryBean();

        sessionFactoryBean.setPackagesToScan("model");

        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");

//        FOR LOCAL RUNNING
//        dataSource.setUrl("jdbc:mysql://localhost:3306/data?useSSL=false");
//        dataSource.setUsername("root");
//        dataSource.setPassword("Rm!t123sept");

//        FOR DEPLOYMENT
        dataSource.setUrl("jdbc:mysql://bfbb7cbaddb3c6:ab8cb86b@us-cdbr-east-02.cleardb.com/heroku_efc08862f4df15c?reconnect=true");
        dataSource.setUsername("bfbb7cbaddb3c6");
        dataSource.setPassword("ab8cb86b");

        sessionFactoryBean.setDataSource(dataSource);
        sessionFactoryBean.setHibernateProperties(properties);

        return sessionFactoryBean;
    }

    @Bean
    public HibernateTransactionManager transactionManager() {
        HibernateTransactionManager tx = new HibernateTransactionManager();
        tx.setSessionFactory(sessionFactory().getObject());
        return tx;
    }

}


