<%@ include file="/html/portlet/init.jsp" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>

<h1>AlloyUI - Registration Form</h1>

<div id="portlet06_progressBar"></div>

<div id="portlet06_pagination" class="pagination">
	<ul class="pagination-content">
		<li><a>Prev</a></li>
		<li><a>1</a></li>
		<li><a>2</a></li>
		<li><a>Next</a></li>
	</ul>
</div>

<div class="portlet06_page">
	<form class="portlet06_form" id="portlet06_form1" onSubmit="event.preventDefault();">
		<fieldset>
			<label class="control-label" for="portlet06_name">Name:</label>
			<input id="portlet06_name" name="portlet06_name" placeholder="Joe Bloggs" type="text" />

			<label class="control-label" for="portlet06_email">Email:</label>
			<input id="portlet06_email" name="portlet06_email" placeholder="test@liferay.com" type="text" />

			<label class="control-label" for="portlet06_date">Birthday:</label>
			<input id="portlet06_date" name="portlet06_date" placeholder="mm/dd/yyyy" type="text" />
		</fieldset>
	</form>
</div>

<div class="hide portlet06_page">
	<form class="portlet06_form" id="portlet06_form2" onSubmit="event.preventDefault();">
		<fieldset>
			<p>
				Crop your headshot.
			</p>

			<div id="portlet06_imageCropper">
				<img id="portlet06_image" src="http://alloyui.com/image-cropper/img/crop-image.jpg" />
			</div>
		</fieldset>

		<fieldset>
			<label class="control-label" for="portlet06_charInput">Write a description about yourself <em>(Must be less than 160 characters)</em>:</label>
			<textarea name="portlet06_charInput" id="portlet06_charInput"></textarea>
			<br />
			<span id="portlet06_counter"></span> characters remaining.
		</fieldset>

		<fieldset>
			<button class="btn" id="portlet06_submitBtn">Submit</button>
			<button class="btn" id="portlet06_resetBtn">Reset</button>
		</fieldset>

		<fieldset class="hide" id="portlet06_output">
			<legend class="fieldset-legend">
				<span class="legend">
					Output
				</span>
			</legend>

			<div id="portlet06_message"></div>
		</fieldset>
	</form>
</div>

<!--
Start using AlloyUI
Then initialize AlloyUI and load a module, e.g., node.
-->
<aui:script use="aui-button,aui-char-counter,aui-datepicker,aui-form-validator,aui-image-cropper,aui-pagination,aui-progressbar">
	// Create variables

	var formValidator = [];

	// Grab pages
	var forms = A.all('.portlet06_form');
	var pages = A.all('.portlet06_page');

	// Grab output element

	var output = A.one('#portlet06_output');

	// Update progress bar

	var updateProgress = function() {
		var validForms = 0;

		for (var i = 0; i < formValidator.length; i++) {
			formValidator[i].validate();

			if (!formValidator[i].hasErrors()) {
				validForms++;
			}
		}

		var ratio = Math.round(validForms/formValidator.length * 100);

		progressBar.set('value', ratio);
	};

	// Create progress bar

	var progressBar = new A.ProgressBar(
		{
			boundingBox: '#portlet06_progressBar',
			label: '0%',
			on: {
				complete: function(event) {
					this.set('label', 'Complete!');
				},
				valueChange: function(event) {
					this.set('label', event.newVal + '%');
				}
			},
			value: 0,
			width: 700
		}
	).render();

	// Create paginator

	new A.Pagination(
		{
			after: {
				changeRequest: function(event) {
					if (event.state.page === 2 && !imgCropper.rendered) {
						imgCropper.render();

						imgCropper.rendered = true;
					}
				}
			},
			boundingBox: '#portlet06_pagination',
			circular: false,
			contentBox: '#portlet06_pagination .pagination-content',
			on: {
				changeRequest: function(event) {
					var lastState = event.lastState,
						state = event.state;

					if (lastState) {
						pages.item(lastState.page - 1).hide();

						updateProgress();
					}

					pages.item(state.page - 1).show();
				}
			},
			page: 1
		}
	).render();

	// Initialize form validator and fields

	formValidator[0] = new A.FormValidator(
		{
			boundingBox: '#portlet06_form1',
			rules: {
				portlet06_email: {
					email: true,
					required: true
				},
				portlet06_name: {
					alpha: true,
					required: true
				}
			}
		}
	);

	formValidator[1] = new A.FormValidator(
		{
			boundingBox: '#portlet06_form2',
			fieldStrings: {
				charInput: 'Word must be between 1 and 160 characters.'
			},
			rules: {
				portlet06_charInput: {
					rangeLength: [1, 160],
					required: true
				}
			}
		}
	);

	// Initialize AUI button

	new A.Button(
		{
			on: {
				click: function() {
					updateProgress();

					var validForms = 0;

					var formValidatorLength = formValidator.length;

					for (var i = 0; i < formValidatorLength; i++) {
						if (!formValidator[i].hasErrors()) {
							validForms++;
						}
					}

					if (validForms != formValidatorLength) {
						validForms = 0;
					}

					generateOutput(validForms);
				}
			},
			srcNode: '#portlet06_submitBtn'
		}
	).render();

	// Create generated output

	var generateOutput = function(valid) {
		var messageNode = A.one('#portlet06_message');
		var outputNode = A.one('#portlet06_output');

		var cssClass = valid ? "text-success" : "text-error";
		var messageString = valid ? "All forms are complete!" : "Please fill out the entire form!";

		var message = A.Node.create("<div class='" + cssClass + "'>" + messageString + "</div>");

		messageNode.setHTML(message);

		outputNode.show();
	};

	// Initialize AUI button

	new A.Button(
		{
			on: {
				click: function() {
					location.reload();
				}
			},
			srcNode: '#portlet06_resetBtn'
		}
	).render();

	// Initialize datepicker

	new A.DatePicker(
		{
			on: {
				selectionChange: function(event) {
					console.log(event.newSelection)
				}
			},
			popover: {
				zIndex: 1
			},
			trigger: '#portlet06_date'
		}
	);

	// Initialize char counter

	var charCounter = new A.CharCounter(
		{
			counter: '#portlet06_counter',
			input: '#portlet06_charInput',
			maxLength: 160
		}
	);

	// Initialize image cropper

	var imgCropper = new A.ImageCropper(
		{
			srcNode: '#portlet06_image'
		}
	);
</aui:script>