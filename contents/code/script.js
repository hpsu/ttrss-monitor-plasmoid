function requestFeedCount() {
    var xhr = new XMLHttpRequest();

    xhr.onreadystatechange = function() {
        if (xhr.readyState == XMLHttpRequest.DONE) {
            onFeedCountUpdated(xhr);
        }
    };

    xhr.timeout = 1000;
    xhr.open('POST', getHost() +
                     '/public.php?op=getUnread&login=' +
                     getUser());
    try {
        xhr.send();
    }
    catch (e){
        console.warn('XHR send error');
    }
}

function onFeedCountUpdated(xhr) {
    if (xhr.readyState == XMLHttpRequest.DONE) {
        if(xhr.status !== 200) {
            setToolTip(
                i18n('Error connection to server: ') + xhr.status,
                true);
            return;
        }
        var count = Number(xhr.responseText);
        if(isNaN(count)) {
            setToolTip(
                i18n('Invalid server response: ') + xhr.responseText,
                true);
        } else if(xhr.responseText > 0) {
            setToolTip(xhr.responseText + i18n(' unread articles.'), true);
        } else {
            setToolTip(i18n('No unread articles.'), false);
        }
    }
    
}

function setToolTip(message, active) {
    label = message;
    plasmoid.status = active ?
                      PlasmaCore.Types.ActiveStatus :
                      PlasmaCore.Types.PassiveStatus;
    plasmoid.toolTipSubText = message;
}

function open() {
    Qt.openUrlExternally(getHost());
}

function getHost() {
    return plasmoid.configuration.serverURL.replace(/\/$/, '');
}

function getUser() {
    return plasmoid.configuration.serverUser;
}

function getUpdateInterval() {
    return plasmoid.configuration.serverUpdate * 1000;
}
