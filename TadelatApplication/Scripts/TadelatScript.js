function disableCtrlKeyCombination(e) {
    //list all CTRL + key combinations you want to disable
    var forbiddenkeys = new Array('a', 'n', 'x', 'j', 'p');
    var key;
    var isCtrl;
    if (window.event) {
        key = window.event.keyCode;     //IE
        if (window.event.ctrlKey)
            isCtrl = true;
        else
            isCtrl = false;
    }
    else {
        key = e.which;     //firefox
        if (e.ctrlKey)
            isCtrl = true;
        else
            isCtrl = false;
    }


    //if ctrl is pressed check if other key is in forbidenKeys array
    if (isCtrl) {
        for (i = 0; i < forbiddenkeys.length; i++) {
            //case-insensitive comparation
            if (forbiddenkeys[i].toLowerCase() == String.fromCharCode(key).toLowerCase()) {
                return false;
            }
        }
    }
    return true;
}
var oEventUtil = new Object();
    oEventUtil.AddEventHandler = function (oTarget, sEventType, fnHandler) {
    if (oTarget.addEventListener) {
        oTarget.addEventListener(sEventType, fnHandler, false);
    } else if (oTarget.attachEvent) {
        oTarget.attachEvent('on' + sEventType, fnHandler);
    } else {
        oTarget['on' + sEventType] = fnHandler;
    }
    }

