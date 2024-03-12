<%@page language="java" contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%!
// Implement this method to execute some server-side logic.
public JSONObject performLogic(JSONObject state, Map<String, String> additionalParams) throws Exception {
    
	JSONObject result = new JSONObject();
    try{
    	Properties ivrLoggerProps = new Properties();
    	ivrLoggerProps.load(new FileInputStream(new File(getServletConfig().getServletContext().getRealPath("/Config/Logger.properties"))));
		//System.out.println("Logger.properties : "+ivrLoggerProps.toString()); 
 		LoggerConfigure.loggerConfiguration(ivrLoggerProps);
 		String sessionID = state.getString("GVPSessionID").split(";")[0];
  		String connectId = state.getString("CallUUID").trim();
  		Date timeStamp = new Date();
    	String loggingCommonFormat = "{" + sessionID + "}," + connectId + "," + timeStamp + ",";
    	Thread.sleep(10000);
    	Logger logger= BackendLogManager.getLogger(ivrLoggerProps.getProperty("AppLogger_LoggerName"));
    	if(additionalParams.get("StringCofing").length()>0){
    		logger.debug(loggingCommonFormat + additionalParams.get("StringCofing"));
    		}
		if(additionalParams.get("BlockName").length()>0){
			logger.debug(loggingCommonFormat + additionalParams.get("BlockName"));
			}
		if(additionalParams.get("LogData").length()>0){
			logger.debug(loggingCommonFormat + additionalParams.get("LogData"));
			}
		}catch(Exception exception){
			
    }
    return result;
};
%>
<%@page import="java.util.*"%>
<%@page import="java.util.Properties, java.io.*"%>
<%@page import="com.pointel.ivr.util.LoggerConfigure"%>
<%@page import="com.genesyslab.studio.backendlogic.BackendLogManager"%>
<%@page import="org.apache.logging.log4j.Logger"%>
<%-- GENERATED: DO NOT REMOVE --%> 
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONException"%>
<%@page import="java.util.Map"%>
<%@include file="../include/backend.jspf" %>