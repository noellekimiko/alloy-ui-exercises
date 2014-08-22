<%@ include file="/html/portlet/init.jsp" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>

<h1>AlloyUI - Validator Taglib</h1>

<aui:form action="" method="post" name="fm">
	<aui:input name="name" />

	<aui:input name="email">
		<aui:validator name="email" />
		<aui:validator name="required" />
	</aui:input>

	<aui:input name="birthday" type="text">
		<aui:validator name="date" />
		<aui:validator name="required" />
	</aui:input>

	<aui:input label="password" name="password1" />

	<aui:input label="enter-again" name="password2">
		<aui:validator name="equalTo">
			'#<portlet:namespace />password1'
		</aui:validator>
	</aui:input>

	<aui:button-row>
		<aui:button onClick='<%= "portlet08_getContent();" %>' type="submit" />
		<aui:button value="reset" />
	</aui:button-row>
</aui:form>

<aui:script>
	function portlet08_getContent() {
		return window.<portlet:namespace />editor.getHTML();
	}
</aui:script>