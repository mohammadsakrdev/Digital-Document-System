function ValidateEmptyValue() {
    var gv = document.getElementById("<%= GridViewTalabTadelat.ClientID %>");
    var tb = gv.getElementsByTagName("input");

    for (var i = 0; i < tb.length; i++) {
        if (tb[i].type == "text" || tb[i].type == "number") {
            if (tb[i].value < 1) {
                alert("أكمل ادخال البيانات");
                return false;
            }
        }
    }
    return true;
}

function IsReadyToPrint() {
    var gv = document.getElementById("<%= GridViewTalabTadelat.ClientID %>");
    var tb = gv.getElementsByTagName("input");

    for (var i = 0; i < tb.length; i++) {
        if (tb[i].type == "text" || tb[i].type == "number") {
            if (tb[i].value < 1) {
                return false;
            }
        }
    }
    return true;
}

function PrintPage() {
    if (IsReadyToPrint()) {
        var printContent = document.getElementById('pnlGridView');
        newWin = window.open("");
        printContent.style.direction = "rtl";
        newWin.document.write(printContent.outerHTML);
        newWin.print();
        newWin.close();
        return true;
    }

}