
// init calendar rerender
var calendarEl = document.getElementById("calendar");
var calendar = new FullCalendar.Calendar(calendarEl, calenderHandle(events));
calendar.render();

// Event checkbox category and calendar handle
$("input[name='filter-event-category']").on("change", function () {
    calendar.render();
})
$("input[name='filter-event-calendar']").on("change", function () {
    calendar.render();
})