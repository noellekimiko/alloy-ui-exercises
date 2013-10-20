<%@ include file="/html/portlet/init.jsp" %>

<h1>AlloyUI - AUI Script Taglib</h1>

<aui:form action="" method="post" name="fm">
	<aui:input name="name" />
</aui:form>

<aui:script use="aui-node">
	console.log(A.one('#<portlet:namespace />name'));
</aui:script>