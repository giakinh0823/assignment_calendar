<%-- 
    Document   : calendar
    Created on : Feb 11, 2022, 1:01:26 PM
    Author     : giaki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../base/header.jsp" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/main.min.css">
        <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/main.min.js"></script>
    </head>
    <body>
        <jsp:include page="../dashboard/navbar.jsp" />
        <div class="w-[calc(100%_-_15rem)] ml-auto p-5 min-h-screen">
            <div class="flex">
                <div class="w-60">
                    <div class="block p-6 rounded-lg shadow-lg bg-white max-w-md">
                        <form action="/calendar" name="form-add-event" id="form-add-event" method="POST">
                            <div class="form-group mb-6">
                                <input type="text" class="form-control block
                                       w-full
                                       px-3
                                       py-1.5
                                       text-base
                                       font-normal
                                       text-gray-700
                                       bg-white bg-clip-padding
                                       border border-solid border-gray-300
                                       rounded
                                       transition
                                       ease-in-out
                                       m-0
                                       focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none" id="exampleInput125"
                                       placeholder="Name Event" name="name" id="nameEvent">
                            </div>
                            <div class="form-group mb-6">
                                <textarea
                                    class="
                                    form-control
                                    block
                                    w-full
                                    px-3
                                    py-1.5
                                    text-base
                                    font-normal
                                    text-gray-700
                                    bg-white bg-clip-padding
                                    border border-solid border-gray-300
                                    rounded
                                    transition
                                    ease-in-out
                                    m-0
                                    focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none
                                    "
                                    id="description"
                                    rows="3"
                                    placeholder="Description"
                                    name="description"
                                    id="description"
                                    ></textarea>
                            </div>
                            <div>
                                <div class="flex items-center justify-center">
                                    <div class="datepicker relative form-floating mb-5 xl:w-96">
                                        <input type="text"
                                               class="form-control block w-full px-3 py-1.5 text-base font-normal text-gray-700 bg-white bg-clip-padding border border-solid border-gray-300 rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none"
                                               placeholder="Start date" name="start_date" id="startDate"/>
                                        <label for="floatingInput" class="text-gray-700">Start date</label>
                                    </div>
                                </div>
                                <div class="flex justify-center">
                                    <div class="timepicker relative form-floating mb-5 xl:w-96" data-mdb-with-icon="false" id="input-toggle-timepicker">
                                        <input type="text"
                                               class="form-control block w-full px-3 py-1.5 text-base font-normal text-gray-700 bg-white bg-clip-padding border border-solid border-gray-300 rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none"
                                               placeholder="Start time" data-mdb-toggle="input-toggle-timepicker"  name="start_time" id="startTime"/>
                                        <label for="floatingInput" class="text-gray-700">Start time</label>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="flex items-center justify-center">
                                    <div class="datepicker relative form-floating mb-5 xl:w-96">
                                        <input type="text"
                                               class="form-control block w-full px-3 py-1.5 text-base font-normal text-gray-700 bg-white bg-clip-padding border border-solid border-gray-300 rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none"
                                               placeholder="Start date" name="end_date" id="endDate"/>
                                        <label for="floatingInput" class="text-gray-700">End date</label>
                                    </div>
                                </div>
                                <div class="flex justify-center">
                                    <div class="timepicker relative form-floating mb-5 xl:w-96" data-mdb-with-icon="false" id="input-toggle-timepicker">
                                        <input type="text"
                                               class="form-control block w-full px-3 py-1.5 text-base font-normal text-gray-700 bg-white bg-clip-padding border border-solid border-gray-300 rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none"
                                               placeholder="End time" data-mdb-toggle="input-toggle-timepicker"  name="end_time" id="endTime"/>
                                        <label for="floatingInput" class="text-gray-700">End time</label>
                                    </div>
                                </div>
                            </div>
                            <button type="submit" class="
                                    w-full
                                    px-6
                                    py-2.5
                                    bg-blue-600
                                    text-white
                                    font-medium
                                    text-xs
                                    leading-tight
                                    uppercase
                                    rounded
                                    shadow-md
                                    hover:bg-blue-700 hover:shadow-lg
                                    focus:bg-blue-700 focus:shadow-lg focus:outline-none focus:ring-0
                                    active:bg-blue-800 active:shadow-lg
                                    transition
                                    duration-150
                                    ease-in-out" id="addEvent">Add event</button>
                        </form>
                    </div>
                </div>
                <div class="w-[calc(100%_-_15rem)] px-5">
                    <div id="calendar" class="max-h-screen w-full"></div>
                </div>
            </div>
        </div>
        <script>

            const events = [
                {
                    colorId: 1,
                    title: 'Business Lunch',
                    start: '2020-09-03T13:00:00',
                    constraint: 'businessHours'
                },
                {
                    colorId: 1,
                    title: 'Meeting',
                    start: '2020-09-13T11:00:00',
                    constraint: 'availableForMeeting', // Không được kéo
                    color: '#257e4a' // color nút tròn nhỏ
                },
                {
                    colorId: 1,
                    title: 'Conference',
                    start: '2020-09-18',
                    end: '2020-09-20'
                },
                {
                    colorId: 1,
                    title: 'Party',
                    start: '2020-09-29T20:00:00'
                },

                // các khu vực phải bỏ "Cuộc họp"
                {
                    colorId: 1,
                    groupId: 'availableForMeeting',
                    start: '2020-09-11T10:00:00',
                    end: '2020-09-11T16:00:00',
                    display: 'background'
                },
                {
                    colorId: 1,
                    groupId: 'availableForMeeting',
                    start: '2020-09-13T10:00:00',
                    end: '2020-09-13T16:00:00',
                    display: 'background'
                },

                // khu vực màu đỏ nơi không có sự kiện nào có thể bị bỏ
                {
                    colorId: 1,
                    start: '2020-09-24',
                    end: '2020-09-28',
                    overlap: false,
                    display: 'background',
                    color: '#ff9f89'
                },
                {
                    colorId: 1,
                    start: '2020-09-06',
                    end: '2020-09-08',
                    overlap: false,
                    display: 'background',
                    color: '#ff9f89'
                }
            ]

            document.addEventListener('DOMContentLoaded', function () {
                var calendarEl = document.getElementById('calendar');

                var calendar = new FullCalendar.Calendar(calendarEl, {
                    headerToolbar: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
                    },
                    initialDate: '2020-09-12',
                    navLinks: true, // có thể nhấp vào tên ngày / tuần để điều hướng chế độ xem
                    businessHours: true, // hiển thị giờ làm việc
                    editable: true,
                    selectable: true,
                    dayMaxEventRows: true,
                    eventClick: function (info) {
                        alert("On Click");
                    },
                    events: events,
                });

                calendar.render();

                $("#form-add-event").on("submit", function (e) {
                    e.preventDefault();
                    events.push({
                        title: $("#eventName").val(),
                        start: $("#fromDate").val(),
                        end: $("#toDate").val(),
                        className: 'modal-add',
                    })
                    calendar.refetchEvents();
                });
            });
        </script>
    </body>
</html>
<jsp:include page="../base/footer.jsp" />