var commonContextPath = "";

$(document).ready(function() {	 
	for (var i = 0, t = document.getElementsByTagName("script"); i < t.length; i++) {
		var sSrc = t[i].getAttribute("src");
		if (sSrc != null && sSrc.indexOf("/js/common.js") >= 0 && sSrc.indexOf("?") >= 0) {						
			if (sSrc.split("?")[1] != null && sSrc.split("?")[1] != "") {
				for (var j = 0, u = sSrc.split("?")[1].split("&"); j < u.length; j++) {
					if (u[j].indexOf("=") >= 0) {
						if (u[j].split("=")[0] == "contextPath") {
							commonContextPath = u[j].split("=")[1];
						}
					}	
				}
			}			
		}	
	} 
});

function commonIsNull(asValue) {
    if (asValue == null || asValue == undefined || asValue.toString().replace(/ /g,"") == "") {
        return true;
    }
    return false;
}

// Encoding
function encodingToChar(param) { 
    var encode = '';

    for (var i = 0; i < param.length; i++) {
        var len  = '' + param.charCodeAt(i);
        var token = '' + len.length;
        encode  += token + param.charCodeAt(i);
    }

    return encode;
}

// Decoding
function decodingToChar(param) { 
    var sb = '';
    var pos = 0;
    var flg = true;

    if (param != null) {
        if (param.length > 1) {
            while (flg) {
                var sLen = param.substring(pos, ++pos);
                var nLen = 0;

                try {
                	nLen = parseInt(sLen);
                } catch(e) {
                    nLen = 0;
                }

                var code = '';
                if ((pos+nLen) > param.length) code = param.substring(pos);
                else code = param.substring(pos, (pos+nLen));

                pos += nLen;
                sb += String.fromCharCode(code);

                if (pos >= param.length) flg = false;
            }
        }
    }
    
    return sb;
}

function commonMovePage(psPage, psQueryString) {
	var sPage = commonContextPath;
	
	if (psPage == "main") {
		sPage += "/";
	} else if (psPage == "admin") {
		sPage += "/admin/admin";  
	} else if (psPage == "terms") { 
		sPage += "/terms"; 
	} else if (psPage == "logout") {
		sPage += "/logout"; 
	}
	
	var sQueryString = ""; 
	if (!commonIsNull(psQueryString)) {
		var sJoinString = "?";
		if (sPage.indexOf("?") > -1) sJoinString = "&";
		
		sQueryString += (sJoinString + psQueryString);
	}
	
	location.href = sPage + sQueryString; 
}

function commonMovePageSearch(psCond) {
	if (!commonIsNull(psCond)) {
		location.href = "../../View/Main/searchResult.jsp?searchCond=" + psCond;
	}
}

function commonPopupPage(psPage, psQueryString) {	
	var lsUrl = commonContextPath;
	var lsTarget = "";
	var lnSizeW = "";
	var lnSizeH = "";
	var lntLeft = "";
	var lntTop = "";
	var lsQueryString = (commonIsNull(psQueryString) ? "" : "?" + psQueryString);
	var lsOpenOption = ",toolbar=no,menubar=no,location=yes,scrollbars=yes,status=yes,resizable=yes";
	
	if (psPage == "subScribe") {
		lsUrl += "/service/subScribe";		
		lsTarget = "subScribe";			
		lnSizeW = 1000;
		lnSizeH = 1000;
		lntLeft = 0;
		lntTop = 0;
		lsOpenOption = ",toolbar=no,menubar=no,location=no,scrollbars=yes,status=yes,resizable=no";
	} else if (psPage == "policy") {
		lsUrl += "/policy/policy";							
		lsTarget = "policy";			
		lnSizeW = parseInt(screen.availWidth * 0.5);
		lnSizeH = parseInt(screen.availHeight * 0.5);
		lntLeft = screen.availWidth / 2 - lnSizeW / 2;
		lntTop = screen.availHeight / 2 - lnSizeH / 2;
		lsOpenOption = ",toolbar=yes,menubar=yes,location=yes,scrollbars=yes,status=yes,resizable=yes";
	} else if (psPage == "terms") {
		lsUrl += "/policy/terms";							
		lsTarget = "terms";			
		lnSizeW = parseInt(screen.availWidth * 0.5);
		lnSizeH = parseInt(screen.availHeight * 0.5);
		lntLeft = screen.availWidth / 2 - lnSizeW / 2;
		lntTop = screen.availHeight / 2 - lnSizeH / 2;
		lsOpenOption = ",toolbar=yes,menubar=yes,location=yes,scrollbars=yes,status=yes,resizable=yes";		
	} 
 	
	var loPopup = window.open(lsUrl + lsQueryString, lsTarget, "left=" + lntLeft + ",top=" +  lntTop + ",width=" + lnSizeW + ",height=" + lnSizeH  + lsOpenOption);
	if (loPopup != null) loPopup.focus();
}