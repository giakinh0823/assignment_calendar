const calenderHandle = (events) => ({
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth',
        },
        eventTimeFormat: {// like '14:30:00'
            hour: '2-digit',
            minute: '2-digit',
            second: '2-digit',
            meridiem: false
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
        eventClick: function (info) {
            console.log(info.event)
            $("#titleDetailEvent").text(info.event.title);
            $("#timeDetailEvent").text(`${new Date(info.event.start).toLocaleString()} - ${new Date(info.event.end).toLocaleString()}`);
            $("#descriptionDetailEvent").text(info.event.extendedProps.description);
            $("#locationDetailEvent").text(info.event.extendedProps.location);
            $("#statusDetailEvent").text(info.event.extendedProps.statusName);
            $("#categoryDetailEvent").text(info.event.extendedProps.categoryName);
            $("#calendarDetailEvent").text(info.event.extendedProps.calendar);
            $("#buttonOpenModelDetailEvent").click();
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
            console.log(info.event.allDay)
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
    })
