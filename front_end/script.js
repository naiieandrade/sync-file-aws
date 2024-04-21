document.getElementById('salesForm').addEventListener('submit', function(event) {
    event.preventDefault();
    
    const product = document.getElementById('product').value;
    const quantity = document.getElementById('quantity').value;
    const price = document.getElementById('price').value;

    fetch('http://localhost:5000/sales', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            product,
            quantity,
            price
        })
    })
    .then(response => {
        if (response.ok) {
            alert('Venda registrada com sucesso!');
        } else {
            alert('Erro ao registrar venda.');
        }
    })
    .catch(error => {
        console.error('Erro:', error);
        alert('Erro ao registrar venda. Por favor, tente novamente mais tarde.');
    });
});
