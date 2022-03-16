// init calendar rerender
var calendarEl = document.getElementById("calendar");
var calendar = new FullCalendar.Calendar(calendarEl, calenderHandle(events));
calendar.render();
// change event calendar form
$("#calendarGroup").on('change', (e) => {
    const color = event.target[event.target.selectedIndex].getAttribute("data-color");
    $("#colorEvent").val(color);
    $("#colorEvent").css("color", color);
});
// add event handle
$("#form-add-event").on("submit", function (e) {
    e.preventDefault();
    const event = {
        title: $("#titleEvent").val(),
        description: $("#description").val(),
        start: $("#startDate").val(),
        color: $("#colorEvent").val(),
        category: $("#category").val(),
        calendar: $("#calendarGroup").val(),
        overlap: $("#overlap").is(':checked'),
        allDay: true,
        hasEnd: false,
        display: $("#display").val(),
    }
    if ($("#startTime").val()) {
        event.start = event.start + "T" + $("#startTime").val();
    }
    if ($("#endDate").val()) {
        event.end = $("#endDate").val();
        if ($("#endTime").val()) {
            event.end = event.end + "T" + $("#endTime").val();
            event.hasEnd = true;
            event.allDay = false;
        }
    }
    if ($("#location").val() && $("#location").val() != "" && $("#location").val() != null) {
        event.location = $("#location").val();
    }
    if (new Date(event.end).getDate() - new Date(event.start).getDate() <= 0) {
        event.allDay = false;
    }
    if (event.display == 'background' || event.display == 'inverse-background') {
        event.allDay = true;
    }
    event.start = new Date(event.start).getTime();
    event.end = new Date(event.end).getTime();
    console.log(event);
    $.ajax({
        method: "POST",
        url: "/calendar/addEvent",
        data: event,
    }).done(function (data) {
        if (data.detailMessage || data.stackTrace) {
            $("#showSuccessFormAdd").addClass("hidden")
            $('#contentErrorFormAdd').text(data.detailMessage ? data.detailMessage : "Update error!");
            $("#showErrorFormAdd").removeClass("hidden")
        } else {
            $("#showErrorFormAdd").addClass("hidden")
            $('#contentSuccessFormAdd').text("Update success")
            $("#showSuccessFormAdd").removeClass("hidden")
            const event = {
                id: data.id,
                title: data.title,
                description: data.description,
                location: data.location,
                color: data.additional.calendar.color,
                overlap: data.additional.overlap,
                category: data.additional.category.id,
                categoryName: data.additional.category.name,
                status: data.additional.status.id,
                statusName: data.additional.status.name,
                calendarName: data.additional.calendar.name,
                calendar: data.additional.calendar.id,
                start: new Date(data.additional.startDate).toISOString(),
                end: new Date(data.additional.endDate).toISOString(),
                allDay: data.additional.isAllDay,
                hasEnd: data.additional.isHasEnd,
                additional: data.additional.id,
            }
            if (data.additional.display) {
                event.display = data.additional.display;
            }
            console.log(data);
            console.log(event);
            events.push(event);
            calendar.refetchEvents();
            $("#form-add-event")[0].reset();
        }
    });
});
// edit form event handle
$("#form-edit-event").on("submit", function (e) {
    e.preventDefault();
    const event = {
        id: $("#idEditEvent").val(),
        title: $("#titleEditEvent").val(),
        description: $("#descriptionEditEvent").val(),
        start: $("#startDateEditEvent").val(),
        color: $("#colorEditEvent").val(),
        category: $("#categoryEditEvent").val(),
        calendar: $("#calendarGroupEditEvent").val(),
        overlap: $("#overlapEditEvent").is(':checked'),
        allDay: true,
        hasEnd: false,
        display: $("#displayEditEvent").val(),
        additional: $("#idAdditional").val(),
    }
    if ($("#startTimeEditEvent").val()) {
        event.start = event.start + "T" + $("#startTimeEditEvent").val();
        event.allDay = false;
    }
    if ($("#endDateEditEvent").val()) {
        event.end = $("#endDateEditEvent").val();
        if ($("#endTimeEditEvent").val()) {
            event.end = event.end + "T" + $("#endTimeEditEvent").val();
            event.hasEnd = true;
            event.allDay = false;
        }
    }
    if ($("#locationEditEvent").val() && $("#locationEditEvent").val() != "" && $("#locationEditEvent").val() != null) {
        event.location = $("#locationEditEvent").val();
    }
    if (new Date(event.end).getDate() - new Date(event.start).getDate() <= 0) {
        event.allDay = false;
    }
    if (event.display == 'background' || event.display == 'inverse-background') {
        event.allDay = true;
    }
    event.start = new Date(event.start).getTime();
    event.end = new Date(event.end).getTime();
    $.ajax({
        method: "POST",
        url: "/calendar/editEvent",
        data: event,
    }).done(function (data) {
        if (data.detailMessage || data.stackTrace) {
            $("#showSuccessFormEdit").addClass("hidden")
            $('#contentErrorFormEdit').text(data.detailMessage ? data.detailMessage : "Update error!");
            $("#showErrorFormEdit").removeClass("hidden")
        } else {
            $("#showErrorFormEdit").addClass("hidden")
            $('#contentSuccessFormEdit').text("Update success")
            $("#showSuccessFormEdit").removeClass("hidden")
            const event = {
                id: data.id,
                title: data.title,
                description: data.description,
                location: data.location,
                color: data.additional.calendar.color,
                overlap: data.additional.overlap,
                category: data.additional.category.id,
                categoryName: data.additional.category.name,
                status: data.additional.status.id,
                statusName: data.additional.status.name,
                calendarName: data.additional.calendar.name,
                calendar: data.additional.calendar.id,
                start: new Date(data.additional.startDate).toISOString(),
                end: new Date(data.additional.endDate).toISOString(),
                allDay: data.additional.isAllDay,
                hasEnd: data.additional.isHasEnd,
                additional: data.additional.id,
            }
            if (data.additional.display) {
                event.display = data.additional.display;
            }
            var indexEvent = events.findIndex((item) => {
                return item.id == event.id;
            })
            events[indexEvent] = event;
            calendar.refetchEvents();
        }
    });
});
// delete event
$("#confirm-delete-event").on('click', (e) => {
    const event = {
        id: $("#confirm-delete-event").attr("data-id"),
    }
    $.ajax({
        method: "POST",
        url: "/calendar/deleteEvent",
        data: event,
    }).done(function () {
        events.forEach((item, index) => {
            if (item.id == event.id) {
                events.splice(index, 1);
            }
        })
        calendar.refetchEvents();
    })
})

//detele calendar 
const deleteCalendar = (id) => {
    $("#confirm-delete-calendar").attr("data-id", id);
}

$("#confirm-delete-calendar").on('click', (e) => {
    const data = {
        id: $("#confirm-delete-calendar").attr("data-id"),
    }
    $.ajax({
        method: "POST",
        url: "/calendar/deleteCalendar",
        data: data,
    }).done(function () {
        $('.calendar-item-' + data.id).remove();
        events.forEach((item, index) => {
            if (item.calendar == data.id) {
                events.splice(index, 1);
            }
        })
        $('.option-calendar-' + data.id).remove();
        calendar.refetchEvents();
    })
})

// Event checkbox category and calendar handle
$("input[name='filter-event-category']").on("change", function () {
    calendar.render();
})
$("input[name='filter-event-calendar']").on("change", function () {
    calendar.render();
})

// Event handle form add event
$("#buttonOpenAddEvent").on('click', () => {
    $("#addEventFormContainer").removeClass("hidden")
});
$("#buttonCloseAddFormEvent").on('click', () => {
    $("#addEventFormContainer").addClass("hidden");
})

//click outside event
$(document).mouseup(function (e) {
    if ($(e.target).closest("#addEventFormContainer").length === 0 && !$("#addEventFormContainer").hasClass("hidden")) {
        $("#addEventFormContainer").addClass("hidden");
    }
});
// edit calendar handle
const editSetValueCalendar = (value) => {
    $("#idCalendar").val(value.id);
    $("#nameEditCalendar").val(value.name);
    $("#colorEditCalendar").val(value.color);
}

//open navbar calendar
$("#buttonMenuNavBarCalendar").on("click", function (e) {
    if ($("#navBarCalendar").hasClass("hidden") || $("#navBarCalendar").css("display") == "none") {
        $("#navBarCalendar").removeClass("hidden")
        $("#navBarCalendar").css("display", "block")
        calendar.render();
    } else {
        $("#navBarCalendar").addClass("hidden")
        $("#navBarCalendar").css("display", "none")
        calendar.render();
    }
})