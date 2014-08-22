<%@ include file="/html/portlet/init.jsp" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>

<h1>AlloyUI - AUI Script Position Taglib</h1>

<aui:script position="inline" use="aui-node">
	var continueLoading = confirm('Would you like to continue loading the page?');

	if (continueLoading) {
		console.log(A.one('#<portlet:namespace />name'));
	}
</aui:script>

<aui:form action="" method="post" name="fm">
	<aui:input name="name" />
</aui:form>