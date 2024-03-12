<%@page language="java" contentType="application/json;charset=UTF-8"
	pageEncoding="UTF-8"%>

<%!
   public JSONObject performLogic(JSONObject state, Map<String, String> additionalParams) throws Exception {
	JSONObject result = new JSONObject();
	JSONObject appSession = new JSONObject();
	try {
		// Reading the Properties file
		Properties ivrLoggerProps = new Properties();
		Properties appInfoProps = new Properties();
		ivrLoggerProps.load(new FileInputStream(new File(getServletConfig().getServletContext().getRealPath("/Config/Logger.properties"))));
		appInfoProps.load(new FileInputStream(new File(getServletConfig().getServletContext().getRealPath("/Config/AppInfo.properties"))));
		// Getting the key
		String connectionID = state.getString("CallUUID").trim();
		String sessionID = state.getString("GVPSessionID").split(";")[0];
		Context contvar = (Context) new InitialContext().lookup("java:comp/env");
		String env = (String) contvar.lookup("env");
		String ivrAppName = appInfoProps.getProperty("IVRAppName");
		String transactionNumberDays = appInfoProps.getProperty(env + ".TransactionNumberDays");
		String ivrAppServer = InetAddress.getLocalHost().getHostName();
		String arrivalTime = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").format(new Date());
		appSession.put("ARRIVALTIME", arrivalTime);
		appSession.put("environment", env);
		appSession.put("Language", "English");
		appSession.put("IVRAppName", ivrAppName);
		appSession.put("ConnID", connectionID);
		appSession.put("CED", "");
		// LoggerConfigure
		Properties loggerProps = new Properties();
		loggerProps.put("AppLogger_filePath", ivrLoggerProps.getProperty(env + ".AppLogger_filePath"));
		loggerProps.put("AppLogger_LoggerName", ivrLoggerProps.getProperty(env + ".AppLogger_LoggerName"));
		loggerProps.put("AppLogger_fileSize", ivrLoggerProps.getProperty(env + ".AppLogger_fileSize"));
		loggerProps.put("AppLogger_fileCount", ivrLoggerProps.getProperty(env + ".AppLogger_fileCount"));
		loggerProps.put("AppLogger_level", ivrLoggerProps.getProperty(env + ".AppLogger_level"));
		loggerProps.put("AppLogger_envType", ivrLoggerProps.getProperty(env + ".AppLogger_envType"));
		loggerProps.put("AppLogger_pattern", ivrLoggerProps.getProperty(env + ".AppLogger_pattern"));
		loggerProps.put("DbLogger_filePath", ivrLoggerProps.getProperty(env + ".DbLogger_filePath"));
		loggerProps.put("DbLogger_LoggerName", ivrLoggerProps.getProperty(env + ".DbLogger_LoggerName"));
		loggerProps.put("DbLogger_fileSize", ivrLoggerProps.getProperty(env + ".DbLogger_fileSize"));
		loggerProps.put("DbLogger_fileCount", ivrLoggerProps.getProperty(env + ".DbLogger_fileCount"));
		loggerProps.put("DbLogger_level", ivrLoggerProps.getProperty(env + ".DbLogger_level"));
		loggerProps.put("DbLogger_envType", ivrLoggerProps.getProperty(env + ".DbLogger_envType"));
		loggerProps.put("DbLogger_pattern", ivrLoggerProps.getProperty(env + ".DbLogger_pattern"));
		LoggerConfigure.loggerConfiguration(loggerProps);
		appSession.put("LoggerName", ivrLoggerProps.getProperty(env + ".AppLogger_LoggerName"));
		Logger debugLogger = BackendLogManager.getLogger(ivrLoggerProps.getProperty(env + ".AppLogger_LoggerName"));
		Date timeStamp = new Date();
		String loggingCommonFormat = "{" + sessionID + "}," + connectionID + ",";
		//Log Starting
		debugLogger.debug(loggingCommonFormat + "******************************************");
		debugLogger.debug(loggingCommonFormat + "*********** START OF THE CALL ************");
		debugLogger.debug(loggingCommonFormat + "*********** Main Callflow  ***************");
		debugLogger.debug(loggingCommonFormat + "*********** LoggerPropConfig.jsp  ********");
		try {
			//Getting MCP_IP & HostName
			String mcpIp = state.getString("mcp_IP").split(";")[0].split("@")[1].substring(0,state.getString("mcp_IP").split(";")[0].split("@")[1].indexOf(":"));
			String mcpHostName = InetAddress.getByName(mcpIp).getHostName();
			debugLogger.debug(loggingCommonFormat + "Environment : " + env);
			debugLogger.debug(loggingCommonFormat + "IVRApp : " + ivrAppName);
			debugLogger.debug(loggingCommonFormat + "ANI : " + state.getString("ANI").trim());
			debugLogger.debug(loggingCommonFormat + "DNIS : " + state.getString("DNIS").trim());
			debugLogger.debug(loggingCommonFormat + "ConnectionID : " + connectionID);
			debugLogger.debug(loggingCommonFormat + "ConnID : " + state.getString("ELV_CONNID"));
			debugLogger.debug(loggingCommonFormat + "SessionID : " + sessionID);
			debugLogger.debug(loggingCommonFormat + "MCP_IP : " + mcpIp);
			debugLogger.debug(loggingCommonFormat + "MCP_HostName : " + mcpHostName);
			debugLogger.debug(loggingCommonFormat + "IVRAppServer : " + ivrAppServer);
			// Getting ShortConnID
			String shortConnId = null;
			if (connectionID != null) {
				if (connectionID.length() >= 8)
					shortConnId = connectionID.substring(connectionID.length() - 9, connectionID.length());
				else
					shortConnId = connectionID.substring(0, connectionID.length());
			}
			if ((shortConnId != null) && (shortConnId.length() > 0)) {
				debugLogger.debug(loggingCommonFormat + "ShortConnId : " + shortConnId);
				appSession.put("shortConnId", shortConnId);
			}
			// Error Log Info
		} catch (Exception exc) {
			debugLogger.error(loggingCommonFormat + "Exception in LoggerPropConfig.jsp : " + exc);
		}
	} catch (Exception e) {
		System.out.println("Exception in LoggerPropConfig.jsp : " + e);
	}
	result.put("appSession", appSession);
	return result;
       };
   %>
<%-- GENERATED: DO NOT REMOVE --%>

<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.net.UnknownHostException"%>
<%@page import="java.util.Properties, java.io.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.*"%>
<%@page import="com.pointel.ivr.util.LoggerConfigure"%>
<%@page import="com.genesyslab.studio.backendlogic.BackendLogManager"%>
<%@page import="org.apache.logging.log4j.Logger"%>
<%@page import="java.net.InetAddress"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONException"%>
<%@include file="../include/backend.jspf"%>