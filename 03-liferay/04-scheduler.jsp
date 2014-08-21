<%@ include file="/html/portlet/init.jsp" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>

<h1>AlloyUI - Scheduler</h1>

<div id="scheduler"></div>

<!--
Start using AlloyUI
Then initialize AlloyUI and load a module, e.g., node.
-->
<aui:script use="aui-scheduler">
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

	var agendaView = new A.SchedulerAgendaView();
	var dayView = new A.SchedulerDayView();
	var eventRecorder = new A.SchedulerEventRecorder();
	var monthView = new A.SchedulerMonthView();
	var weekView = new A.SchedulerWeekView();

	// Initialize AUI scheduler

	new A.Scheduler(
		{
			boundingBox: '#scheduler',
			date: new Date(2014, 9, 19),
			eventRecorder: eventRecorder,
			items: events,
			render: true,
			views: [dayView, weekView, monthView, agendaView]
		}
	);
</aui:script>