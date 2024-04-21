from flask import Flask, request, jsonify
from flask_cors import CORS
from datetime import datetime

import csv
import os

app = Flask(__name__)
CORS(app)

@app.route('/sales', methods=['POST'])
def register_sale():
    data = request.json
    product = data['product']
    quantity = data['quantity']
    price = data['price']
    date = datetime.now().strftime('%Y-%m-%d')  # Obter data atual

    with open('sales.csv', mode='a', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(['IDPedido', 'Produto', 'Quantidade', 'Preço', 'Data'])
        writer.writerow([generate_order_id(), product, quantity, price, date])

    return '', 201

def generate_order_id():
    # Aqui você pode implementar uma lógica para gerar IDs de pedidos únicos, se necessário
    # Por simplicidade, vamos apenas incrementar um contador fictício neste exemplo
    if not os.path.exists('order_id.txt'):
        with open('order_id.txt', 'w') as file:
            file.write('1000')
    with open('order_id.txt', 'r+') as file:
        order_id = int(file.read())
        new_order_id = order_id + 1
        file.seek(0)
        file.write(str(new_order_id))
        return new_order_id

if __name__ == '__main__':
    app.run(debug=True)