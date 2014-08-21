<%@ include file="/html/portlet/init.jsp" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>

<h1>AlloyUI - Char Counter</h1>

<input id="input" type="text" />
<span id="counter"></span> character(s) remaining

<!--
Start using AlloyUI
Then initialize AlloyUI and load a module, e.g., node.
-->
<aui:script use="aui-char-counter">
	// Initialize AUI character counter

	new A.CharCounter(
		{
			counter: '#counter',
			input: '#input',
			maxLength: 10
		}
	);
</aui:script>