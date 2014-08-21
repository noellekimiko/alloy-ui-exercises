<%@ include file="/html/portlet/init.jsp" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>

<h1>AlloyUI - Char Counter</h1>

<input id="portlet03_charInput" type="text" />
<span id="portlet03_counter"></span> character(s) remaining

<!--
Start using AlloyUI
Then initialize AlloyUI and load a module, e.g., node.
-->
<aui:script use="aui-char-counter">
	// Initialize AUI character counter

	new A.CharCounter(
		{
			counter: '#portlet03_counter',
			input: '#portlet03_charInput',
			maxLength: 10
		}
	);
</aui:script>