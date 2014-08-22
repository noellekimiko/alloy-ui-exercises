Liferay
==================

Exercises using AlloyUI components inside of Liferay Portal. The content of many of these examples is similar to excercises from the previous sections, but the format is slightly different. Instead of using regular `HTML` files, we will use `jsp` files that are used to create a custom Liferay portlet.

## Table of contents

* [Setup](#setup)

1. [Node](#1-node)
2. [Button](#2-button)
3. [Char Counter](#3-char-counter)
4. [Scheduler](#4-scheduler)
5. [Form Validator](#5-form-validator)
6. [Registration Form](#6-registration-form)
7. [Taglib](#7-taglib)
8. [Validator Taglib](#8-validator-taglib)
9. [AUI Script Taglib](#9-aui-script-taglib)
10. [AUI Script Use Taglib](#10-aui-script-use-taglib)
11. [AUI Script Position Taglib](#11-aui-script-position-taglib)
12. [Liferay.provide()](#12-liferayprovide)

## Setup

* Make a new portlet with the `create` script. Follow the directions [here](https://www.liferay.com/documentation/liferay-portal/6.2/development/-/ai/creating-a-portlet-project-liferay-portal-6-2-dev-guide-03-en).

* Navigate to the `portlet-title/docroot` file and find the file `view.jsp`. This is the file that you will modify.

* Include the `aui` taglib at the start of the file. Keep the automatically included taglib for the `portlet` prefix.

```javascript
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
```

* Afterwards, write content that you would have placed in the `<body>` section.

   * Exercises 1 to 6 will use regular HTML tags
   * Exercises 7 to 12 will use the `aui` taglib

* Initialize AlloyUI and load a module.

```javascript
<aui:script use="aui-node">
	// Code goes here
</aui:script>
```

> **Note:** This is the same as the following code that we used in our HTML documents

>```html
<script>
	YUI().use('aui-node', function(Y) {
		// Code goes here
	});
</script>
```

* Inside of the `<aui:script>` tags, the code you write will be basically the same. The one change is that you need to use `A` as your variable instead of `Y`.

* When you are finished with the portlet, make sure that your `build.COMPUTER-NAME.properties` file points to the correct bundle. Then navigate to your portlet's directory and run `ant clean deploy`. You should be able to add it to your page and use it.

## 1. Node

* In this exercise, we want to accomplish the same task as in [node in 01-basics](https://github.com/eduardolundgren/alloy-ui-exercises/tree/master/01-basics#7-node).
   * We started with one `<div>` with the id `foo`.
   * Then we used the `node` module to create a new `<div>` object.
   * We set this new node to have a `black` background and `white` text.
   * The inner text of this new element was `I am a bar element`.
   * Lastly, we `render` the button.

* Try to write the correct code for your `view.jsp` file using the description above or by adapting the code from [07-node.html](https://github.com/eduardolundgren/alloy-ui-exercises/blob/master/01-basics/07-node.html) to this new format.

> **Hints**

> * Use `aui-node` instead of `node`

> * Set the `id` of your original `<div>` to be unique to the portlet, such as `portlet01_foo` instead instead of just `foo`. This will prevent problems with duplicate IDs later.

**Completed jsp: [01-node.jsp](https://github.com/eduardolundgren/alloy-ui-exercises/blob/documentation/03-liferay/01-node.jsp)**

**Completed portlet: [01-node-portlet](https://github.com/noellekimiko/liferay-plugins/tree/6.2.x-alloyUI-practice/portlets/01-node-portlet)**

## 2. Button

* This exercise is similar to [button in 02-components](https://github.com/eduardolundgren/alloy-ui-exercises/tree/master/02-components#1-button) but using the new `jsp` format.
   * We create a `<div>` on the page which we will use to position our button
   * Then we create a `new` instance of `aui-button` which will have the `id` of that `<div>` as the `srcNode`
   * When the button is clicked, we want an alert box to show up with the message `You have clicked the button`.
   * Lastly, we render the button.

* Try to write the correct code using the description above or by adapting the code from [01-button.html](https://github.com/eduardolundgren/alloy-ui-exercises/blob/documentation/02-components/01-button.html) to this new format. Like in the last exercise, prevent duplicate IDs by setting the `id` of your original `<div>` to be unique to the portlet, such as `portlet02_foo` instead of just `foo`.

**Completed jsp: [02-button.jsp](https://github.com/eduardolundgren/alloy-ui-exercises/blob/documentation/03-liferay/02-button.jsp)**

**Completed portlet: [02-button-portlet](https://github.com/noellekimiko/liferay-plugins/tree/6.2.x-alloyUI-practice/portlets/02-button-portlet)**

## 3. Char Counter

* In this exercise, we want to make an `<input>` field with a limited number of characters and display a counter with the number of characters remaining. You can follow the directions for [char counter in 02-components](https://github.com/eduardolundgren/alloy-ui-exercises/tree/master/02-components#2-char-counter) but with the necessary changes for the `jsp` format.

* Use the description from `02-components` or try adapting the completed code in [02-char-counter.html](https://github.com/eduardolundgren/alloy-ui-exercises/blob/master/02-components/02-char-counter.html) into a portlet. Remember to use unique IDs for the `counter` and the `input` attributes.

**Completed jsp: [03-char-counter.jsp](https://github.com/eduardolundgren/alloy-ui-exercises/blob/documentation/03-liferay/03-char-counter.jsp)**

**Completed portlet: [03-char-counter-portlet](https://github.com/noellekimiko/liferay-plugins/tree/6.2.x-alloyUI-practice/portlets/03-char-counter-portlet)**

## 4. Scheduler

* For this exercise, we want to make a portlet that utilizes the `aui-scheduler` module. There are step by step directions for the html version of [scheduler in 02-components](https://github.com/eduardolundgren/alloy-ui-exercises/tree/master/02-components#3-scheduler) that just need the changes described in the `Setup` section.

* Use the linked directions above or adapt the completed file [03-scheduler.html](https://github.com/eduardolundgren/alloy-ui-exercises/blob/master/02-components/03-scheduler.html) into a portlet.

**Completed jsp: [04-scheduler.jsp](https://github.com/eduardolundgren/alloy-ui-exercises/blob/documentation/03-liferay/04-scheduler.jsp)**

**Completed portlet: [04-scheduler-portlet](https://github.com/noellekimiko/liferay-plugins/tree/6.2.x-alloyUI-practice/portlets/04-scheduler-portlet)**

## 5. Form Validator

* For this exercise, we want to validate the data input into a form, much like the [form validator in 02-components](https://github.com/eduardolundgren/alloy-ui-exercises/tree/master/02-components#5-form-validator).

* Use the directions above or start with the completed file for [05-form-validator.html](https://github.com/eduardolundgren/alloy-ui-exercises/blob/master/02-components/05-form-validator.html) and try to format the code for a portlet. Use unique `id` and `name` attributes for each field such as `portlet05_email` instead of just `email`.

**Completed jsp: [05-form-validator.jsp](https://github.com/eduardolundgren/alloy-ui-exercises/blob/documentation/03-liferay/05-form-validator.jsp)**

**Completed portlet: [05-form-validator-portlet](https://github.com/noellekimiko/liferay-plugins/tree/6.2.x-alloyUI-practice/portlets/05-form-validator-portlet)**

## 6. Registration Form

* We want to develop a registration form much like the [registration form in 02-components](https://github.com/eduardolundgren/alloy-ui-exercises/tree/master/02-components#6-registration-form), but this time as a portlet.

* Follow the directions above or adapt [06-registration-form.html](https://github.com/eduardolundgren/alloy-ui-exercises/blob/master/02-components/06-registration-form.html) to be used in a porlet.

**Completed jsp: [06-registration-form.jsp](https://github.com/eduardolundgren/alloy-ui-exercises/blob/documentation/03-liferay/06-registration-form.jsp)**

**Completed portlet: [06-registration-form-portlet](https://github.com/noellekimiko/liferay-plugins/tree/6.2.x-alloyUI-practice/portlets/06-registration-form-portlet)**

## 7. Taglib

* We will now explore some more options included in the `aui` taglib. In the first 6 exercises, we only used `<aui:script>` from the taglib and then used regular HTML tags. However, the `aui` taglib has many more tags we can use.

* Let's make a form for this first exercise. To start, we use the `<aui:form>` tag and specify some attributes.
   * `action` is the same as the `action` attribute as in the html form tag, except the url is automatically escaped. We don't need to submit the information anywhere for this exercise so we leave it blank, but this is where it would go for future reference.
   * `method` is from the html form tag. Read about the method attribute [here](http://www.w3schools.com/tags/att_form_method.asp).
   * `name` is used for the name of the form, and also the `id` if no other one is specified. For both the `name` and `id` attributes, the taglib will prepend portlet-specific content so that they will be unique.

```html
<aui:form action="" method="post" name="fm">
	<!-- Content of the form goes here -->
</aui:form>
```

* Next we add two `<aui:input>` fields for `name` and `email`.
   * Like for the `<aui:form>`, the `name` attribute is used for the name of this field and also for the `id` since there is no other one provided. The taglib makes sure both attributes are unique.
   * The name is also used for a `<label>` for the field.

```html
<aui:form action="" method="post" name="fm">
	<aui:input name="name" />

	<aui:input name="email" />
</aui:form>
```

* Next, we want to create a dropdown list of `<aui:option>` items using `<aui:select>`. We also wrap the whole selector inside of a `<aui:fieldset>`.
   * For `<aui:select>`, `name` works in the same way as for `<aui:form>` and `<aui:input>`. Since there is a `label` attribute specified, this value will be used instead of the `name`.  It is formatted automatically.
   * For `<aui:option>`, the `label` is used as the label to show in the dropdown list, and also as the `value` that is associated with the option since no other one is specified.

```html
<aui:form action="" method="post" name="fm">
	<aui:input name="name" />

	<aui:input name="email" />

	<aui:fieldset>
		<aui:select label="maximum-activities-to-display" name="preferences--max--">
			<aui:option label="1" />
			<aui:option label="2" />
			<aui:option label="3" />
			<aui:option label="4" />
			<aui:option label="5" />
			<aui:option label="10" />
			<aui:option label="15" />
			<aui:option label="20" />
		</aui:select>
	</aui:fieldset>
</aui:form>
```

* To finish, we add a `<aui:button-row>` with two `<aui:button>` elements for submitting and resetting the data.
   * The default `type` is `button`, which is fine for the reset button, but for our submit button we change it accordingly. Other possible values are `cancel` or `image`.
   * `value` is the text that the button will display. If it is left empty, it will be save for submit type buttons and cancel for cancel type buttons.

```html
<aui:form action="" method="post" name="fm">
	<aui:input name="name" />

	<aui:input name="email" />

	<aui:fieldset>
		<aui:select label="maximum-activities-to-display" name="preferences--max--">
			<aui:option label="1" />
			<aui:option label="2" />
			<aui:option label="3" />
			<aui:option label="4" />
			<aui:option label="5" />
			<aui:option label="10" />
			<aui:option label="15" />
			<aui:option label="20" />
		</aui:select>
	</aui:fieldset>

	<aui:button-row>
		<aui:button type="submit" />
		<aui:button value="reset" />
	</aui:button-row>
</aui:form>
```

* Deploy this portlet and add it to your portal instance to see it running. Use your browser inspector to see how the taglib code was transformed into regular html.

* Read about the `aui` taglib and the advantages of using its components [here](http://www.liferay.com/web/guest/community/wiki/-/wiki/Main/Alloy+UI+Forms+(aui)).

**Completed jsp: [07-taglib.jsp](https://github.com/eduardolundgren/alloy-ui-exercises/blob/documentation/03-liferay/07-taglib.jsp)**

**Completed portlet: [07-taglib-portlet](https://github.com/noellekimiko/liferay-plugins/tree/6.2.x-alloyUI-practice/portlets/07-taglib-portlet)**

## 8. Validator Taglib

* In this exercise, we will be using a new tag from the `aui` taglib: the `<aui:validator>` tag.

* Let's start with `<aui:input>` elements for Name, Email, and Birthday.
   * For the Name, set up the field like the `<aui:input>` elements in the last exercise. Just specify a value for the `name` attribute, which will also be used for the `id` and the `<label>`.
   * For the Email, we will specify a `name` attribute, but also use the `<aui:validator>`. First, we specify what type of data is expected by setting `name` to `email`. Then, we make the field `required` in the second validator element.
   * Similarly for the Birthday, we use the `<aui:validator>` twice to set the acceptable data to be a `date`, and then make the field `required`.

```html
<aui:form action="" method="post" name="fm">
	<aui:input name="name" />

	<aui:input name="email">
		<aui:validator name="email" />
		<aui:validator name="required" />
	</aui:input>

	<aui:input name="birthday" type ="text">
		<aui:validator name="date" />
		<aui:validator name="required" />
	</aui:input>
</aui:form>
```

* Now we will add two fields to set a password, confirm it and make sure that the two versions matched.
   * For the first field, we set a `name` (and and `id` by default so we can find the element), and a `label`, as in the last example.
   * For the second, we also set a `name` and `label`. We use the `<aui:validator>` in this field with the `equalTo` option to check if the values match.

```html
<aui:form action="" method="post" name="fm">
	<aui:input name="name" />

	<aui:input name="email">
		<aui:validator name="email" />
		<aui:validator name="required" />
	</aui:input>

	<aui:input name="birthday" type ="text">
		<aui:validator name="date" />
		<aui:validator name="required" />
	</aui:input>

	<aui:input label="password" name="password1" />

	<aui:input label="enter-again" name="password2">
		<aui:validator name="equalTo">
			'#<portlet:namespace />password1'
		</aui:validator>
	</aui:input>
</aui:form>
```

* We add buttons to the form to submit or reset the form. These buttons are almost the same as the ones we added in the last exercise, but for the submit button there is an extra `onClick` attribute. This means that an additional function will be called once the user tries to submit the form.

```html
<aui:form action="" method="post" name="fm">
	<aui:input name="name" />

	<aui:input name="email">
		<aui:validator name="email" />
		<aui:validator name="required" />
	</aui:input>

	<aui:input name="birthday" type ="text">
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
		<aui:button onClick='<%= "portlet08_getContent();" %>' type="submit" />
		<aui:button value="reset" />
	</aui:button-row>
</aui:form>
```

* We finish by defining the function we used for the submit button.

```html
<aui:script>
	function portlet08_getContent() {
		return window.<portlet:namespace />editor.getHTML();
	}
</aui:script>
```

* Deploy the portlet and try out the form. Put incorrect and correct types of data in, or try leaving out required information to see how the portlet responds.

**Completed jsp: [08-validator-taglib.jsp](https://github.com/eduardolundgren/alloy-ui-exercises/blob/documentation/03-liferay/08-validator-taglib.jsp)**

**Completed portlet: [08-validator-taglib-portlet](https://github.com/noellekimiko/liferay-plugins/tree/6.2.x-alloyUI-practice/portlets/08-validator-taglib-portlet)**

## 9. AUI Script Taglib

* In this example, we will show how the `<portlet:namespace />` tag can be used to help find `aui` taglib elements.

* We start by making a form with one input field. We set the `name` attribute to the value `name`.

```html
<aui:form action="" method="post" name="fm">
	<aui:input name="name" />
</aui:form>
```

* We have discussed previously how the `name` value is also used for the `<label>` and the `id` attributes since they are not specified. However we also mentioned that `name` and `id` are prepended with some value to make them unique to the portlet. This is good for preventing duplicate IDs, but what if we want to reference an item in the portlet? How do we know what the `id` is exactly?

* As it turns out, the value they are prepended with is accesible with the `<portlet:namespace />` tag. We used this last exercise to check if the `password` values matched.

* Let's prove that we are finding the correct `id`. We will get the `<aui:input>` element we just added by using it's `id`, which should be `name` prepended with `<portlet:namespace />`. Then, we'll log it to the console.

```html
<aui:script>
	console.log(document.getElementById('<portlet:namespace />name'));
</aui:script>
```

* Deploy the portlet and add it to your portal instance. Open the console in your browser. You should see an `<input>` node logged to the console.

**Completed jsp: [09-aui-script-taglib.jsp](https://github.com/eduardolundgren/alloy-ui-exercises/blob/documentation/03-liferay/09-aui-script-taglib.jsp)**

**Completed portlet: [09-aui-script-taglib-portlet](https://github.com/noellekimiko/liferay-plugins/tree/6.2.x-alloyUI-practice/portlets/09-aui-script-taglib-portlet)**

## 10. AUI Script Use Taglib

* In this exercise, we will see how `document.getElementById()` and `A.one()` differ in their return types. Both are used to find unique elements on the page, but they are not equivalent.

* Start with the same form from the last exercise.

```html
<aui:form action="" method="post" name="fm">
	<aui:input name="name" />
</aui:form>
```

* We want to get our `<aui:input>` element again and log it to the console, but this time we use `A.one()` to find it by its `id`.

```html
<aui:script use="aui-node">
	console.log(A.one('#<portlet:namespace />name'));
</aui:script>
```

* Deploy the portlet and add it to your portal instance. Open your browser console. You should see a Node object logged to the console. It contains the `<input>` node, but also has other information. You can use `A.one()` in place of `document.getElementById()` and it should function the same in your AlloyUI code, but it is important to know the difference.

> **Note:** `A.one()` and `A.all()` are actually even more versatile than `document.getElementById()` or `document.getElementsByClassName()`; in versions of Internet Explorer earlier than version 8, the `document` methods are not supported, but the AlloyUI methods will work.

> Read more about `A.one()` and `A.all()` and their return types [here](https://www.liferay.com/web/nathan.cavanaugh/blog/-/blogs/alloyui-working-with-elements-and-events)

**Completed jsp: [10-aui-script-use-taglib.jsp](https://github.com/eduardolundgren/alloy-ui-exercises/blob/documentation/03-liferay/10-aui-script-use-taglib.jsp)**

**Completed portlet: [10-aui-script-use-taglib-portlet](https://github.com/noellekimiko/liferay-plugins/tree/6.2.x-alloyUI-practice/portlets/10-aui-script-use-taglib-portlet)**

## 11. AUI Script Position Taglib

* In this exercise, we will see how the layout of our `jsp` file is important, particularly how the `<aui:script>` element is placed.

* We will start with the same form as the past two exercises.

```html
<aui:form action="" method="post" name="fm">
	<aui:input name="name" />
</aui:form>
```

* Normally we would write our `<aui:script>` section after this content of the portlet, but this time we will write it above. We start with the `<aui:script>` section as in the last exercise. Then, we add an attribute `position` to it with the value `inline`.

```html
<aui:script position="inline" use="aui-node">
	console.log(A.one('#<portlet:namespace />name'));
</aui:script>
```

* Lastly, so it is more obvious when this code is actually running, we will add in a `confirm` box. Only when the user clicks `OK` in this box will the `name` Node object be logged to the console.

```html
<aui:script position="inline" use="aui-node">
	var continueLoading = confirm('Would you like to continue loading the page?');

	if (continueLoading) {
		console.log(A.one('#<portlet:namespace />name'));
	}
</aui:script>
```

* Deploy the portlet and add it to your portal instance. Open your browser console. You should see a Node object logged to the console when you click the `OK` button.

**Completed jsp: [11-aui-script-position-taglib.jsp](https://github.com/eduardolundgren/alloy-ui-exercises/blob/documentation/03-liferay/11-aui-script-position-taglib.jsp)**

**Completed portlet: [11-aui-script-position-taglib-portlet](https://github.com/noellekimiko/liferay-plugins/tree/6.2.x-alloyUI-practice/portlets/11-aui-script-position-taglib-portlet)**

## 12. Liferay.provide()

* In this exercise, we will use `Liferay.provide()` to create a method that returns a message with the information entered into an `<aui:form>`.

* We start with the same basic form from [exercise 8](#8-validator-taglib), where we used the validator taglib. However, we remove the `onClick` attribute from the submit button; we are going to use the `onSubmit` attribute of the `<aui:form>` instead.

```html
<aui:form action="" method="post" name="fm">
	<aui:input name="name" />

	<aui:input name="email">
		<aui:validator name="email" />
		<aui:validator name="required" />
	</aui:input>

	<aui:input name="birthday" type ="text">
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
</aui:form>
```

* Next we add in the `onSubmit` attribute. There are two things that we want to happen when the user submits the form: preventing the default action (which is refreshing the page) and calling the custom method we will write with `Liferay.provide()`. These will be two separate method calls, so our attribute will be:

```html
onSubmit='<%= "event.preventDefault(); portlet12_generateOutput();" %>'
```

* We want to display the return value from our method, so we include a section for that `message`. It is initially set to have the class `hide` so that we don't see it until after the data has been entered.

```html
<aui:fieldset cssClass="hide" id="output">
	<div id="portlet12_message"></div>
</aui:fieldset>
```

* So at this point our `<aui:form>` looks like this:

```html
<aui:form action="" method="post" name="fm" onSubmit='<%= "event.preventDefault(); portlet12_generateOutput();" %>'>
	<aui:input name="name" />

	<aui:input name="email">
		<aui:validator name="email" />
		<aui:validator name="required" />
	</aui:input>

	<aui:input name="birthday" type ="text">
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
```

* Now we will use `Liferay.provide()` to create our method `portlet12_generateOutput`. This method has 4 arguemtns: `obj`, `methodName`, `methodFn`, and `modules`.
   * `obj` is the object where the method will be created. We want this function to be global, so we use the `window` object.
   * `methodName` is the name of the method we are creating. We use the name that is set in the `onSubmit` attribute of the `<aui:form>`.
   * `methodFn` is the function definition. We will write this in the next step.
   * `modules` is an array of JavaScript modules that will be loaded before the function is executed. For this method, we only need `aui-node` for basic DOM manipulation.

```html
<aui:script>
	Liferay.provide(
		window,
		'portlet12_generateOutput',
		function() {
			// Create a message with the entered data
		},
		['aui-node']
	);
</aui:script>
```

* Inside the function section, we first have to make a variable `A` for `AUI()`. Then we can call methods on `A` as we would in any other code using AlloyUI.

```html
<aui:script>
	Liferay.provide(
		window,
		'portlet12_generateOutput',
		function() {
			var A = AUI();
		},
		['aui-node']
	);
</aui:script>
```

* Then we will get the information that was entered into the form and save each as a variable. We also get the nodes for the `<div>` we will use for the message and the whole output container that is currently hidden.

```html
<aui:script>
	Liferay.provide(
		window,
		'portlet12_generateOutput',
		function() {
			var A = AUI();

			var date = A.one('#<portlet:namespace />birthday');
			var email = A.one('#<portlet:namespace />email');
			var name = A.one('#<portlet:namespace />name');

			var messageNode = A.one('#portlet12_message');
			var outputNode = A.one('#<portlet:namespace />output');
		},
		['aui-node']
	);
</aui:script>
```

* We construct the message we want to show with the `name`, `email` and `date` information. Then, we set the `messageNode` to have this message as its inner text. Finally, we show the whole `outputNode` so that the message is displayed on the page.

```html
<aui:script>
	Liferay.provide(
		window,
		'portlet12_generateOutput',
		function() {
			var A = AUI();

			var date = A.one('#<portlet:namespace />birthday');
			var email = A.one('#<portlet:namespace />email');
			var name = A.one('#<portlet:namespace />name');

			var messageNode = A.one('#portlet12_message');
			var outputNode = A.one('#<portlet:namespace />output');

			var messageString = 'My name is ' + name.val() + ' and my email address is ' + email.val() + '. My birthday is ' + date.val() + '.';

			messageNode.setHTML(messageString);

			outputNode.show();
		},
		['aui-node']
	);
</aui:script>
```

* Deploy this portlet and try submitting some data. If it is all correct, you should see a message displayed at the bottom of the portlet with the information you entered.

**Completed jsp: [12-liferay-provide.jsp](https://github.com/eduardolundgren/alloy-ui-exercises/blob/documentation/03-liferay/12-liferay-provide.jsp)**

**Completed portlet: [12-liferay-provide-portlet](https://github.com/noellekimiko/liferay-plugins/tree/6.2.x-alloyUI-practice/portlets/12-liferay-provide-portlet)**

> **Note:** Read the bottom of the completed example for helpful notes about  `Liferay.provide()`: how it helps improve performance and consistency, some limitations, and about its arguments.
