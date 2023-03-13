package com.greedy.insaProject.dbTest;

import static org.junit.jupiter.api.Assertions.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.jupiter.api.Test;

public class JDBCTests {
	
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testConnection() {
		
		try(Connection con = 
				DriverManager.getConnection(
                // Oracle19 버전인 경우 => "jdbc:oracle:thin:@localhost:1521:orcl"
                // Oracle11 버전인 경우 => ""
						"jdbc:oracle:thin:@localhost:1521:XE",
						"C##ITNBIZ",
						"ITNBIZ")){
			System.out.println(con);
		} catch (Exception e) {
			fail(e.getMessage());
		}
		
	}

}
