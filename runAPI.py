from flask import Flask, request, jsonify
import subprocess
import arparser

app = Flask(__name__)
parser = argparse.ArgumentParser(description='Directory of your gradlew MAS.')
parser.add_argument('masPath', type=str, help='Path to the Directory of your gradlew MAS.')
args = parser.parse_args()

@app.route('/start', methods=['POST'])
def start_command():
    data = request.get_json()
    
    if not data or data.get("command") != "start":
        return jsonify({"error": "Invalid command"}), 400

    try:
        subprocess.Popen(
            ["cmd.exe", "/c", "start", "cmd.exe", "/k", "gradlew mas"],
            cwd=args.masPath,
            creationflags=subprocess.CREATE_NEW_CONSOLE
        )

        return jsonify({
            "status": "success",
            "message": "gradlew mas started in a new terminal window."
        })
    except subprocess.CalledProcessError as e:
        return jsonify({
            "status": "error",
            "output": e.stderr
        }), 500

if __name__ == '__main__':
    app.run(debug=True, port=5000)
