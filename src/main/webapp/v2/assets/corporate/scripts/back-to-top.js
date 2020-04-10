//** jQuery Scroll to Top Control script- (c) Dynamic Drive DHTML code library: http://www.dynamicdrive.com.
//** Available/ usage terms at http://www.dynamicdrive.com (March 30th, 09')
//** v1.1 (April 7th, 09'):
//** 1) Adds ability to scroll to an absolute position (from top of page) or specific element on the page instead.
//** 2) Fixes scroll animation not working in Opera. 

var scrolltotop = {
    //startline: Integer. Number of pixels from top of doc scrollbar is scrolled before showing controller
    //scrollto: Keyword (Integer, or "Scroll_to_Element_ID"). How far to scroll document up when controller is clicked on (0=top).
    setting: {
        startline: 100,
        scrollto: 0,
        scrollduration: 1000,
        fadeduration: [500, 100]
    },
    controlHTML: '<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAoCAYAAACM/r'
    + 'htAAAACXBIWXMAAAsTAAALEwEAmpwYAAAKTWlDQ1BQaG90b3Nob3AgSUNDIHByb2ZpbGUAAHjanVN3WJP3Fj7f'
    + '92UPVkLY8LGXbIEAIiOsCMgQWaIQkgBhhBASQMWFiApWFBURnEhVxILVCkidiOKgKLhnQYqIWotVXDjuH9yntX1'
    + '67+3t+9f7vOec5/zOec8PgBESJpHmomoAOVKFPDrYH49PSMTJvYACFUjgBCAQ5svCZwXFAADwA3l4fnSwP/wBr28'
    + 'AAgBw1S4kEsfh/4O6UCZXACCRAOAiEucLAZBSAMguVMgUAMgYALBTs2QKAJQAAGx5fEIiAKoNAOz0ST4FANipk9wX'
    + 'ANiiHKkIAI0BAJkoRyQCQLsAYFWBUiwCwMIAoKxAIi4EwK4BgFm2MkcCgL0FAHaOWJAPQGAAgJlCLMwAIDgCAEMeE8'
    + '0DIEwDoDDSv+CpX3CFuEgBAMDLlc2XS9IzFLiV0Bp38vDg4iHiwmyxQmEXKRBmCeQinJebIxNI5wNMzgwAABr50cH+O'
    + 'D+Q5+bk4eZm52zv9MWi/mvwbyI+IfHf/ryMAgQAEE7P79pf5eXWA3DHAbB1v2upWwDaVgBo3/ldM9sJoFoK0Hr5i3k4/'
    + 'EAenqFQyDwdHAoLC+0lYqG9MOOLPv8z4W/gi372/EAe/tt68ABxmkCZrcCjg/1xYW52rlKO58sEQjFu9+cj/seFf/2OKd'
    + 'HiNLFcLBWK8ViJuFAiTcd5uVKRRCHJleIS6X8y8R+W/QmTdw0ArIZPwE62B7XLbMB+7gECiw5Y0nYAQH7zLYwaC5EAEGc0'
    + 'Mnn3AACTv/mPQCsBAM2XpOMAALzoGFyolBdMxggAAESggSqwQQcMwRSswA6cwR28wBcCYQZEQAwkwDwQQgbkgBwKoRiWQR'
    + 'lUwDrYBLWwAxqgEZrhELTBMTgN5+ASXIHrcBcGYBiewhi8hgkEQcgIE2EhOogRYo7YIs4IF5mOBCJhSDSSgKQg6YgUUSLF'
    + 'yHKkAqlCapFdSCPyLXIUOY1cQPqQ28ggMor8irxHMZSBslED1AJ1QLmoHxqKxqBz0XQ0D12AlqJr0Rq0Hj2AtqKn0UvodX'
    + 'QAfYqOY4DRMQ5mjNlhXIyHRWCJWBomxxZj5Vg1Vo81Yx1YN3YVG8CeYe8IJAKLgBPsCF6EEMJsgpCQR1hMWEOoJewjtBK6'
    + 'CFcJg4Qxwicik6hPtCV6EvnEeGI6sZBYRqwm7iEeIZ4lXicOE1+TSCQOyZLkTgohJZAySQtJa0jbSC2kU6Q+0hBpnEwm65'
    + 'Btyd7kCLKArCCXkbeQD5BPkvvJw+S3FDrFiOJMCaIkUqSUEko1ZT/lBKWfMkKZoKpRzame1AiqiDqfWkltoHZQL1OHqRM0'
    + 'dZolzZsWQ8ukLaPV0JppZ2n3aC/pdLoJ3YMeRZfQl9Jr6Afp5+mD9HcMDYYNg8dIYigZaxl7GacYtxkvmUymBdOXmchUMN'
    + 'cyG5lnmA+Yb1VYKvYqfBWRyhKVOpVWlX6V56pUVXNVP9V5qgtUq1UPq15WfaZGVbNQ46kJ1Bar1akdVbupNq7OUndSj1D'
    + 'PUV+jvl/9gvpjDbKGhUaghkijVGO3xhmNIRbGMmXxWELWclYD6yxrmE1iW7L57Ex2Bfsbdi97TFNDc6pmrGaRZp3mcc0B'
    + 'Dsax4PA52ZxKziHODc57LQMtPy2x1mqtZq1+rTfaetq+2mLtcu0W7eva73VwnUCdLJ31Om0693UJuja6UbqFutt1z+o+0'
    + '2PreekJ9cr1Dund0Uf1bfSj9Rfq79bv0R83MDQINpAZbDE4Y/DMkGPoa5hpuNHwhOGoEctoupHEaKPRSaMnuCbuh2fjNX'
    + 'gXPmasbxxirDTeZdxrPGFiaTLbpMSkxeS+Kc2Ua5pmutG003TMzMgs3KzYrMnsjjnVnGueYb7ZvNv8jYWlRZzFSos2i8e'
    + 'W2pZ8ywWWTZb3rJhWPlZ5VvVW16xJ1lzrLOtt1ldsUBtXmwybOpvLtqitm63Edptt3xTiFI8p0in1U27aMez87ArsmuwG'
    + '7Tn2YfYl9m32zx3MHBId1jt0O3xydHXMdmxwvOuk4TTDqcSpw+lXZxtnoXOd8zUXpkuQyxKXdpcXU22niqdun3rLleUa'
    + '7rrStdP1o5u7m9yt2W3U3cw9xX2r+00umxvJXcM970H08PdY4nHM452nm6fC85DnL152Xlle+70eT7OcJp7WMG3I28Rb'
    + '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'
    + 'AGY77ybkSwPUAAAAAElFTkSuQmCC" style="width:40px; height:40px" />',
    //HTML for controller, which is auto wrapped in DIV w/ ID="topcontrol"
    controlattrs: {offsetx: 10, offsety: 10}, //offset of controller relative to right/ bottom of window corner
    anchorkeyword: '#top', //Enter href value of HTML anchors on the page that should also act as "Scroll Up" links

    state: {isvisible: false, shouldvisible: false},

    scrollup: function () {
        if (!this.cssfixedsupport) //if controller is positioned using JavaScript
        {
            this.$control.css({opacity: 0})
        } //hide controller immediately after clicking it
        var dest = isNaN(this.setting.scrollto) ? this.setting.scrollto
            : parseInt(this.setting.scrollto)
        if (typeof dest == "string" && jQuery('#' + dest).length == 1) //check element set by string exists
        {
            dest = jQuery('#' + dest).offset().top
        } else {
            dest = 0
        }
        this.$body.animate({scrollTop: dest}, this.setting.scrollduration);
    },

    keepfixed: function () {
        var $window = jQuery(window)
        var controlx = $window.scrollLeft() + $window.width()
            - this.$control.width() - this.controlattrs.offsetx
        var controly = $window.scrollTop() + $window.height()
            - this.$control.height() - this.controlattrs.offsety
        this.$control.css({left: controlx + 'px', top: controly + 'px'})
    },

    togglecontrol: function () {
        var scrolltop = jQuery(window).scrollTop()
        if (!this.cssfixedsupport) {
            this.keepfixed()
        }
        this.state.shouldvisible = (scrolltop >= this.setting.startline) ? true
            : false
        if (this.state.shouldvisible && !this.state.isvisible) {
            this.$control.stop().animate({opacity: 1},
                this.setting.fadeduration[0])
            this.state.isvisible = true
        }
        else if (this.state.shouldvisible == false && this.state.isvisible) {
            this.$control.stop().animate({opacity: 0},
                this.setting.fadeduration[1])
            this.state.isvisible = false
        }
    },

    init: function () {
        jQuery(document).ready(function ($) {
            var mainobj = scrolltotop
            var iebrws = document.all
            mainobj.cssfixedsupport = !iebrws || iebrws && document.compatMode
                == "CSS1Compat" && window.XMLHttpRequest //not IE or IE7+ browsers in standards mode
            mainobj.$body = (window.opera) ? (document.compatMode
            == "CSS1Compat" ? $('html') : $('body')) : $('html,body')
            mainobj.$control = $('<div id="topcontrol">' + mainobj.controlHTML
                + '</div>')
            .css({
                position: mainobj.cssfixedsupport ? 'fixed' : 'absolute',
                bottom: mainobj.controlattrs.offsety,
                right: mainobj.controlattrs.offsetx,
                opacity: 0,
                cursor: 'pointer'
            })
            .attr({title: 'Scroll Back to Top'})
            .click(function () {
                mainobj.scrollup();
                return false
            })
            .appendTo('body')
            if (document.all && !window.XMLHttpRequest
                && mainobj.$control.text() != '') //loose check for IE6 and below, plus whether controller contains any text
            {
                mainobj.$control.css({width: mainobj.$control.width()})
            } //IE6- seems to require an explicit width on a DIV containing text
            mainobj.togglecontrol()
            $('a[href="' + mainobj.anchorkeyword + '"]').click(function () {
                mainobj.scrollup()
                return false
            })
            $(window).bind('scroll resize', function (e) {
                mainobj.togglecontrol()
            })
        })
    }
}

scrolltotop.init()