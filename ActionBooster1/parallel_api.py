from flask import Flask, request, jsonify
from task_distributor import TaskDistributor, Task

app = Flask(__name__)
distributor = TaskDistributor()

@app.route('/distribute', methods=['POST'])
def distribute_task():
    data = request.json
    features = data.get('features', [0.5, 0.5, 0.5])
    task = Task(features)
    result = distributor.distribute(task)
    return jsonify({"result": result})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=9090)
