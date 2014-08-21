Components
==================

Exercises using AlloyUI components

## Table of contents

1. [Button](#1-button)
2. [Char Counter](#2-char-counter)
3. [Scheduler](#3-scheduler)
4. [Carousel](#4-carousel)
5. [Form Validator](#5-form-validator)
6. [Registration Form](#6-registration-form)

## 1. Button

* In this exercise, we will use create a button that generates an alert box when clicked. Instead of using the regular `<button>` tag though, we will utilize an AlloyUI module `aui-button` to make a button out of a regular `<div>` element.

* To setup your file, be sure to include the AlloyUI seed and Bootstrap css files in the `<head>` section.

```html
<script src="http://cdn.alloyui.com/2.0.0pr7/aui/aui-min.js"></script>
<link href="http://cdn.alloyui.com/2.0.0pr7/aui-css/css/bootstrap.min.css" rel="stylesheet"></link>
```

* In the `<body>` section, we made a `<div>` element which we will turn into our AlloyUI button.

```html
<div id="foo">I am a foo button</div>
```

* Then we initialize AlloyUI and load the `aui-button` module.

```html
<script>
	YUI().use('aui-button', function(Y) {
		// Create a button and generate an alert box
	});
</script>
```

* Since we are creating an instance of `aui-button` from scratch, we use the `new` operator. We can use an object as an argument specify certain properties or behaviors of the button, which we will do in the next step. At the end, we have to call `.render()` to package all the information together.

```html
<script>
	YUI().use('aui-button', function(Y) {
		new Y.Button(
			{
				// Set attributes of the button
			}
		).render();
	});
</script>
```

* Now we get to set the behavior we described earlier: an alert box that opens when we click the button. We use the `on` attribute of `aui-button` and add a `click` event handler. Inside the event handler, we can make the alert box.

```html
<script>
	YUI().use('aui-button', function(Y) {
		new Y.Button(
			{
				on: {
					click: function(event) {
						alert('You have clicked the button');
					}
				}

				// Additional attributes go here
			}
		).render();
	});
</script>
```

* However, we're not quite finished yet. The button we've just created isn't attached to anything on the page, so the `click` event handler won't ever used. We need to specify a `srcNode` for where this new `aui-button` should go. We do this by using the id of the `<div>` element we created earlier.

```html
<script>
	YUI().use('aui-button', function(Y) {
		new Y.Button(
			{
				on: {
					click: function(event) {
						alert('You have clicked the button');
					}
				},
				srcNode: '#foo'
			}
		).render();
	});
</script>
```

* Feel free to add more features to your button or even change what happens when it is clicked. The AlloyUI API has information about the [A.Button class](http://alloyui.com/api/classes/A.Button.html) and also about the [YUI Button class](http://alloyui.com/api/classes/Button.html) that it extends. Any of the listed attributes can be used. Be sure to place each attribute on its own line, with a comma at the end of each line except the last as shown above.

* You can read more about the `new` operator [here](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/new) if you would like. We will be using it for all of the exercises in this section.

**Completed example: [01-button.html](https://github.com/eduardolundgren/alloy-ui-exercises/blob/master/02-components/01-button.html)**

## 2. Char Counter

* The component we will use in this exercise, `aui-char-counter`, is used in conjunction with `<input>` elements. It allows us to specify a maximum number of characters for that `<input>` and also privides a counter so that we can display the remaining number of characters.

* Setup your file, making sure to include the AlloyUI seed and Bootstarap css files.

* Inside the `<body>`, we will make our `<input>` element where we will limit the characters typed in. Afterwards, we make a `<span>` element to serve as a container for our counter.

```html
<input id="input" type="text" />
<span id="counter"></span> character(s) remaining
```

* Next we initialize AlloyUI, load the `aui-char-counter` module, and create a `new` instance of the char counter.

```html
<script>
	YUI().use('aui-char-counter', function(Y) {
		new Y.CharCounter(
			{
				// Set attributes of the char counter
			}
		);
	});
</script>
```

* We use the ids of the elements we created to tell the char counter where the `counter` should be displayed and what `input` element it is tied to. Finally, we set the maximum number of characters allowed with `maxLength`.

```html
<script>
	YUI().use('aui-char-counter', function(Y) {
		new Y.CharCounter(
			{
				counter: '#counter',
				input: '#input',
				maxLength: 10
			}
		);
	});
</script>
```

* Try it out by typing some text in the input field. You should not be able to type more than 10 characters, and the counter should decrease as you type.

* API docs for `aui-char-counter` can be found [here](http://alloyui.com/api/classes/A.CharCounter.html).

**Completed example: [02-char-counter.html](https://github.com/eduardolundgren/alloy-ui-exercises/blob/master/02-components/02-char-counter.html)**

## 3. Scheduler

* The `aui-scheduler` module is a way to view and plan your schedule. There are several options to view events by the day, week, or month and also an agenda option to see all upcoming events.

* Setup your file with the AlloyUI seed and Bootstrap css files.

* Inside the `<body>`, create a `<div>` element to house your scheduler.

```html
<div id="scheduler"></div>
```

* Initialize AlloyUI and load the `aui-scheduler` module.

```html
<script>
	YUI().use('aui-scheduler', function(Y) {
		// Create scheduler with events and different views
	});
</script>
```

* The scheduler requires a bit more setup than the other AlloyUI modules we have worked with previously. First, we will create a few calendar events to be included in the scheduler. We make an array of these `events`, each with `content` for the title, a `startDate` and an `endDate`. The `Date` objects have the inputs `year`, `month`, `day`, and `hour`. For the `month`, the value is one less than the calendar value (January is 0). Also, for the `hour`, values go from 0 to 24 where 0 is 12 midnight, and 24 is midnight the next day. The `hour` can be omitted if the event goes all day.

> **Note:** this step is not required for the scheduler; events can also be added in a browser. However since this exercise is not inside a portal instance, events created via a browser will not be saved.  We created these events to save time when testing that the module displays correctly, but in other cases these automatic events could be used for events such as holidays or large meetings.

```html
<script>
	YUI().use('aui-scheduler', function(Y) {

		// Create calendar events for AUI scheduler
		var events = [
			{
				content: 'Symposium Workshop',
				endDate: new Date(2014, 9, 19, 18),
				startDate: new Date(2014, 9, 19, 16)
			},
			{
				content: 'Symposium Workshop',
				endDate: new Date(2014, 9, 20, 15),
				startDate: new Date(2014, 9, 20, 14)
			}
		];
	});
</script>
```

* Next, the different displays for viewing events (day, week, month, and agenda) have to be created with the `new` operator. We also have to use `.SchedulerEventRecorder()` to create an event recorder which will allow us to add events directly to the scheduler.

```html
<script>
	YUI().use('aui-scheduler', function(Y) {

		// Create calendar events for AUI scheduler
		var events = [
			{
				content: 'Symposium Workshop',
				endDate: new Date(2014, 9, 19, 18),
				startDate: new Date(2014, 9, 19, 16)
			},
			{
				content: 'Symposium Workshop',
				endDate: new Date(2014, 9, 20, 15),
				startDate: new Date(2014, 9, 20, 14)
			}
		];

		// Initialize AUI scheduler views
		var agendaView = new Y.SchedulerAgendaView();
		var dayView = new Y.SchedulerDayView();
		var eventRecorder = new Y.SchedulerEventRecorder();
		var monthView = new Y.SchedulerMonthView();
		var weekView = new Y.SchedulerWeekView();
	});
</script>
```

* We are ready to actually create the `aui-scheduler` instance now. We use the `new` operator and specify additional attributes to configure it.
   * `boundingBox` is where the scheduler will be placed on the page.
   * `date` is the date that the scheduler first displays when it is loaded.
   * `eventRecorder` is the event recorder we created in the last step. It is how the schdule is edited dynamically.
   * `items` are any events that you want to include automatically. In this case, they are the events we made at the beginning
   * `render` is set to `true` so that the scheduler renders when the page is loaded.
   * `views` are the different ways to display events we created in the last step and are passed in as an array

```html
<script>
	YUI().use('aui-scheduler', function(Y) {

		// Create calendar events for AUI scheduler
		var events = [
			{
				content: 'Symposium Workshop',
				endDate: new Date(2014, 9, 19, 18),
				startDate: new Date(2014, 9, 19, 16)
			},
			{
				content: 'Symposium Workshop',
				endDate: new Date(2014, 9, 20, 15),
				startDate: new Date(2014, 9, 20, 14)
			}
		];

		// Initialize AUI scheduler views
		var agendaView = new Y.SchedulerAgendaView();
		var dayView = new Y.SchedulerDayView();
		var eventRecorder = new Y.SchedulerEventRecorder();
		var monthView = new Y.SchedulerMonthView();
		var weekView = new Y.SchedulerWeekView();

		// Initialize AUI scheduler
		new Y.Scheduler(
			{
				boundingBox: '#scheduler',
				date: new Date(2014, 9, 19),
				eventRecorder: eventRecorder,
				items: events,
				render: true,
				views: [dayView, weekView, monthView, agendaView]
			}
		);
	});
</script>
```

* View the completed file in any browser. Try adding, editing and deleting events, and the different displays.

* API docs for `aui-scheduler` can be found [here](http://alloyui.com/api/modules/aui-scheduler.html) and another tutorial with additional configuration options can be found [here](http://alloyui.com/tutorials/scheduler/).

**Completed example: [03-scheduler.html](https://github.com/eduardolundgren/alloy-ui-exercises/blob/master/02-components/03-scheduler.html)**

## 4. Carousel

* `aui-carousel` is a way to display a collection of images. The carousel scrolls through them automatically, but users can also manually control it.

* Setup your file as always. Inside the `<body>`, we will set up the elements for our carousel. First, we make a `<div>` as a container.

```html
<div id="carousel">
	<!-- Carousel items go here -->
</div>
```

* Then, we make a `<div>` for each item. It is important that they have the `class="carousel-item"` attribute for the carousel to function. In the `style` attribute, we have to specify the image to use as well as the `height` and `width` for each item.

```html
<div id="carousel">
	<div class="carousel-item" style="background: url(http://alloyui.com/carousel/img/1.jpg); height:250px; width: 700px;"></div>
	<div class="carousel-item" style="background: url(http://alloyui.com/carousel/img/2.jpg); height:250px; width: 700px;"></div>
	<div class="carousel-item" style="background: url(http://alloyui.com/carousel/img/3.jpg); height:250px; width: 700px;"></div>
	<div class="carousel-item" style="background: url(http://alloyui.com/carousel/img/4.jpg); height:250px; width: 700px;"></div>
</div>
```

* Initialize AlloyUI and load the `aui-carousel` module. Create an instance of `aui-carousel` with the `new` operator. This module must be rendered, so we also specify that at this time.

```html
<script>
	YUI().use('aui-carousel', function(Y) {
		new Y.Carousel(
			{
				// Set attributes of the carousel
			}
		).render();
	});
</script>
```

* Lastly, we configure the carousel. We use `contentBox` to indicate where the content is housed. It plays a similar role to `boundingBox` which we saw in the last exercise, but is not the same. The difference is explained [here](https://github.com/liferay/alloy-ui/wiki/FAQs). The `height` and `width` properties control the size of the carousel.

```html
<script>
	YUI().use('aui-carousel', function(Y) {
		new Y.Carousel(
			{
				contentBox: "#carousel",
				height: 250,
				width: 700
			}
		).render();
	});
</script>
```

* API docs for `aui-carousel` can be found [here](http://alloyui.com/api/classes/A.Carousel.html) and another tutorial with additional configuration options can be found [here](http://alloyui.com/tutorials/carousel/).

**Completed example: [04-carousel.html](https://github.com/eduardolundgren/alloy-ui-exercises/blob/master/02-components/04-carousel.html)**

## 5. Form Validator

* `aui-form-validtor` provides a way to check the data input into a form and make sure it is the correct type.

* Setup your file as always. In the `<body>`, we will make a `<form>` to validate.

```html
<form id="form">
	<!-- Form fields go here -->
</form>
```

* Then we add some `<input>` elements to our form, with labels and some placeholder text to show what the form is expecting. Notice that all the inputs have the same `type` attribute, however; they are still functionally the same at this point. We also add a button to submit the form and one to reset it to be blank.

```html
<form id="form">
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
```

* The last element to add to the form is a `<div>` to display a message when the form is submitted with all the correct information. We want to start with this message hidden, so we give it the class `hide`.

```html
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
```

* Initialize AlloyUI and load the `aui-form-validator` module. Then create an instance of  `aui-form-validator` using the `new` operator.

```html
<script>
	YUI().use('aui-form-validator', function(Y) {
		new Y.FormValidator(
			{
				// Set attributes of the form validator
			}
		);
	});
</script>
```

* We will start to add the attributes for the new form validator. The first one is `boundingBox` which we saw in exercise 3 and indicates where the component should be placed on the page.

```html
<script>
	YUI().use('aui-form-validator', function(Y) {
		new Y.FormValidator(
			{
				boundingBox: '#form'

				// Additional attributes go here
			}
		);
	});
</script>
```

* Next is the `rules` attribute. This is where we specify the types of information that each `<input>` field in the form will accept. The inputs are referred to by their `name` attribute, represented without the quotation marks. We set the type of data we want as an attribute of the appropriate `<input>` element, and set the value to true. Also, since we want the form to be complete, we set `required` to `true` for each `<input>`. With these rules, the user cannot submit the form if the data in the `<input>` fields is wrong or missing.

```html
<script>
	YUI().use('aui-form-validator', function(Y) {
		new Y.FormValidator(
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
				}

				// Additional attributes go here
			}
		);
	});
</script>
```

* To finish, we specify what should happen when the form is correctly submitted. We use the `.on()` method with the `submit` event handler. First, we want to show our `success` message. Then, we want to stop the validation process.

```html
<script>
	YUI().use('aui-form-validator', function(Y) {
		new Y.FormValidator(
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
						Y.one('#success').show();

						event.validator.formEvent.halt();
					}
				}
			}
		);
	});
</script>
```

* Try out your form in a browser. Try using the form with incorrect types of data or with information missing, and note help text that informs you of the problem.

* API docs for `aui-form-validator` can be found [here](http://alloyui.com/api/classes/A.FormValidator.html) and another tutorial with additional configuration options can be found [here](http://alloyui.com/tutorials/form-validator/).

**Completed example: [05-form-validator.html](https://github.com/eduardolundgren/alloy-ui-exercises/blob/master/02-components/05-form-validator.html)**

## 6. Registration Form

* In this last example, we will use a combination of AlloyUI modules to demonstrate how powerful these modules are, even while using relatively few lines of code. We will develop a registration form, adding components iteratively.

---

**Progress bar**

* The first module we want to use is `aui-progressbar` so we will be able to display how much of the registration form has been completed.

* In the `<body>`, we make a `<div>` element that will be the container for the progressbar.

```html
<div id="progressBar"></div>
```

* Then, inside of the `<script>` tags, we initialize AlloyUI and load the `aui-progressbar` module. We will need to check if the forms are valid before updating the progress, so let's go ahead and load `aui-form-validator` now also.

```html
<script>
	YUI().use(
		'aui-form-validator',
		'aui-progressbar',
		function(Y) {
			// Create and update the progressbar
		}
	);
</script>
```

> **Note:** It is [AlloyUI style](https://github.com/liferay/alloy-ui/wiki/Code-Style-Guidelines#new-lines) to not have line breaks afer parentheses or commas, but since there are so many modules being used in this exercise, we are going to consciously break this guideline.

* Before we actually create the progressbar, we need to define a function for how it is updated. If we have an array of the form validators, we can iterate over that array and test how many forms have valid data. Then, we can take the ratio of valid forms to the total number of forms and use this as the percentage of progress we have made.

```html
<script>
	YUI().use(
		'aui-form-validator',
		'aui-progressbar',
		function(Y) {

			// Create formValidator variable

			var formValidator = [];

			// Update progress bar

			var updateProgress = function() {
				var validForms = 0;

				// Count the number of valid forms

				for (var i = 0; i < formValidator.length; i++) {
					formValidator[i].validate();

					if (!formValidator[i].hasErrors()) {
						validForms++;
					}
				}

				// Get the percentage of forms that are valid

				var ratio = Math.round(validForms/formValidator.length * 100);

				progressBar.set('value', ratio);
			};
		}
	);
</script>
```

* Now we can create the actual progressbar. We set the `boundingBox` to the `<div>` we made earlier, set the `width` to `700`, and set an initial `label` of `0%` completed as well as an intial `value` of `0`. We use the `on` attribute to specify the behavior we want. If everything is `complete`, whe set the `label` accordingly. If not, we have to possibly update the `label` as more progress is made. Since `updateProgress` works by changing the `value` of the `progressBar`, we use the `valueChange` attribute and set the `label` to the new ratio. Finally, we `.render()` the progressbar.

```html
<script>
	YUI().use(
		'aui-form-validator',
		'aui-progressbar',
		function(Y) {

			// Create formValidator variable

			var formValidator = [];

			// Update progress bar

			var updateProgress = function() {
				var validForms = 0;

				// Count the number of valid forms

				for (var i = 0; i < formValidator.length; i++) {
					formValidator[i].validate();

					if (!formValidator[i].hasErrors()) {
						validForms++;
					}
				}

				// Get the percentage of forms that are valid

				var ratio = Math.round(validForms/formValidator.length * 100);

				progressBar.set('value', ratio);
			};

			// Create progress bar

			var progressBar = new Y.ProgressBar(
				{
					boundingBox: '#progressBar',
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
		}
	);
</script>
```

---

**Pagination**

* The next module we will use is `aui-pagination`. This requires adding two types of elements in the `<body>`: a `<div>` element for the pagination controls and other `<div>` elements to hold the page contents.
   * For the pagination controls, there should be an unordered list with linked items for each page. These will be the buttons in the controls. There are also two extra buttons: `Prev` and `Next` to go forward or backwards through the form. The class names are important for finding the items later.
   * For the `<div>` elements that will hold the page contents, it is important that they all have the `class` of `page`. Later, we will find the elements by this class. Also, every page after the first should also have the `class` of `hide`, so that its contents will not be visible at first.

```html
	<div id="pagination" class="pagination">
		<ul class="pagination-content">
			<li><a>Prev</a></li>
			<li><a>1</a></li>
			<li><a>2</a></li>
			<li><a>Next</a></li>
		</ul>
	</div>

	<div class="page">
		<!-- Contents of page 1 -->
	</div>

	<div class="hide page">
		<!-- Contents of page 2 -->
	</div>
```

* Moving on to the `<script>` section, we need to add `aui-pagination` to the list of modules to load.

```html
<script>
	YUI().use(
		'aui-form-validator',
		'aui-pagination',
		'aui-progressbar',
		function(Y) {
			// Code for progressbar goes here
		}
	);
</script>
```

* Now we need to grab the `pages` we created and create the `aui-pagination` instance with the `new` operator. We set some attributes as described below, and then we `.render()` it.
   * `boundingBox` is for the position of the pagination controls on the page.
   * `circular` sets if the `Next` button can cycle back to the beginning from the end. We don't want this behavior for our form, so we set it to `false`.
   * `contentBox` is a direct decendent of `boundingBox` and houses the content. We use the inner `<div>` element of `#pagination`
   * `on` together with `changeRequest` specifies what happens when one of the links in the pagination controls is clicked. Basically it will `hide` the previous page and `show` the current page. If it is the last page, it will also call our `updateProgress()` function from progressbar
   * `page` sets what page will be displayed first. We set it so that page `1` is displayed.

```html
<script>
	YUI().use(
		'aui-form-validator',
		'aui-pagination',
		'aui-progressbar',
		function(Y) {
			// Code for progressbar goes here

			// Grab pages

			var pages = Y.all('.page');

			// Create paginator

			new Y.Pagination(
				{
					boundingBox: '#pagination',
					circular: false,
					contentBox: '#pagination .pagination-content',
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
		}
	);
</script>
```

---

**Form Validator**

* We are going to put content on both of the pages we created in the last section and use `aui-form-validator` to check the input data.
   * For page 1, we want two `<input>` fields: `Name` and `Email`. We add a `<label>` and `placeholder` text for each one. The structure of this page should look familiar from the last exercise.
   * For page 2, we will use one `<textarea>` field to add a personal description. Although we have previously only used `aui-form-validator` for `<input>` elements, the process of validating the data for a `<textarea>` is the same.

```html
	<!-- Page 1 -->
	<div class="page">
		<form class="form" id="form1" onSubmit="event.preventDefault();">
			<fieldset>
				<label class="control-label" for="name">Name:</label>
				<input id="name" name="name" placeholder="Joe Bloggs" type="text" />

				<label class="control-label" for="email">Email:</label>
				<input id="email" name="email" placeholder="test@liferay.com" type="text" />
			</fieldset>
		</form>
	</div>

	<!-- Page 2 -->
	<div class="hide page">
		<form class="form" id="form2" onSubmit="event.preventDefault();">
			<fieldset>
				<label class="control-label" for="charInput">Write a description about yourself <em>(Must be less than 160 characters)</em>:</label>
				<textarea name="charInput" id="charInput"></textarea>
			</fieldset>
		</form>
	</div>
```

* We had loaded the `aui-form-validator` module when we worked on the `progressBar`, so we can move ahead to validating both forms. Recall that we have an array `formValidator` that is suppose to hold the form validators. So we will create two instances of `aui-form-validator` with the `new` operator and save them inside this array. We use the `boundingBox` attribute to set which form each form validator corresponds to.

```html
<script>
	YUI().use(
		'aui-form-validator',
		'aui-pagination',
		'aui-progressbar',
		function(Y) {
			// Code for previous sections goes here

			// Initialize form validator and fields

			formValidator[0] = new Y.FormValidator(
				{
					boundingBox: '#form1'
					// Validate data in form 1
				}
			);

			formValidator[1] = new Y.FormValidator(
				{
					boundingBox: '#form2'
					// Validate data in form 2
				}
			);
		}
	);
</script>
```

* We can now define the acceptable data for each form.
   * In form 1, we have an `email` field and a `name` field. We set the appropriate type of data as an attribute and set both to be `required`.
   * In form 2, we want to limit the number characters to a maximum of `160`and since it is also `required`, there is a minimum of `1`.

```html
<script>
	YUI().use(
		'aui-form-validator',
		'aui-pagination',
		'aui-progressbar',
		function(Y) {
			// Code for previous sections goes here

			// Initialize form validator and fields

			formValidator[0] = new Y.FormValidator(
				{
					boundingBox: '#form1',
					rules: {
						email: {
							email: true,
							required: true
						},
						name: {
							alpha: true,
							required: true
						}
					}
				}
			);

			formValidator[1] = new Y.FormValidator(
				{
					boundingBox: '#form2',
					rules: {
						charInput: {
							rangeLength: [1, 160],
							required: true
						}
					}
				}
			);
		}
	);
</script>
```

* Both forms can now be validated, and will affect the progress for how complete the form is accordingly.

---

**Datepicker**

* For form 1, we also want to include a field for the participant's birthday. Since we know the information is a date, we will use the `aui-datepicker` module for this `<input>` field. We include a `<label>` and some `placeholder` text so that it is clear what type of data is intended.

```html
	<!-- Page 1 -->
	<div class="page">
		<form class="form" id="form1" onSubmit="event.preventDefault();">
			<fieldset>
				<label class="control-label" for="name">Name:</label>
				<input id="name" name="name" placeholder="Joe Bloggs" type="text" />

				<label class="control-label" for="email">Email:</label>
				<input id="email" name="email" placeholder="test@liferay.com" type="text" />

				<label class="control-label" for="date">Birthday:</label>
				<input id="date" name="date" placeholder="mm/dd/yyyy" type="text" />
			</fieldset>
		</form>
	</div>
```

* Then, we load the `aui-datepicker` module and create an instance of the module with the `new` operator.

```html
<script>
	YUI().use(
		'aui-datepicker',
		'aui-form-validator',
		'aui-pagination',
		'aui-progressbar',
		function(Y) {
			// Code for previous sections goes here

			new Y.DatePicker(
				{
					// Set attributes for the datepicker
				}
			);
		}
	);
</script>
```

* We finish by configuring our datepicker.
   * `popover` is the popover window that appears to select the date. We give it a `zIndex` of `1` so that it will be in front of other objects on the page, and therefore be visible.
   * `trigger` specifies what should make the popover window appear. We set it to be the id of our `<input>` field for `Birthday`.

```html
<script>
	YUI().use(
		'aui-datepicker',
		'aui-form-validator',
		'aui-pagination',
		'aui-progressbar',
		function(Y) {
			// Code for previous sections goes here

			new Y.DatePicker(
				{
					popover: {
						zIndex: 1
					},
					trigger: '#date'
				}
			);
		}
	);
</script>
```

---

**Char Counter**

* For form 2, we limited the number of characters that could be input into the text field to 160 but right now there is not a good way to see how many characters are left. To solve this problem, we will use the `aui-char-counter` module.

* We already have the `<textarea>` that will be used for this char counter instance, but we need to add an area for the counter to be displayed.

```html
	<!-- Page 2 -->
	<div class="hide page">
		<form class="form" id="form2" onSubmit="event.preventDefault();">
			<fieldset>
				<label class="control-label" for="charInput">Write a description about yourself <em>(Must be less than 160 characters)</em>:</label>
				<textarea name="charInput" id="charInput"></textarea>
				<br />
				<span id="counter"></span> characters remaining.
			</fieldset>
		</form>
	</div>
```

* Then we load the `aui-char-counter` module, and create an instance with the `new` operator. Using element id's, we place the `counter` in the location we just created and set the `input` to be the `<textarea>` in form 2. Lastly, we set the `maxLength` to the desired amount of `160`.

```html
<script>
	YUI().use(
		'aui-char-counter',
		'aui-datepicker',
		'aui-form-validator',
		'aui-pagination',
		'aui-progressbar',
		function(Y) {
			// Code for previous sections goes here

			new Y.CharCounter(
				{
					counter: '#counter',
					input: '#charInput',
					maxLength: 160
				}
			);
		}
	);
</script>
```

---

**Image Cropper**

* The final element of our form is an `aui-image-cropper` component to upload a headshot of the participant. In form 2, we add a `<div>` where our image cropper will be added with an `<img>` inside to crop, and a prompt to make it clear what the participant is supposed to do.

```html
	<!-- Page 2 -->
	<div class="hide page">
		<form class="form" id="form2" onSubmit="event.preventDefault();">
			<fieldset>
				<label class="control-label" for="charInput">Write a description about yourself <em>(Must be less than 160 characters)</em>:</label>
				<textarea name="charInput" id="charInput"></textarea>
				<br />
				<span id="counter"></span> characters remaining.
			</fieldset>

			<fieldset>
				<p>
					Crop your headshot.
				</p>

				<div id="imageCropper">
					<img id="image" src="http://alloyui.com/image-cropper/img/crop-image.jpg" />
				</div>
			</fieldset>
		</form>
	</div>
```

* Inside of our `<script>`, we load the `aui-image-cropper` module. We create an instance of the module with the `new` operator and only have to specify the `srcNode`, which is the `<div>` we just made.

```html
<script>
	YUI().use(
		'aui-char-counter',
		'aui-datepicker',
		'aui-form-validator',
		'aui-image-cropper',
		'aui-pagination',
		'aui-progressbar',
		function(Y) {
			// Code for previous sections goes here

			var imgCropper = new Y.ImageCropper(
				{
					srcNode: '#image'
				}
			);
		}
	);
</script>
```

* Notice that we saved the image cropper as a variable named `imgCropper`. This is because as a last step, we have specify when to render this component. In this particular case, we will add it to our pagination object; when the user tries to progress past page 2, then the image cropper should have been set and should be rendered. Recall that pagination used an event handler called `changeRequest` which would set the contents of the webpage to be the correct `page` when the pagination controls were used. We will add an attribute called `after` to the pagination instance and use that same `changeRequest` event handler. If there was a `changeRequest` that made page 2 viewable, and the `imgCropper` was not rendered already, then we will render the `imgCropper`. Afterwards, we set a variable to signify that the `imgCropper` has been rendered, so it won't have to be rendered again.

```javascript
after: {
	changeRequest: function(event) {
		if (event.state.page === 2 && !imgCropper.rendered) {
			imgCropper.render();

			imgCropper.rendered = true;
		}
	}
}
```

* With the above added attribute, our code for pagination from earlier should now be as follows.

```html
<script>
	YUI().use(
		'aui-char-counter',
		'aui-datepicker',
		'aui-form-validator',
		'aui-image-cropper',
		'aui-pagination',
		'aui-progressbar',
		function(Y) {
			// Code for progressbar goes here

			// Grab pages

			var pages = Y.all('.page');

			// Create paginator

			new Y.Pagination(
				{
					after: {
						changeRequest: function(event) {
							if (event.state.page === 2 && !imgCropper.rendered) {
								imgCropper.render();

								imgCropper.rendered = true;
							}
						}
					},
					boundingBox: '#pagination',
					circular: false,
					contentBox: '#pagination .pagination-content',
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

			// Code for previous sections goes here
		}
	);
</script>
```

---

**Button**

* Once the user completes the form, we want to have a way to submit the form or reset it completely. So we add two `<button>` elements to page 2.

```html
	<!-- Page 2 -->
	<div class="hide page">
		<form class="form" id="form2" onSubmit="event.preventDefault();">
			<fieldset>
				<label class="control-label" for="charInput">Write a description about yourself <em>(Must be less than 160 characters)</em>:</label>
				<textarea name="charInput" id="charInput"></textarea>
				<br />
				<span id="counter"></span> characters remaining.
			</fieldset>

			<fieldset>
				<p>
					Crop your headshot.
				</p>

				<div id="imageCropper">
					<img id="image" src="http://alloyui.com/image-cropper/img/crop-image.jpg" />
				</div>
			</fieldset>

			<fieldset>
				<button class="btn" id="submitBtn">Submit</button>
				<button class="btn" id="resetBtn">Reset</button>
			</fieldset>
		</form>
	</div>
```

* We want to use `aui-button` to specify the exact properties of these buttons, so we load that module. For the submit button, we add an event handler that will call our `updateProgress()` function from the progressbar section if it is clicked. For the reset button, we add an event handler that will reload the form if it is clicked. For both, we specify the correct `srcNode` in the `<body>` that should correspond to each event.

```html
<script>
	YUI().use(
		'aui-button',
		'aui-char-counter',
		'aui-datepicker',
		'aui-form-validator',
		'aui-image-cropper',
		'aui-pagination',
		'aui-progressbar',
		function(Y) {
			// Code for previous sections goes here

			// Submit Button

			new Y.Button(
				{
					on: {
						click: function() {
							updateProgress();
						}
					},
					srcNode: '#submitBtn'
				}
			).render();

			// Reset button

			new Y.Button(
				{
					on: {
						click: function() {
							location.reload();
						}
					},
					srcNode: '#resetBtn'
				}
			).render();
		}
	);
</script>
```

---

**Generated Output**

* As a final touch, we want to provide an additional message when the submit button is clicked to either say that it was a complete submission or to ask the user to fill out the form completely. We add a container for this message to form 2, with space for a title of `Output` and for the correct `message` to display. Since we don't want it to be visible until after the form is submitted, we set the `class` to `hide`.

```html
	<!-- Page 2 -->
	<div class="hide page">
		<form class="form" id="form2" onSubmit="event.preventDefault();">
			<fieldset>
				<label class="control-label" for="charInput">Write a description about yourself <em>(Must be less than 160 characters)</em>:</label>
				<textarea name="charInput" id="charInput"></textarea>
				<br />
				<span id="counter"></span> characters remaining.
			</fieldset>

			<fieldset>
				<p>
					Crop your headshot.
				</p>

				<div id="imageCropper">
					<img id="image" src="http://alloyui.com/image-cropper/img/crop-image.jpg" />
				</div>
			</fieldset>

			<fieldset>
				<button class="btn" id="submitBtn">Submit</button>
				<button class="btn" id="resetBtn">Reset</button>
			</fieldset>

			<fieldset class="hide" id="output">
				<legend class="fieldset-legend">
					<span class="legend">
						Output
					</span>
				</legend>

				<div id="message"></div>
			</fieldset>
		</form>
	</div>
```

* We add a new function to figure out the correct message to display.

```html
<script>
	YUI().use(
		'aui-button',
		'aui-char-counter',
		'aui-datepicker',
		'aui-form-validator',
		'aui-image-cropper',
		'aui-pagination',
		'aui-progressbar',
		function(Y) {
			// Code for previous sections goes here

			// Grab output element

			var output = Y.one('#output');

			// Create generated output

			var generateOutput = function(valid) {
				var messageNode = Y.one('#message');
				var outputNode = Y.one('#output');

				var cssClass = valid ? "text-success" : "text-error";
				var messageString = valid ? "All forms are complete!" : "Please fill out the entire form!";

				var message = Y.Node.create("<div class='" + cssClass + "'>" + messageString + "</div>");

				messageNode.setHTML(message);

				outputNode.show();
			};
		}
	);
</script>
```

* The behavior we want should occur when the submit button is clicked. So, inside the `click` event handler for that button, we figure out the number of valid forms and then call the `generateOutput` function we just wrote. The code for the submit button now looks as follows.

```html
<script>
	YUI().use(
		'aui-button',
		'aui-char-counter',
		'aui-datepicker',
		'aui-form-validator',
		'aui-image-cropper',
		'aui-pagination',
		'aui-progressbar',
		function(Y) {
			// Code for previous sections goes here

			// Submit Button

			new Y.Button(
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
					srcNode: '#submitBtn'
				}
			).render();

			// Code for reset button and generateOutput goes here
		}
	);
</script>
```

* Now our registration form is complete. Test it out and see all of these AlloyUI components working together.

**Completed example: [06-registration-form.html](https://github.com/eduardolundgren/alloy-ui-exercises/blob/master/02-components/06-registration-form.html)**