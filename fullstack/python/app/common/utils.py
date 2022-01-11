import json


def read_json(json_file):
    try:
        with open(json_file, 'r') as f:
            return json.load(f)
    except (TypeError, IOError, json.decoder.JSONDecodeError):
        return iter(())
