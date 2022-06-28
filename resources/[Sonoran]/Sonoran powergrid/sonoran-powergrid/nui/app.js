var code = "";
var length = 4;
var show = true;
var c_code = "";
$(function () {
	window.onload = (e) => {
		window.addEventListener("message", function (event) {
			code = event.data.code;
			if (event.data.length > 4 || event.data.length <= 10) {
				length = event.data.length;
			}
			show = event.data.show;
			switch (event.data.action) {
				case "openui":
					$("#numpad").text("Enter code");
					$("#numpad-background").fadeIn();
					break;
				case "closeui":
					$("#numpad-background").fadeOut();
					$("#numpad").removeClass("text-red-500");
					c_code = "";
					break;
				default:
					break;
			}
		});

		$("#submit").click(function () {
			if (c_code == code) {
				$.post("https://sonoran-powergrid/SubmitCode", "true");
			} else {
				$("#numpad").addClass("text-red-500");
				$("#numpad").text("Incorrect Code");
				c_code = "";
				$.post("https://sonoran-powergrid/SubmitCode", "false");
			}
		});

		$("#clear").click(function () {
			$("#numpad").removeClass("text-red-500");
			$("#numpad").html("");
			c_code = "";
		});

		document.onkeyup = function (event) {
			if (event.key == "Escape") {
				$("#numpad-background").fadeOut();
				$.post("https://sonoran-powergrid/CloseUI");
			}
		};
	};
});

function typeNum(num) {
	if (isNaN($("#numpad").text())) {
		$("#numpad").html("");
		$("#numpad").removeClass("text-red-500");
	}
	if (getLength() < length) {
		if (show) {
			$("#numpad").text($("#numpad").text() + num);
			c_code = c_code + num;
		} else {
			$("#numpad").html(
				$("#numpad").html() + '<i class="fas fa-circle fa-xs"></i>'
			);
			c_code = c_code + num;
		}
	} else {
		$("#numpad").html("");
	}
}

function getLength() {
	if (show) {
		return $("#numpad").text().length;
	} else {
		return $("#numpad").children().length;
	}
}
