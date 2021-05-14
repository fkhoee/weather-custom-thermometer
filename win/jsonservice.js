 function request() {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.HEADERS_RECEIVED) {

            } else if(xhr.readyState === XMLHttpRequest.DONE) {
                var json = JSON.parse(xhr.responseText.toString())
                tableView.model = json
                //print('RESULT: ' + tableView.model[1]["LocalizedName"] )
            }
        }

        xhr.open("GET", "win/weatherAccu.json")
        xhr.send();
    }
