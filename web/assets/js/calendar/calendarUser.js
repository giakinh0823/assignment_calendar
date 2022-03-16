const calenderHandle = (events) => ({
        height: 940,
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
            if (!info.event._def.ui.overlap) {
                $("#overlapEditEvent").prop('checked', false);
            }
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
