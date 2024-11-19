async function login() {
    const user_dto = {
        email: document.getElementById("email").value,
        password: document.getElementById("password").value
    };
    const response = await fetch(
            "login",
            {
                method: "POST",
                body: JSON.stringify(user_dto),
                headers: {
                    "Content-Type": "application/json"
                }
            }

    );
    if (response.ok) {

        const json = await response.json();

        if (json.success) {

            swal({
                title: "",
                text: "Success",
                icon: "success",
            });

        } else {
            swal({
                title: "",
                text: json.message,
                icon: "error",
            });
        }
    }
}

