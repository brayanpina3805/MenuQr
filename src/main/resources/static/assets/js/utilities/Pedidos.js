document.addEventListener('DOMContentLoaded', function () {
    document.querySelectorAll('.tab-pane [data-toggle="modal"]').forEach(function (btn) {
        btn.addEventListener('click', function () {
            var pedId = btn.getAttribute('data-idPedido');
            var modalBody = document.querySelector('#miModalGrande .modal-body tbody');
            document.getElementById("modalLabelGrande").innerText = "Detalle del Pedido con id " + pedId;
            fetch('/public/' + pedId)
                .then(response => response.json())
                .then(data => {
                    modalBody.innerHTML = ''; // Limpiar el cuerpo del modal

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