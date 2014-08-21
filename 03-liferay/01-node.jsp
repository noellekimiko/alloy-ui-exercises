<%@ include file="/html/portlet/init.jsp" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>

<h1>AlloyUI - Node</h1>

<div id="portlet01_foo">I am a foo element</div>

<!--
Start using AlloyUI
Then initialize AlloyUI and load a module, e.g., node.
-->
<aui:script use="aui-node">
	// Grab the elements

	var foo = A.one('#portlet01_foo');

	// Create HTML node

	var node = A.Node.create('<div />');

	// Set CSS styles

	node.setStyle('background', 'black');
	node.setStyle('color', 'white');

	// Set HTML

	node.setHTML('I am a bar element');

	// Append node

	foo.append(node);
</aui:script>