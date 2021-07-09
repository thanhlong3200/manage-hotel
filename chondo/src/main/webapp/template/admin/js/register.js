/*$().ready(function() {
	$("#formSubmit").validate({
		rules: {
			fullname: {
				required: true,
				minlength: 6,
				maxlength: 50,
				pattern: /^[a-zA-Z\u00C0-\u017F]([ ](?![ ])|[a-zA-Z\u00C0-\u017F]){4,48}[a-zA-Z\u00C0-\u017F]$/

			},
			username: {
				required: true,
				minlength: 6,
				maxlength: 50,
				pattern: /^[a-zA-Z0-9]([_](?![_])|[a-zA-Z0-9]){4,48}[a-zA-Z0-9]$/
			},
			password: {
				required: true,
				minlength: 6,
				maxlength: 60,
				pattern: /^[a-zA-Z0-9]+$/
			},
			confirmPassword: {
				required: true,
				equalTo: "#password"
			},
			email: {
				required: true,
				maxlength: 60,
				pattern: /(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/
			},
			phone: {
				required: true,
				maxlength: 11,
				pattern: /^[0-9-+]+$/
			},
			address: {
				required: true
			},
			gender: {
				required: true
			}

		},
		messages: {
			fullname: {
				required: "Vui lòng điền họ tên",
				minlength: "Họ tên quá ngắn",
				maxlength: "Họ tên quá dài",
				pattern: 'Không hợp lệ'
			},
			username: {
				required: "Vui lòng điền tên tài khoản",
				minlength: "Tên tài khoản quá ngắn",
				maxlength: "Tên tài khoản quá dài",
				pattern: 'Không hợp lệ'
			},
			password: {
				required: "Vui lòng điền mật khẩu",
				minlength: "Mật khẩu quá ngắn",
				maxlength: "Mật khẩu quá dài",
				pattern: 'Không hợp lệ'
			},
			confirmPassword: {
				required: "Vui lòng xác nhận mật khẩu",
				equalTo: "Mật khẩu không trùng khớp"
			},
			email: {
				required: "Vui lòng điền địa chỉ email",
				maxlength: "Email quá dài",
				pattern: 'Không hợp lệ'
			},
			phone: {
				required: "Vui lòng điền số điện thoại",
				maxlength: "Số điện thoại quá dài",
				pattern: 'Không hợp lệ'
			},
			address: {
				required: "Vui lòng điền địa chỉ"
			},
			gender: {
				required: "Vui lòng chọn giới tính"
			}
		}
	});
})


*/