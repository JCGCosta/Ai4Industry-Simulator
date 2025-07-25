from flask import Flask, request, jsonify
import subprocess

app = Flask(__name__)

@app.route('/start', methods=['POST'])
def start_command():
    data = request.get_json()

    if not data or data.get("command") != "start":
        return jsonify({"error": "Invalid command"}), 400

    try:
        # Path where gradlew is located
        working_dir = r"C:\1_Arquivos\2_Pessoal\SummerSchool\hackathon"  # <-- replace this with your actual path

        # Launch a new visible terminal window that runs ./gradlew mas
        subprocess.Popen(
            ["cmd.exe", "/c", "start", "cmd.exe", "/k", "gradlew mas"],
            cwd=working_dir,
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
