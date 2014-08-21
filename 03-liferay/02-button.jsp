<%@ include file="/html/portlet/init.jsp" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>

<h1>AlloyUI - Button</h1>

<div id="foo">I am a foo button</div>

<!--
Start using AlloyUI
Then initialize AlloyUI and load a module, e.g., node.
-->
<aui:script use="aui-button">
	// Render AUI button

	new A.Button(
		{
			on: {
				click: function(event) {
					alert('You have clicked the button');
				}
			},
			srcNode: '#foo'
		}
	).render();
</aui:script>