package com.forezp;

import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;
import org.springframework.cloud.netflix.hystrix.dashboard.EnableHystrixDashboard;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@EnableEurekaClient
@RestController
@EnableHystrix
@EnableHystrixDashboard
public class ServiceLucyApplication {

	public static void main(String[] args) {
		SpringApplication.run(ServiceLucyApplication.class, args);
	}

	@Value("${server.port}")
	String port;
	@RequestMapping("/hello")
	@HystrixCommand(fallbackMethod = "helloError")
	public String home(@RequestParam String name) {
		return "hello "+name+",i  am hello and from port:" +port;
	}

	public String helloError(String name) {
		return "hello,"+name+",sorry,error!";
	}
}
