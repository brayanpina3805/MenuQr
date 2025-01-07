    function OcualtarModalFooter() {
    var idProd = document.getElementById('clavePedidoEnProceso').value;
    document.getElementById("tituloPedido").innerText = 'Vista previa del Pedido numero ' + idProd;
    var modalFooter = document.querySelector('.modal-footer');
    if (modalFooter) {
    modalFooter.style.display = 'none';
}
}

    function MostrarModalFooter() {
    var idProd = document.getElementById('clavePedidoEnProceso').value;
    document.getElementById("tituloPedido").innerText = 'Trabajando en el Pedido numero ' + idProd;
    var modalFooter = document.querySelector('.modal-footer');
    if (modalFooter) {
    modalFooter.style.display = 'block';
}
}

    document.addEventListener('DOMContentLoaded', function () {
    document.getElementById('cambiarEstatusBtn').addEventListener('click', function (event) {
        event.preventDefault();

        var estatusSeleccionado = document.getElementById('estatusPedido').value;
        var idProd = document.getElementById('clavePedidoEnProceso').value;
        var url = '/private/cambiarEstatus';

        fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: 'pedEst=' + encodeURIComponent(estatusSeleccionado) + '&pedId=' + encodeURIComponent(idProd)
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

    document.addEventListener('DOMContentLoaded', function () {
    document.querySelectorAll('.carga-detalles').forEach(function (btn) {
        btn.addEventListener('click', function (event) {
            event.preventDefault();
            var pedId = btn.getAttribute('data-idPedido');
            document.getElementById("totalPedido").innerText = "Total:$ " + btn.getAttribute('data-total');
            document.getElementById("clavePedidoEnProceso").value = pedId;
            document.getElementById("tituloPedido").innerText = 'Vista previa del Pedido con clave ' + pedId;

            fetch('/public/' + pedId)
                .then(response => response.json())
                .then(data => {
                    var detallesPedido = document.getElementById('detallesPedido');
                    detallesPedido.innerHTML = ''; // Limpiar el contenido actual
                    if (data && data.length > 0) {
                        data.forEach(function (detalle) {
                            var row = '<tr>' +
                                '<td><img src="' + detalle.imagen + '" alt="avatar" class="rounded-circle" width="35"></td>' +
                                '<td>' + detalle.producto + '</td>' +
                                '<td>' + detalle.descripcion + '</td>' +
                                '<td>' + detalle.cantidad + '</td>' +
                                '</tr>';
                            detallesPedido.innerHTML += row;
                        });
                    } else {
                        detallesPedido.innerHTML = '<tr><td colspan="4" class="text-center">No hay detalles disponibles</td></tr>';
                    }
                })
                .catch(error => {
                    console.error('Error al obtener los detalles del pedido: ', error);
                });
        });
    });
});
