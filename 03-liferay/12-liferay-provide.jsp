<%@ include file="/html/portlet/init.jsp" %>

<h1>AlloyUI - Liferay.provide()</h1>

<aui:form action="" method="post" name="fm" onSubmit='<%= "event.preventDefault();" + renderResponse.getNamespace() + "generateOutput();" %>'>
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
		<aui:button type="submit" />
		<aui:button value="reset" />
	</aui:button-row>

	<aui:fieldset cssClass="hide" id="output">
		<div id="message"></div>
	</aui:fieldset>
</aui:form>

<aui:script>
	// Create generated output

	Liferay.provide(
		window,
		'<portlet:namespace />generateOutput',
		function() {
			var A = AUI();

			var messageNode = A.one('#message');

			var date = A.one('#<portlet:namespace />birthday');
			var email = A.one('#<portlet:namespace />email');
			var name = A.one('#<portlet:namespace />name');
			var outputNode = A.one('#<portlet:namespace />output');

			var messageString = 'My name is ' + name.val() + ' and my email address is ' + email.val() + '. My birthday is ' + date.val() + '.';

			messageNode.setHTML(messageString);

			outputNode.show();
		},
		['aui-node']
	);

	<%--
		The above code generates a global function called 'portletNamespace_generateOutput',
		exactly like the one below.

		function portletNamespace_generateOutput() {
			AUI().use('aui-node', function() {
				//..Same code as above..
			});
		}

		So why use 'Liferay.provide'?

		For performance:

			Without Liferay.provide, every time portletNamespace_generateOutput is called it must look up its' dependencies.

			Liferay.provide allows the dependencies to be looked up only once, no matter the number of times the function is called.


		For consistency:

			Without Liferay.provide, there is a chance that the callbacks are fired in an asynchronous manner.  Meaning that it is
			possible for the functions to execute in a different order than that in which they were called.

			With Liferay.provide, it is guaranteed that the functions it creates will be executed in the order they are called.

	--%>

</aui:script>