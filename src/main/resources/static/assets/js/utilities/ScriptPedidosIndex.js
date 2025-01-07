var total;
//Promociones y bebidas
document.addEventListener('DOMContentLoaded', function () {
    document.querySelectorAll('.btn-agregar-bebida').forEach(function (btn) {
        btn.addEventListener('click', function () {
            var rutaImagen = this.dataset.imagen;
            var nombreProducto = this.dataset.producto;
            var precio = parseFloat(this.dataset.precio);
            var descripcion = this.dataset.descripcion;
            var cantidad = 1;
            var total = precio * cantidad;

            var cuerpoTablaPedido = document.querySelector('.modal.pedido .table tbody');
            var nuevaFila = document.createElement('tr');
            nuevaFila.innerHTML = `
                <td> <img src="${rutaImagen}" alt="avatar"  class="rounded-circle" width="35"></td>
                <td class="text-center">${nombreProducto}</td>
                <td>${descripcion}</td>
                <td class="text-center">$${precio}</td>
                <td class="text-center cantidad">${cantidad}</td>
                <td class="text-center total">$${total.toFixed(2)}</td>
                <td class="text-center">
                    <a class="text-danger mr-2" href="#" onclick="restarCantidad(this, ${precio})"><i class="fa fa-minus"></i></a>
                    <a class="text-success mr-2" href="#" onclick="sumarCantidad(this, ${precio})"><i class="fa fa-plus"></i></a>
                    <a class="text-danger mr-2" href="#" onclick="eliminarFila(this)"><i class="fa fa-trash"></i></a>
                </td>`;

            cuerpoTablaPedido.appendChild(nuevaFila);
            mostrarAlerta();
            actualizarSumaTotal();
        });
    });
});


document.addEventListener('DOMContentLoaded', (event) => {
    document.querySelectorAll('[data-target="#verifyModalContent"]').forEach(item => {
        item.addEventListener('click', function () {
            var rutaImagen = this.dataset.imagen;
            var nombreProducto = this.dataset.producto;
            var precio = parseFloat(this.dataset.precio);
            var ingredientes = this.dataset.ingredientes.split(',');

            var cuerpoModal = document.querySelector('#verifyModalContent .modal-body');
            cuerpoModal.innerHTML = '';

            ingredientes.forEach(ingrediente => {
                cuerpoModal.innerHTML += `
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" id="ingredientCheckbox-${ingrediente}" name="ingredients[]" value="${ingrediente}" checked>
                        <label class="form-check-label" for="ingredientCheckbox-${ingrediente}">${ingrediente}</label>
                    </div>`;
            });

            var botonAgregarCarrito = document.querySelector('#verifyModalContent .btn-primary');
            botonAgregarCarrito.onclick = function () {
                // Obtener los ingredientes seleccionados
                var ingredientesNoSeleccionados = Array.from(document.querySelectorAll('input[name="ingredients[]"]:checked')).map(checkbox => checkbox.value);
                var cantidad = 1;

                // Actualizar la tabla en el otro modal con los datos recopilados
                var cuerpoTablaPedido = document.querySelector('.modal.pedido .table tbody');
                var nuevaFila = document.createElement('tr');
                nuevaFila.innerHTML = `
                    <td> <img src="${rutaImagen}" alt="avatar"  class="rounded-circle" width="35"></td>
                    <td class="text-center">${nombreProducto}</td>
                    <td>${ingredientesNoSeleccionados.toString()}</td>
                    <td class="text-center">$${precio.toFixed(2)}</td>
                    <td class="text-center cantidad">${cantidad}</td>
                    <td class="text-center total">$${(cantidad * precio).toFixed(2)}</td>
                    <td class="text-center">
                        <a class="text-danger mr-2" href="#" onclick="restarCantidad(this, ${precio})"><i class="fa fa-minus"></i></a>
                        <a class="text-success mr-2" href="#" onclick="sumarCantidad(this, ${precio})"><i class="fa fa-plus"></i></a>
                        <a class="text-danger mr-2" href="#" onclick="eliminarFila(this)"><i class="fa fa-trash"></i></a>
                    </td>`;

                cuerpoTablaPedido.appendChild(nuevaFila);

                // Cerrar el modal
                $('#verifyModalContent').modal('hide');

                mostrarAlerta();
                actualizarSumaTotal();
            };
        });
    });
});

function enviarPedido() {
    var filas = document.querySelectorAll('#homeIcon .table tbody tr');
    var pedidos = [];

    filas.forEach(function (row) {
        if (row.cells.length >= 6) {
            // Obtener la imagen
            var celdaImagen = row.cells[0];
            var imagenElemento = celdaImagen.querySelector('img'); // Encuentra el primer elemento img dentro de la celda
            var rutaImagen = imagenElemento ? quitarPrefijoDeUrl(imagenElemento.src, 'http://localhost:8090') : '';

            var producto = row.cells[1].textContent.trim();
            var cantidad = parseInt(row.cells[4].textContent.trim());
            var descripcion = row.cells[2].textContent.trim();
            var total = parseFloat(row.cells[5].textContent.replace('$', ''));

            pedidos.push({producto, descripcion, cantidad, total, imagen: rutaImagen});
        } else {
            console.error('Fila encontrada con celdas insuficientes:', row);
        }
    });

    enviarDatosPedido(pedidos);
}


function enviarDatosPedido(pedidos) {
    fetch('/public/enviarPedido', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(pedidos)
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Respuesta del servidor no OK');
            }
            return response.text();
        })
        .then(text => {
            try {
                return JSON.parse(text);
            } catch (error) {
                throw new Error('La respuesta no es JSON válido: ' + text);
            }
        })
        .then(data => {
            console.log('Respuesta del servidor:', data);
        })
        .catch(error => console.error('Error:', error));


}

function quitarPrefijoDeUrl(url, prefijo) {
    return url.replace(prefijo, '');
}

function actualizarSumaTotal() {
    var totalSuma = 0;

    // Obtener todas las celdas de la columna "Total"
    var celdasTotal = document.querySelectorAll('.modal.pedido .table tbody td.text-center.total');

    // Sumar los valores de las celdas
    celdasTotal.forEach(function (celda) {
        totalSuma += parseFloat(celda.textContent.replace('$', ''));
    });

    // Actualizar el párrafo con el ID "Cantidad"
    document.getElementById('Cantidad').textContent = '$' + totalSuma.toFixed(2);
}

function mostrarAlerta() {
    window.scrollTo(0, 0);
    var alertDiv = document.createElement('div');
    alertDiv.classList.add('alert', 'alert-success', 'alert-dismissible', 'fade', 'show');
    alertDiv.innerHTML = `
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            ¡Producto agregado a mi Pedido!`;

    var contenedorAlertas = document.getElementById('contenedorAlertas');

    contenedorAlertas.appendChild(alertDiv);
    setTimeout(function () {
        alertDiv.remove();
    }, 3000);
}

function restarCantidad(elemento, precio) {
    var cantidadElemento = elemento.parentNode.previousElementSibling.previousElementSibling;
    var totalElemento = elemento.parentNode.previousElementSibling;
    var cantidad = parseInt(cantidadElemento.textContent);
    if (cantidad > 1) {
        cantidad--;
        cantidadElemento.textContent = cantidad;
        totalElemento.textContent = '$' + (cantidad * precio).toFixed(2);
        actualizarSumaTotal();
    }

}

function eliminarFila(elemento) {
    var fila = elemento.closest('tr'); // Obtener la fila que contiene el botón
    var cantidadElemento = fila.querySelector('.text-center.cantidad');
    var totalElemento = fila.querySelector('.text-center.total');

    // Restar el total de la fila de la cantidad total
    var cantidadActual = parseInt(cantidadElemento.textContent);
    var totalFila = parseFloat(totalElemento.textContent.replace('$', ''));

    // Eliminar la fila
    fila.remove();

    // Actualizar la suma total
    actualizarSumaTotal(-totalFila);

    mostrarAlerta();
}

function sumarCantidad(elemento, precio) {
    var cantidadElemento = elemento.parentNode.previousElementSibling.previousElementSibling;
    var totalElemento = elemento.parentNode.previousElementSibling;
    var cantidad = parseInt(cantidadElemento.textContent);
    cantidad++;
    cantidadElemento.textContent = cantidad;
    totalElemento.textContent = '$' + (cantidad * precio).toFixed(2);
    actualizarSumaTotal();
}

//=========================================================== Directos Index =====================
//Confirmar pedido entregado
document.addEventListener('DOMContentLoaded', function () {
    document.getElementById('enviarObsEstBtn').addEventListener('click', function (event) {
        event.preventDefault();
        var descripcion = document.getElementById('descripcion').value;
        var pedId = document.getElementById('pedId').value;
        var url = '/private/cambiarEstatusObservaciones';

        fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: 'pedId=' + encodeURIComponent(pedId) + '&descripcion=' + encodeURIComponent(descripcion)
        })
            .then(response => {
                if (response.ok) {
                    return response.text();
                } else {
                    return response.text().then(text => {
                        throw new Error(text);
                    });
                }
            })
            .then(mensaje => {
                alert(mensaje);
                location.reload();
            })
            .catch(error => {
                alert(error.message);
            });
    });
});


//Este es el primero donde muestra los detalles de cada Pedido
document.addEventListener('DOMContentLoaded', function () {
    document.querySelectorAll('#profileIcon [data-toggle="modal"]').forEach(function (btn) {
        btn.addEventListener('click', function () {
            var pedId = btn.getAttribute('data-idPedido');
            var estId = btn.getAttribute('data-idEstatus');
            var modalBody = document.querySelector('#miModalGrande .modal-body tbody');
            var modalFooter = document.querySelector('#miModalGrande .modal-footer');

            fetch('/public/' + pedId)
                .then(response => response.json())
                .then(data => {
                    modalBody.innerHTML = '';
                    modalFooter.innerHTML = '';

                    if (estId == 3) {
                        modalFooter.innerHTML = `
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>`;
                    } else {
                        modalFooter.innerHTML = `
                        <input value="${pedId}" id="pedId" hidden/>
                        <button type="button" class="btn btn-primary" data-toggle="modal"data-target="#miModalRecibido">Recibido</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>`;

                    }


                    if (data && data.length > 0) {
                        data.forEach(function (detalle) {
                            var row = '<tr>' +
                                '<td><img src="' + detalle.imagen + '" alt="avatar" class="rounded-circle" width="35"></td>' +
                                '<td>' + detalle.producto + '</td>' +
                                '<td>' + detalle.descripcion + '</td>' +
                                '<td>' + detalle.precio + '</td>' +
                                '<td>' + detalle.cantidad + '</td>' +
                                '<td>' + detalle.total + '</td>' +
                                '<td></td>' +
                                '</tr>';
                            modalBody.innerHTML += row;
                        });
                        calcularTotalPedido();
                    } else {
                        modalBody.innerHTML = '<tr><td colspan="7" class="text-center">No hay detalles disponibles</td></tr>';
                    }
                })
                .catch(error => {
                    console.error('Error al obtener los detalles del pedido: ', error);
                });


        });
    });
});

function calcularTotalPedido() {
    var total = 0;
    document.querySelectorAll('#miModalGrande .modal-body tbody tr').forEach(function (row) {
        var totalColumna = parseFloat(row.cells[5].textContent);
        if (!isNaN(totalColumna)) {
            total += totalColumna;
        }
    });

    document.getElementById('totalPedido').textContent = 'Total Pedido: ' + total.toFixed(2);
}

function confirmarYEnviarPedido() {
    if ($("#homeIcon tbody tr").length > 0) {
        if (confirm('¿Estás seguro de que quieres enviar este pedido?')) {
            enviarPedido();
            $('#ModalPedido').modal('hide');
            $("#homeIcon tbody").empty();
            $("#Cantidad").empty();
            alert("Pedido Exisitoso, mantente atendo al proceso.");
            location.reload();
        } else {
            console.log('Envío de pedido cancelado');
            $('#homeIcon').modal('hide');
        }
    } else {
        alert("Tienes que seleccionar algun producto.");
        $('#ModalPedido').modal('hide');
    }

}



