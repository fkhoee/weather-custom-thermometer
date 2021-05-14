function defaultYArrow(){
    return parseInt(7 + ((100) * 7));
}

function moveArrow(index){
    var spot = 0;
    if(index === 'undefined'){
        index = 0;
        spot = 0;
    }
    else{
        spot = parseInt(7 + ((100 - parseInt(index)) * 7));
    }
    return spot
}

function calculateTempText(index){
    var tempStr = 100 - index;
    if(index % 10){
         return "";
    }else{
         return tempStr + "  \xB0C";
     }
}

function calculatePosition(index) {
   if(index % 10){
        return 50
   }else{
        return 100
    }
}

function iconFix(icon_value){
    var imageReturn = "";
    if(icon_value >= 10)
    {
        imageReturn = "qrc:/win/weather_images/icon" + icon_value + "s.png";
    }else if(icon_value < 10){
        imageReturn = "qrc:/win/weather_images/icon0" + icon_value + "s.png";
    }
    return imageReturn
}

function request() {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.HEADERS_RECEIVED) {

            } else if(xhr.readyState === XMLHttpRequest.DONE) {
                var json = JSON.parse(xhr.responseText.toString())
                tableView.model = json
            }
        }

        xhr.open("GET", "weatherAccu.json")
        xhr.send();
    }
