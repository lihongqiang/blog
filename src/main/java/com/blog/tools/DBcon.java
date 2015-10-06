package com.blog.tools;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.Properties;


/**
 * <p>
 * Title:����������
 * </p>
 * <p>
 * Description:�������ݿ����������
 * </p>
 * <p>
 * Copyright: Copyright (c) 2009
 * </p>
 * <p>
 * Company: 9956
 * </p>
 * @author chenliang
 * @version 1.0
 */

public class DBcon {
	
	/**
	 * �ӻ����������Ӷ���
	 * @return connection
	 * @throws SQLException
	 */

	// jdbc����
	public synchronized Connection getConnection() {
		Connection conn = null;
		String connect = "";// ����
		String user = ""; // �û���
		String password = ""; // ����
		String driver = "";

		// �������ļ�������ݿ����Ӳ���
		InputStream is = getClass().getResourceAsStream("db.properties");
		Properties dbProps = new Properties();
		try {
			dbProps.load(is);

			driver = dbProps.getProperty("driver");
			connect = dbProps.getProperty("connection");
			user = dbProps.getProperty("user");
			password = dbProps.getProperty("password");
		} catch (IOException e) {
			// TODO �Զ����� catch ��
			System.out.println("DBCon():read db.properties error"
					+ e.getMessage());
		}

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(connect, user, password);
			return conn;
		} catch (Exception ex) {
			System.out.println("DBCon():Connection:" + ex.getMessage());
			conn = null;
			return null;
		}
	}
    public static void close(Connection conn,PreparedStatement pstm,Statement st,ResultSet rs){
    	try{
    		if(conn != null)	conn.close();
    		if(pstm != null)	pstm.close();
    		if(st != null)	  st.close();
    		if(rs != null)    rs.close();
    		
    	}catch(Exception e){
    		System.out.println("DBcon() close()"+e.getMessage());
    	}
    }

}
