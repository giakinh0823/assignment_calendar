const calenderHandle = (events) => ({
        height: '100vh',
        headerToolbar: {
            left: 'prevYear,prev,next,nextYear today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth',
        },
        eventTimeFormat: {// like '14:30:00'
            hour: '2-digit',
            minute: '2-digit',
            second: '2-digit',
            hour12: false,
        },
        buttonText: {
            today: 'Today',
            month: 'Month',
            week: 'Week',
            day: 'Day',
            list: 'List'
        },
        titleFormat: {year: 'numeric', month: 'long'},
        dayPopoverFormat: {month: 'long', day: 'numeric', year: 'numeric'},
        initialDate: new Date(),
        navLinks: true, // có thể nhấp vào tên ngày / tuần để điều hướng chế độ xem
        businessHours: true, // hiển thị giờ làm việc
        editable: true,
        selectable: true,
        droppable: true,
        dayMaxEventRows: true,
        selectOverlap: function (event) {
            return event.rendering === 'background';
        },
        eventClick: function (info) {
            console.log(info.event);
            $("#showErrorFormEdit").addClass("hidden")
            $("#showSuccessFormEdit").addClass("hidden")
            $("#titleDetailEvent").text(info.event.title);
            $("#timeDetailEvent").text(`${new Date(info.event.start).toLocaleString()} - ${new Date(info.event.end).toLocaleString()}`);
            $("#descriptionDetailEvent").text(info.event.extendedProps.description);
            $("#locationDetailEvent").text(info.event.extendedProps.location);
            $("#statusDetailEvent").text(info.event.extendedProps.statusName);
            $("#categoryDetailEvent").text(info.event.extendedProps.categoryName);
            $("#calendarDetailEvent").text(info.event.extendedProps.calendarName);
            $("#buttonOpenModelDetailEvent").click();
            $("#infoEventContent").removeClass("hidden");
            $("#editEventContent").addClass("hidden");
            $("#confirm-delete-event").attr("data-id", info.event.id);

            $("#idEditEvent").val(info.event.id);
            $("#idAdditional").val(info.event.extendedProps.additional);
            $("#titleEditEvent").val(info.event.title);
            $("#descriptionEditEvent").val(info.event.extendedProps.description);
            $("#colorEditEvent").val(info.event._def.ui.backgroundColor);
            $("#colorEditEvent").css("color", info.event._def.ui.backgroundColor);
            $("#calendarGroupEditEvent").val(info.event.extendedProps.calendar);
            $("#categoryEditEvent").val(info.event.extendedProps.category);
            if (info.event._def.ui.display) {
                $("#displayEditEvent").val(info.event._def.ui.display);
            }
            $("#locationEditEvent").val(info.event.extendedProps.location);
            const startDate = new Date(info.event.start);
            var startDay = ("0" + startDate.getDate()).slice(-2);
            var startMonth = ("0" + (startDate.getMonth() + 1)).slice(-2);
            var start = startDate.getFullYear() + "-" + (startMonth) + "-" + (startDay);
            $('#startDateEditEvent').val(start);
            const endDate = new Date(info.event.end);
            var endDay = ("0" + endDate.getDate()).slice(-2);
            var endMonth = ("0" + (endDate.getMonth() + 1)).slice(-2);
            var end = endDate.getFullYear() + "-" + (endMonth) + "-" + (endDay);
            $('#endDateEditEvent').val(end);
            if (info.event._def.hasEnd) {
                const startHours = ("0" + startDate.getHours()).slice(-2);
                const startMinutes = ("0" + startDate.getMinutes()).slice(-2);
                const endHours = ("0" + endDate.getHours()).slice(-2);
                const endMinutes = ("0" + endDate.getMinutes()).slice(-2);
                const startTime = startHours + ":" + startMinutes;
                const endTime = endHours + ":" + endMinutes;
                $("#startTimeEditEvent").val(startTime);
                $("#endTimeEditEvent").val(endTime);
            }
            if (!info.event._def.ui.overlap) {
                $("#overlapEditEvent").prop('checked', false);
            }
        },
        eventDrop: function (info) {
            const start = new Date(info.event.start);
            const end = new Date(info.event.end);
            const event = {
                id: info.event.id,
                start: start.getTime(),
                end: end.getTime(),
                allDay: info.event.allDay,
            }
            var index = events.findIndex(item => item.id == info.event.id);
            events[index] = {...events[index], ...event}
            $.ajax({
                method: "POST",
                url: "/calendar/updateEvent",
                data: event,
            }).done(function (data) {
                // update event thành công
            });
        },
        eventResize: function (info) {
            const start = new Date(info.event.start);
            const end = new Date(info.event.end);
            if ((info.event.allDay || info.event.extendedProps.isOnlyDate) && !info.event._def.hasEnd) {
                start.setDate(start.getDate() + 1);
                end.setDate(end.getDate() + 1);
            }
            const event = {
                id: info.event.id,
                start: start.getTime(),
                end: end.getTime(),
                allDay: info.event.allDay,
                hasEnd: info.event._def.hasEnd,
            }
            var index = events.findIndex(item => item.id == info.event.id);
            events[index] = {...events[index], ...event}
            $.ajax({
                method: "POST",
                url: "/calendar/updateEvent",
                data: event,
            }).done(function (data) {
                // update event thành công
            });
        },
        dateClick: function (info) {
            console.log('Clicked on: ' + info.dateStr);
            console.log(info);
        },
        events: function (info, successCallback, failureCallback, dropInfo) {
            successCallback(events);
        },
        eventClassNames: function (info) {
            var result = true;
            var calendars = [];
            var categories = []
            $("input[name='filter-event-calendar']:checked").each(function () {
                calendars.push(Number.parseInt($(this).val()));
            });
            $("input[name='filter-event-category']:checked").each(function () {
                categories.push(Number.parseInt($(this).val()));
            });
            result = calendars.indexOf(info.event.extendedProps.calendar) >= 0 && categories.indexOf(info.event.extendedProps.category) >= 0;
            if (!result) {
                result = "hidden";
            }
            return result;
        }
    })
