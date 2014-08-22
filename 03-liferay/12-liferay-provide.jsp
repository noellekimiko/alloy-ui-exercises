<%@ include file="/html/portlet/init.jsp" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>

<h1>AlloyUI - Liferay.provide()</h1>

<aui:form action="" method="post" name="fm" onSubmit='<%= "event.preventDefault(); portlet12_generateOutput();" %>'>
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
		<div id="portlet12_message"></div>
	</aui:fieldset>
</aui:form>

<aui:script>
	// Create generated output

	Liferay.provide(
		window,
		'portlet12_generateOutput',
		function() {
			var A = AUI();

			var messageNode = A.one('#portlet12_message');

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
		Liferay.provide(); is to allow for the creation of functions that have asynchronous dependencies, but to allow them to run in a synchronized fashion.

		Liferay.provide(); generates a global function called '<portlet:namespace />generateOutput'.

		function <portlet:namespace />_generateOutput() {
			AUI().use(
				'aui-node',
				function() {
					//..Same code as above..
				}
			);
		}

		For performance:

			Without Liferay.provide();, every time '<portlet:namespace />generateOutput' is called it must look up its' dependencies.

			Liferay.provide(); allows the dependencies to be looked up only once, no matter the number of times the function is called.


		For consistency:

			Without Liferay.provide();, there is a chance that the callbacks are fired in an asynchronous manner.  Meaning that it is
			possible for the functions to execute in a different order than that in which they were called.

			With Liferay.provide();, it is guaranteed that the functions it creates will be executed in the order they are called.

		Note:

			Liferay.provide(); is still an asynchronous function, so data cannot be returned from the functions it creates. It guarantees sequential ordering, not synchronicity.

			Calling the function is the same way. '<portlet:namespace />generateOutput();'

			The method signature is as follows:

				Liferay.provide(obj, methodName, methodFn, modules);
					obj is the object where to create the method. If you wish to create a global function, this would be the window object.

					methodName is the name of the method you wish to create.

					methodFn is the function definition as you would normally define it.

					modules is an array of JavaScript modules that will be loaded before the function is executed.
	--%>

</aui:script>