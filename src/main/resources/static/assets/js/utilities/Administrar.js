function mostrarAlerta2(mensaje) {
var alertaDiv = document.createElement("div");
        alertaDiv.classList.add("alert", "alert-danger", "mb-3");
        alertaDiv.textContent = mensaje;
        var alertContainer = document.getElementById("alert-container2");
        alertContainer.insertBefore(alertaDiv, alertContainer.firstChild);
        setTimeout(function () {
        alertaDiv.remove();
        }, 2000);
        }

<!--Insertar Productos-->
document.getElementById('btn-agregar').addEventListener('click', function (event) {
        document.getElementById('updateBtn').disabled = true;
        document.getElementById('submitBtn').disabled = false;
        document.getElementById('productoForm').reset();
        document.getElementById('identificador').value = 'insertar';
});

document.getElementById('productoForm').addEventListener('submit', function (event) {
        event.preventDefault();
        var producto = document.getElementById('producto').value.trim();
        var ingredientes = document.getElementById('ingredientes').value.trim();
        var descripcion = document.getElementById('descripcion').value.trim();
        var precio = document.getElementById('precio').value.trim();
        var imagen = document.getElementById('imagen').value.trim();
        var prodTipo = document.getElementById('prodTipo').value.trim();
        var prodEstatus = document.getElementById('prodEstatus').value.trim();
        if (!producto || !ingredientes || !descripcion || !precio || !imagen || !prodTipo || !prodEstatus) {
mostrarAlerta2('Todos los campos son obligatorios. Por favor, completa el formulario.');
        return;
}

if (!/^\d{0,5}(\.\d{0,2})?$/.test(precio)) {
mostrarAlerta2('Por favor, ingresa un precio válido sin simbolos con no más de 6 dígitos.');
        return;
}

var allowedExtensions = /(\.png|\.jpg)$/i;
        if (!allowedExtensions.exec(imagen)) {
mostrarAlerta2('Por favor, selecciona un archivo de imagen con extensión .png o .jpg.');
        return;
}


var formData = new FormData(document.getElementById('productoForm'));
        fetch('/private/productoAlta', {
        method: 'POST',
                body: formData
        })
        .then(response => {
        if (!response.ok) {
        return response.json().then(err => {
        throw err;
        });
        }
        return response.json();
        })
        .then(data => {
        if (data.error) {
        mostrarAlerta(data.error);
        } else {
        alert('Producto registrado con éxito');
                window.location.reload();
        }
        })
        .catch(error => {
        console.error('Error:', error);
                if (error.error) {
        mostrarAlerta(error.error);
        } else {
        mostrarAlerta('Error al registrar el producto. Por favor, inténtalo de nuevo.');
        }
        });
});


<!--Actualizar  Productos-->
document.addEventListener('DOMContentLoaded', function () {
        var enlacesEditarProducto = document.querySelectorAll('.btn-editar-producto');
        enlacesEditarProducto.forEach(function (enlace) {
        enlace.addEventListener('click', function (event) {
        document.getElementById('updateBtn').disabled = false;
                document.getElementById('submitBtn').disabled = true;
                document.getElementById('identificador').value = 'actualizar';
        });
        });
});

document.querySelectorAll('.btn-editar-producto').forEach(function (btn) {
        btn.addEventListener('click', function () {
        var prodId = this.getAttribute('data-prod-id');
                document.getElementById('prodId').value = prodId;
                document.getElementById("producto").value = this.getAttribute('data-prod-nombre');
                document.getElementById("ingredientes").value = this.getAttribute('data-prod-ingredientes');
                document.getElementById("descripcion").value = this.getAttribute('data-prod-descripcion');
                document.getElementById("precio").value = this.getAttribute('data-prod-precio');
                var selectProdTipo = document.getElementById("prodTipo");
                selectOptionByValue(selectProdTipo, this.getAttribute('data-prod-tipo'));
                var selectProdEstatus = document.getElementById("prodEstatus");
                selectOptionByValue(selectProdEstatus, this.getAttribute('data-prod-estatus'));
        });
});

document.getElementById('updateBtn').addEventListener('click', function (event) {
        event.preventDefault();
        if (!document.getElementById("producto").value.trim() || !document.getElementById("ingredientes").value.trim() ||
                !document.getElementById("descripcion").value.trim() || !document.getElementById("precio").value.trim()) {
alert('Todos los campos son obligatorios. Por favor, completa el formulario.');
        return;
}

var formData = new FormData(document.getElementById('productoForm'));
        fetch('/private/productoAlta', {
        method: 'POST',
                body: formData
        })
        .then(response => {
        if (!response.ok) {
        return response.json().then(err => {
        throw err;
        });
        }
        return response.json();
        })
        .then(data => {
        if (data.error) {
        mostrarAlerta(data.error);
        } else {
        alert('Producto Actualizado con éxito');
                window.location.reload();
        }
        })
        .catch(error => {
        console.error('Error:', error);
                if (error.error) {
        mostrarAlerta(error.error);
        } else {
        mostrarAlerta('Error al Actualizar el producto. Por favor, inténtalo de nuevo.');
        }
        });
});

function selectOptionByValue(selectElement, value) {
        for (var option of selectElement.options) {
if (option.value == value) {
option.selected = true;
        break;
} else {
console.log("Pelas");
}
}
}


<!--=============================== Actualizar Estatus del Comentario =======================================-->

function cerrarAlerta(btn) {
        btn.parentElement.style.display = 'none';
}

document.querySelectorAll('.btn-editar-comentario').forEach(function (btn) {
        btn.addEventListener('click', function () {
        var comId = this.getAttribute('data-com-id');
                var mensaje = this.getAttribute('data-com-mensaje');
                document.getElementById("comId").value = comId;
                document.getElementById("mensaje").value = mensaje;
                var selectProdTipo = document.getElementById("comTipo");
                selectOptionByValue(selectProdTipo, this.getAttribute('data-com-comTipo'));
        });
});
document.getElementById('updateBtnComentario').addEventListener('click', function (event) {
        event.preventDefault();
        var formData = new FormData(document.getElementById('updateComentarioForm'));
        fetch('/private/updateComentario', {
        method: 'POST',
                body: formData
        })
        .then(response => {
        if (!response.ok) {
        return response.json().then(err => {
        throw err;
        });
        }
        return response.json();
        })
        .then(data => {
        if (data.error) {
        alert(data.error);
        } else {
        alert('Comentario actualizado correctamente!');
                window.location.reload();
        }
        })
        .catch(error => {
        console.error('Error:', error);
                if (error.error) {
        alert(error.error);
        } else {
        alert('Error al actualizar el comentario. Por favor, inténtalo de nuevo.');
        }
        });
});

function selectOptionByValue(selectElement, value) {
        for (var option of selectElement.options) {
if (option.value == value) {
option.selected = true;
        break;
} else {
console.log("Pelas");
}
}
}


<!--=================================== Actualizar Usuarios==========================-->

document.querySelectorAll('.btn-updateAdUser').forEach(function (btn) {
        btn.addEventListener('click', function () {
        var usuId = this.getAttribute('data-usu-usuId');
                document.getElementById('usuId').value = usuId;
                document.getElementById("nombre").value = this.getAttribute('data-usu-nombre');
                document.getElementById("correo").value = this.getAttribute('data-usu-correo');
                document.getElementById("usuTipo").value = this.getAttribute('data-usu-usuTipo');
                document.getElementById("usuEst").value = this.getAttribute('data-usu-usuEst');
                var usuarioAula = document.getElementById("usuAula");
                selectOptionByValue(usuarioAula, this.getAttribute('data-usu-usuAula'));
                var usuarioTipo = document.getElementById("usuTipo");
                selectOptionByValue(usuarioTipo, this.getAttribute('data-usu-usuTipo'));
                var usuarioEstatus = document.getElementById("usuEst");
                selectOptionByValue(usuarioEstatus, this.getAttribute('data-usu-usuEst'));
        });
});

document.getElementById('updateUser').addEventListener('click', function (event) {
        event.preventDefault();
        if (!document.getElementById("nombre").value.trim() ||
                !document.getElementById("correo").value.trim()) {
mostrarAlerta('Todos los campos son obligatorios. Por favor, completa el formulario.');
        return;
}

var formData = new FormData(document.getElementById('usuarioForm'));
        fetch('/private/actualizarUsuario', {
        method: 'POST',
                body: formData
        })
        .then(response => {
        if (!response.ok) {
        return response.json().then(err => {
        throw err;
        });
        }
        return response.json();
        })
        .then(data => {
        if (data.error) {
        mostrarAlerta(data.error);
        } else {
        alert('Usuario Actualizado con éxito');
                window.location.reload();
        }
        })
        .catch(error => {
        console.error('Error:', error);
                if (error.error) {
        mostrarAlerta(error.error);
        } else {
        mostrarAlerta('Error al Actualizar el Usuario. Por favor, inténtalo de nuevo.');
        }
        });
});
