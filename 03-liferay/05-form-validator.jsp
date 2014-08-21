<%@ include file="/html/portlet/init.jsp" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>

<h1>AlloyUI - Form Validator</h1>

<form id="portlet05_form">
	<div class="alert alert-success hide" id="portlet05_success">Success!</div>

	<label for="portlet05_name">Name:</label>
	<input id="portlet05_name" name="portlet05_name" placeholder="Joe Bloggs" type="text" />

	<label for="portlet05_email">Email:</label>
	<input id="portlet05_email" name="portlet05_email" placeholder="test@liferay.com" type="text" />

	<label for="portlet05_date">Birthday:</label>
	<input id="portlet05_date" name="portlet05_date" placeholder="mm/dd/yyyy" type="text" />

	<br>

	<button class="btn">Submit</button>
	<button class="btn" type="reset">Reset</button>
</form>

<!--
Start using AlloyUI
Then initialize AlloyUI and load a module, e.g., node.
-->
<aui:script use="aui-button,aui-form-validator">
	// Initialize form validator and fields

	new A.FormValidator(
		{
			boundingBox: '#portlet05_form',
			rules: {
				portlet05_email: {
					email: true,
					required: true
				},
				portlet05_name: {
					alpha: true,
					required: true
				},
				portlet05_date: {
					date: true,
					required: true
				}
			},
			on: {
				submit: function(event) {
					A.one('#portlet05_success').show();

					event.validator.formEvent.halt();
				}
			}
		}
	);
</aui:script>