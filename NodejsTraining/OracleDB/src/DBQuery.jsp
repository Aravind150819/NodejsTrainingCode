<%@page language="java" contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%!
// Implement this method to execute some server-side logic.
public JSONObject performLogic(JSONObject state, Map<String, String> additionalParams) throws Exception {
    
	JSONObject result = new JSONObject();
	try {
		JSONObject appSession = new JSONObject(state.getString("appSession"));
		String configFileDirectory = getServletConfig().getServletContext().getRealPath("") + "Config";
		Logger debugLogger = BackendLogManager.getLogger(appSession.getString("LoggerName"));
		debugLogger.debug("------- InsertCallInfo.jsp Entry -------");
		String stationNumber = state.getSting("stationNumber").trim();
		try {
			//Request
			JSONObject request = new JSONObject();
			request.put("transName", "StationNumberCheck");
			request.put("transType", "QUERY");
			request.put("configFilePath", configFileDirectory);
			request.put("request1",stationNumber);
			//Logging
			debugLogger.debug("Request");
			debugLogger.debug("  StationNumber: " + request.getString("request2")):
			debugLogger.debug("  ENDTIME		: " +  new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").format(new Date()));
			//Call DBConnector JAR to InsertCallInfo info
			JSONObject response = new DBManager().dbService(request);
			//Response
			debugLogger.debug("Response");
			if (response != null && "success".equalsIgnoreCase(response.getString("responseStatus"))) {//DB Success
				debugLogger.debug("  InsertCallInfo DB call success");
				appSession.put("Event", "success");
				appSession.put("InsertCallInfoEvent", "true");
			} else { //DB Failure
				debugLogger.error("  InsertCallInfo DB call failed");
				if (response == null) {
					debugLogger.error("  " + response);
				} else {
					debugLogger.error("  ERROR TYPE	: " + response.getString("errorType"));
					debugLogger.error("  ERROR MESSAGE: " + response.getString("errorMessage"));
				}
				appSession.put("Event", "failure");
			}
		} catch (Exception ex) { //Log error info
			debugLogger.error("  Encountered exception in InsertCallInfo.jsp : " + ex.toString());
			appSession.put("Event", "error");
		}
		debugLogger.debug("  Event : " + appSession.getString("Event"));
		debugLogger.debug("------- InsertCallInfo.jsp Exit -------");
		debugLogger.debug("*********** END OF THE CALL ************");
		result.put("appSession", appSession);
	} catch (Exception e) {
		System.out.println("Exception in InsertCardTransHistory.jsp : " + e.toString());
	}
    return result;
    
};
%>
<%-- GENERATED: DO NOT REMOVE --%> 
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONException"%>
<%@page import="java.util.Map"%>
<%@include file="../include/backend.jspf" %>