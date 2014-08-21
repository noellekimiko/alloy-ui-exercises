<%@ include file="/html/portlet/init.jsp" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>

<h1>AlloyUI - Form Validator</h1>

<form id="form">
	<div class="alert alert-success hide" id="success">Success!</div>

	<label for="name">Name:</label>
	<input id="name" name="name" placeholder="Joe Bloggs" type="text" />

	<label for="email">Email:</label>
	<input id="email" name="email" placeholder="test@liferay.com" type="text" />

	<label for="date">Birthday:</label>
	<input id="date" name="date" placeholder="mm/dd/yyyy" type="text" />

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
			boundingBox: '#form',
			rules: {
				email: {
					email: true,
					required: true
				},
				name: {
					alpha: true,
					required: true
				},
				date: {
					date: true,
					required: true
				}
			},
			on: {
				submit: function(event) {
					A.one('#success').show();

					event.validator.formEvent.halt();
				}
			}
		}
	);
</aui:script>