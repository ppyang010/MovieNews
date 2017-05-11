package org.movie.aspect;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class LogAspect {
	
	@Pointcut("execution(* org.movie.service..*.*(..))")
	public void pointCut() {
		
	}
	
	
	@Before("pointCut()")
	public void beginLog() {
		System.out.println("--------------begin before advice -----------------");
	}
	@After("pointCut()")
	public void endLog() {
		System.out.println("----------------------end after advice ------------");
	}
	
}
