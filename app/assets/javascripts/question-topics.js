function refreshTopics(school_id) {
	var topic_id = $("#discipline_select").val();
	var url = "/school/" + school_id + "/topics/" + topic_id + ".js";
	$.get(url);
}