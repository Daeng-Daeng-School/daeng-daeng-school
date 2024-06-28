$(document).ready(function() {
    fetchClasses();

    function fetchClasses() {
        $.ajax({
            url: "${pageContext.servletContext.contextPath}/notice/selectClassDog",
            method: "GET",
            success: function(data) {
                console.log('Received class list:', data);
                var searchClass = $('.search-input-container .search-select[name="class"]');
                searchClass.empty();
                searchClass.append('<option value="" disabled selected>반 선택</option>');
                $.each(data, function(index, item) {
                    searchClass.append('<option value="' + item.classCode + '">' + item.className + '</option>');
                });
            },
            error: function(xhr, status, error) {
                console.error('Failed to fetch class list:', error);
                console.log('Response:', xhr.responseText);
                alert('클래스 목록을 불러오는 데 실패했습니다.');
            }
        });
    }

    window.fetchDogs = function(classCode) {
        if (classCode) {
            $.ajax({
                url: "${pageContext.servletContext.contextPath}/notice/selectClassDog?classCode=" + classCode,
                method: "GET",
                success: function(data) {
                    console.log('Received dog list:', data);
                    var searchDog = $('.search-input-container .search-select[name="dog"]');
                    searchDog.empty();
                    searchDog.append('<option value="" disabled selected>반려견 선택</option>');
                    $.each(data, function(index, item) {
                        searchDog.append('<option value="' + item.dogCode + '">' + item.dogName + '</option>');
                    });
                },
                error: function(xhr, status, error) {
                    console.error('Failed to fetch dog list:', error);
                    console.log('Response:', xhr.responseText);
                    alert('반려견 목록을 불러오는 데 실패했습니다.');
                }
            });
        }
    }

    window.select = function() {
        var selectClass = $('.search-input-container .search-select[name="class"]').val();
        var selectDog = $('.search-input-container .search-select[name="dog"]').val();
        // Add logic to use selected values
    }
});
