Basics
==================

Basic examples using mostly YUI components. AUI is built on YUI, so it is useful to be familiar with both.

## Table of contents

1. [Setup](#setup)
2. [DOM Traversal](#dom-traversal)
3. [DOM Manipulation](#dom-manipulation)
4. [Events](#events)
5. [Effects](#effects)
6. [Ajax](#ajax)
7. [Node](#node)
8. [Show/Hide](#show-hide)

## Setup

* First, we set up a basic HTML page to use, giving it a title and a header for this exercise.

```html
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>AlloyUI - Setup</title>
	</head>
	<body>
		<h1>AlloyUI - Setup</h1>
	</body>
</html>
```

* Then, inside the `<head>` tags we load the AlloyUI seed and Bootstrap css file. The seed file contains the JavaScript that defines the AlloyUI modules and the css file provides basic styling for the page.

```html
<script src="http://cdn.alloyui.com/2.0.0pr7/aui/aui-min.js"></script>
<link href="http://cdn.alloyui.com/2.0.0pr7/aui-css/css/bootstrap.min.css" rel="stylesheet"></link>
```

* Now we initialize AlloyUI inside the `<script>` tags and are ready to start using AlloyUI modules.

```html
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>AlloyUI - Setup</title>

		<script src="http://cdn.alloyui.com/2.0.0pr7/aui/aui-min.js"></script>
		<link href="http://cdn.alloyui.com/2.0.0pr7/aui-css/css/bootstrap.min.css" rel="stylesheet"></link>
	</head>
	<body>
		<h1>AlloyUI - Setup</h1>

		<script>
		YUI().use(function(Y) {
			// Code goes here
		});
		</script>
	</body>
</html>
```

* Open this file in any web browser to see the results. There is only a heading for now, but in the following exercises there will be additional content. You should follow these steps to set up your files for each of the exercises.

**Completed example: [01-setup.html](https://github.com/eduardolundgren/alloy-ui-exercises/blob/master/01-basics/01-setup.html)**

## DOM Traversal

* We start by getting our page setup like in part 1. Give the page the correct header and title for this exercise, load the AlloyUI seed and Bootstrap files and initialize AlloyUI.

```html
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>AlloyUI - DOM Traversal</title>

		<script src="http://cdn.alloyui.com/2.0.0pr7/aui/aui-min.js"></script>
		<link href="http://cdn.alloyui.com/2.0.0pr7/aui-css/css/bootstrap.min.css" rel="stylesheet"></link>
	</head>
	<body>
		<h1>AlloyUI - DOM Traversal</h1>

		<script>
		YUI().use(function(Y) {
			// Code goes here
		});
		</script>
	</body>
</html>
```

* In this example, we are going to use YUI's `node` module to find elements on the webpage. So we first create some content in the `<body>` that can be searched, like this list of fruits.

```html
<ul>
	<li>Apricot</li>
	<li>Pineapple</li>
	<li>Kiwi</li>
	<li>Orange</li>
	<li>Pomegranate</li>
	<li>Lime</li>
	<li>Watermelon</li>
	<li>Apricot</li>
	<li>Pineapple</li>
</ul>
```

* In our code at the moment, we initialize AlloyUI in the `<script>` tags, but don't use any components. To do so, we load the module we want which is `node` in this case.

```html
<script>
	YUI().use('node', function(Y) {
		// Code goes here
	});
</script>
```

* The `node` module supplies a set of methods that assist in DOM manipulation.  We use it here to find the list of fruits and the individual fruit items and then log both to the console. Make sure to open up the console in your browser's inspector to see the results.

```html
<script>
	YUI().use('node', function(Y) {
		// Grab the elements
		var ul = Y.one('ul'),
			lis = Y.all('li');

		console.log('Select a single element:', ul);
		console.log('Select multiple elements:', lis);
	});
</script>
```

* As suggested by their names, the method `.one()` will return a single instance of the specified element while `.all()` will return all of the instances. Typically, `.one()` is used with an id so there is only one such element, but if there are multiple possibilities it will return the first one. You can read more about working with the methods `.one()` and `.all()` and their return types [here](http://www.liferay.com/web/nathan.cavanaugh/blog/-/blogs/alloyui-working-with-elements-and-events).

* Note that in this exercise, we did not actually use any methods from the node module. YUI's base code defines `.one()` and `.all()`. It is used here to familiarize you with where modules are loaded, and we will use methods from `node` in the next exercise.

**Completed example: [02-dom-traversal.html](https://github.com/eduardolundgren/alloy-ui-exercises/blob/master/01-basics/02-dom-traversal.html)**

## DOM Manipulation

* Setup the file like the previous exercises, this time with the title and heading `AlloyUI - DOM manipulation`. See if you can remember all the necessary components on your own.

* In the previous exercise, we saw how the `node` module can be used to find elements in the DOM. Now, we will use it to modify the content and styles of elements in the DOM.

* First we make an element inside of the `<body>`.

```html
<div id="foo">I am a foo element</div>
```

* Then, after we have loaded the `node` module, we find that element by its id, `foo`.

```html
<script>
YUI().use('node', function(Y) {
	// Grab the element
	var foo = Y.one('#foo');
});
</script>
```

* We want to modify the text inside of the `foo` element, then change the color to white with a red background. This requires two methods: `.setHTML()` and `.setStyles()`. `.setHTML()` will change the inner HTML of the specified element to the argument provided. Its argument can include HTML tags. `.setStyles()` is a way to specify multiple CSS styles for the indicated element. Any CSS property is valid, with hyphenated names changed to use camelCase.

```html
<script>
YUI().use('node', function(Y) {
	// Grab the element
	var foo = Y.one('#foo');

	// Set HMTL
	foo.setHTML('I am a modified foo element');

	// Change styles
	foo.setStyles(
		{
			backgroundColor: 'red',
			color: 'white'
		}
	);
});
</script>
```

* Notice that changes inside the `<script>` tags are applied as soon as this code is loaded, so the original text and style of our `foo` element are basically not visible.

**Completed example: [03-dom-manipulation.html](https://github.com/eduardolundgren/alloy-ui-exercises/blob/master/01-basics/03-dom-manipulation.html)**

## Events

* Setup the file with title and heading `AlloyUI - Events`.

* In this exercise, we will use the same `node` module from exercises 2 and 3 along with a new one: `event`. The `event` module allows us to specify an event when we want certain parts of the code to take place, instead of occuring automatically when the page loads as in the previous exercises. The event we will use here is when an object is clicked.

* First, we create an object inside the `<body>` to be clicked.

```html
<div id="foo">Click me</div>
```

* Then we add some styling inside the `<head>` to make the `foo` element stand out.

```html
<style>
	#foo {
		width: 100px;
		height: 100px;
		background: red;
		color: white;
		cursor: pointer;
		text-align: center;
	}
</style>
```

* Now, we must load both the `node` and `event` modules and then find the `foo` element that we want to use for our event.

```html
<script>
YUI().use('node', 'event', function(Y) {
	// Grab the element
	var foo = Y.one('#foo');
});
</script>
```

* The `event` module's `.on()` method is what allows us to specify the condition when we want the code to execute. We want the webpage to respond when the `foo` element is clicked, so we add a `click` event handler.

```html
<script>
YUI().use('node', 'event', function(Y) {
	// Grab the element
	var foo = Y.one('#foo');

	// Add 'click' event handler
	foo.on('click', function(event) {
		// Do something when the foo element is clicked
	});
});
</script>
```

* Let's change the inner HTML of the `foo` element to show that it has been clicked. To do so, we use the `node` module's `.setHTML()` method again.

```html
<script>
YUI().use('node', 'event', function(Y) {
	// Grab the element
	var foo = Y.one('#foo');

	// Add 'click' event handler
	foo.on('click', function(event) {
		// Set HTML
		event.currentTarget.setHTML('Clicked');
	});
});
</script>
```

* Now, the text inside the `foo` element will change when it is clicked.

**Completed example: [04-events.html](https://github.com/eduardolundgren/alloy-ui-exercises/blob/master/01-basics/04-events.html)**

## Effects

* Building on the last exercise, let's change what happens when the `foo` element is clicked: instead of changing the inner HTML, let's make it shrink and disappear.

* Setup your file with the title and heading `AlloyUI - Effects`. We can use the same `foo` element inside the `<body>` as the previous exercise, and even the same styling.

```html
<div id="foo">Click me</div>
```

```html
<style>
	#foo {
		width: 100px;
		height: 100px;
		background: red;
		color: white;
		cursor: pointer;
		text-align: center;
	}
</style>
```

* Now, we will load the modules that we need and find the `foo` element to be clicked. This time, we only need YUI's `transition` module to get the affect we want.

```html
<script>
YUI().use('transition', function(Y) {
	// Grab the elements
	var foo = Y.one('#foo');
});
</script>
```

* The `transition` module has its own `.on()` method like the `event` module. We set up a `click` event handler so that we can change the `foo` element when it is clicked.

```html
<script>
YUI().use('transition', function(Y) {
	// Grab the elements
	var foo = Y.one('#foo');

	// Add 'click' event handler
	foo.on('click', function(event) {
		// Do something when the foo element is clicked
	});
});
</script>
```

* Next, we can specify what should happen when the `foo` element is clicked. The `height`, `width` and `opacity` attributes specify the properties of the object once the transition finishes. Since we want to make it shrink and disappear, we set `height` and `width` to 0. We set `opacity` to 0 to make the color also fade as the transition takes place. Finally, `duration` is the number of seconds the whole process takes, which we set to 1.

```html
<script>
YUI().use('transition', function(Y) {
	// Grab the elements
	var foo = Y.one('#foo');

	// Add 'click' event handler
	foo.on('click', function(event) {
		// Add transition
		event.currentTarget.transition(
			{
				duration: 1,
				height: 0,
				opacity: 0,
				width: 0
			}
		);
	});
});
</script>
```

* Now when we click the `foo` element, it will fade and shrink out of sight. Try out different values for the attributes. Could you make the `foo` element grow in size instead?

* To see more possible configurations for the transition module, checkout the YUI docs [here](https://yuilibrary.com/yui/docs/transition/).

**Completed example: [05-effects.html](https://github.com/eduardolundgren/alloy-ui-exercises/blob/master/01-basics/05-effects.html)**

## Ajax

* This exercise requires a bit more setup than the previous ones. We will be using the YUI `io` module which creates an AJAX request to get another file. Due to security features, we need to have the file for the exercise and the content it is loading hosted on a web server application. We will use xampp in this example. There is an in depth tutorial to set it up [here](https://www.udemy.com/blog/xampp-tutorial/), or you can follow the abbreviated directions below.

> **Setting Up XAMPP**

> * Go to this link to get XAMPP: https://www.apachefriends.org/index.html

> * Follow the directions in its installer and open it up to the control panel.

> * Start the Apache server. Then, navigate to http://localhost in a web browser to test that it is running correctly. You should see a screen that prompts you to select your language.

* We're ready to set up our usual html file. This file, however, will not be placed in the repository with the other files. Instead, it should be created to be run with XAMPP. In XAMPP, files are placed in C:/xampp/htdocs and then accessed with the url http://localhost/[FILE NAME].

* Navigate to your C:/xampp/htdocs directory. Let's make a folder for this exercise, called "alloy-ui-exercises". Then create the file for this exercise as always, with the title and heading `Alloy UI - Ajax`.

* We will also put the content that we want to load into this file. Copy [this file](https://github.com/eduardolundgren/alloy-ui-exercises/blob/master/assets/content.html) into the folder and save it as `content.html`.

* In this exercise, we want content to be loaded into our mainpage from `content.html`. Let's first put in a loading message and then replace this message with the content once it is loaded.

```html
<div id="foo">Loading...</div>
```

* Then we will load the `io` module and start to create our AJAX request.

```html
<script>
	YUI().use('io', function(Y) {
		// Send AUI AJAX request
		Y.io(
			// Details about the request
		);
	});
</script>
```

* The first detail that we will specify is where to get the content. When the XAMPP server is running, we will be able to access the `content.html` file at http://localhost/alloy-ui-exercises/content.html, so that is the url we will use.

```html
<script>
	YUI().use('io', function(Y) {
		// Send AUI AJAX request
		Y.io(
			'http://localhost/alloy-ui-exercises/content.html'
		);
	});
</script>
```

* Next we need to specify what should happen with the request. The `io` module has an attribute `on` to specify what should happen. We will use the `success` option because we want to change the text only if the file has successfully loaded.

```html
<script>
	YUI().use('io', function(Y) {
		// Send AUI AJAX request
		Y.io(
			'http://localhost/alloy-ui-exercises/content.html',
			{
				on: {
					success: function(id, xhr) {
						// Do something
					}
				}
			}
		);
	});
</script>
```

* We're now ready to replace our loading message in the `<body>`. We get the `foo` element on the page, and use `.setHTML()` to insert the information from `contents.html`. The text is from the `xhr` variable, which is the actual HTTP request.

```html
<script>
	YUI().use('io', function(Y) {
		// Send AUI AJAX request
		Y.io(
			'http://localhost/alloy-ui-exercises/content.html',
			{
				on: {
					success: function(id, xhr) {
						// Grab the elements
						var foo = Y.one('#foo');

						// Set HMTL
						foo.setHTML(xhr.responseText);
					}
				}
			}
		);
	});
</script>
```

* Finally, we are ready to run the example. Instead of just opening it with a browser like the other exercises, we need to access it via our XAMPP server. Go to http://localhost/alloy-ui-exercises/06-ajax.html in your browser (assuming your file for this exercise is titled 06-ajax.html), and you should see the header that was set in `06-ajax.html` but with the inner text from `contents.html`.

* Be sure to stop your XAMPP server when you are finished.

**Completed example: [06-ajax.html](https://github.com/eduardolundgren/alloy-ui-exercises/blob/master/01-basics/06-ajax.html)**
> Note: This example uses relative paths, and will not run correctly if you just open the file with a web browser

## Node

* In this exercise, we use the `node` module to create a new HTML object instead of just manipulating existing ones.

* Setup your file with the title and header `AlloyUI - Node`.

* Create a `foo` element in the `<body>`. We will add our new element after this one.

```html
<div id="foo">I am a foo element</div>
```

* Load the `node` module and get the `foo` element we just created.

```html
<script>
	YUI().use('aui-node', function(Y) {
		// Grab the element
		var foo = Y.one('#foo');
	});
</script>
```

* We'll create our new element using the `.create()` method from the `node` module.

```html
<script>
	YUI().use('aui-node', function(Y) {
		// Grab the elements
		var foo = Y.one('#foo');

		// Create HTML node
		var node = Y.Node.create('<div> </div>');
	});
</script>
```

* Then we'll style it bit and set the inner text using `.setStyle()` and `.setHTML()`. We have worked a lot with `.setHTML()` so far, and `.setStyle()` is very similar to `.setStyles()` except that it can only set one CSS property at a time.

```html
<script>
	YUI().use('aui-node', function(Y) {
		// Grab the elements
		var foo = Y.one('#foo');

		// Create HTML node
		var node = Y.Node.create('<div> </div>');

		// Set CSS styles
		node.setStyle('background', 'black');
		node.setStyle('color', 'white');

		// Set HTML
		node.setHTML('I am a bar element');
	});
</script>
```

* Lastly we will append this new node to our existing `foo` element so that it shows up on the page.

```html
<script>
	YUI().use('aui-node', function(Y) {
		// Grab the elements
		var foo = Y.one('#foo');

		// Create HTML node
		var node = Y.Node.create('<div> </div>');

		// Set CSS styles
		node.setStyle('background', 'black');
		node.setStyle('color', 'white');

		// Set HTML
		node.setHTML('I am a bar element');

		// Append node
		foo.append(node);
	});
</script>
```

**Completed example: [07-node.html](https://github.com/eduardolundgren/alloy-ui-exercises/blob/master/01-basics/07-node.html)**

## Show/Hide

* In this exercise, we will create a element that can be dynamically hidden and shown. Set up your document as usual with the title and heading `AlloyUI - Show\Hide`.

* Inside the `<body>`, we will create a `foo` element and a `<button>` to toggle its visibility on and off.

```html
<button id="toggleBtn"> Toggle Visibility </button>

<div id="foo">I am a foo element.</div>
```

* We also add some CSS inside of the `<head>` to make the `foo` element more noticeable.

```html
<style>
	#foo {
		background: #000;
		color: #FFF;
		height: 100px;
		margin: 10px 0;
		width: 100px;
	}
</style>
```

* Now we load the modules `node` and `event` and get our button and `foo` element.

```html
<script>
	YUI().use('node', 'event', function(Y) {
		// Grab the elements
		var foo = Y.one('#foo'),
			toggleBtn = Y.one('#toggleBtn');
	});
</script>
```

* Since we want clicking `toggleBtn` to hide or show the `foo` element, we will create a `click` event handler for it.

```html
<script>
	YUI().use('node', 'event', function(Y) {
		// Grab the elements
		var foo = Y.one('#foo'),
			toggleBtn = Y.one('#toggleBtn');

		// Add 'click' event handler
		toggleBtn.on('click', function(event) {
			// Hide or show the foo element
		});
	});
</script>
```

* Finally, we use the `.toggleView()` method from the `node` module to hide and show the `foo` element.

```html
<script>
	YUI().use('node', 'event', function(Y) {
		// Grab the elements
		var foo = Y.one('#foo'),
			toggleBtn = Y.one('#toggleBtn');

		// Add 'click' event handler
		toggleBtn.on('click', function(event) {
			// Toggle foo visibility
			foo.toggleView();
		});
	});
</script>
```

* Read more about how `.toggleView()` works [here](http://yuilibrary.com/yui/docs/node/node-view.html).

**Completed example: [08-show-hide.html](https://github.com/eduardolundgren/alloy-ui-exercises/blob/master/01-basics/08-show-hide.html)**