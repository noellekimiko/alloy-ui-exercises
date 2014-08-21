<%@ include file="/html/portlet/init.jsp" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>

<h1>AlloyUI - Taglib</h1>

<aui:form action="" method="post" name="fm">
	<aui:input name="name" />

	<aui:input name="email" />

	<aui:fieldset>
		<aui:select label="maximum-activities-to-display" name="preferences--max--">
			<aui:option label="1" />
			<aui:option label="2" />
			<aui:option label="3" />
			<aui:option label="4" />
			<aui:option label="5" />
			<aui:option label="10" />
			<aui:option label="15" />
			<aui:option label="20" />
		</aui:select>
	</aui:fieldset>

	<aui:button-row>
		<aui:button type="submit" />
		<aui:button value="reset" />
	</aui:button-row>
</aui:form>