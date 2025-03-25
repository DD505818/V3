import os, sys, shutil, json
from cerberus import Validator

ENV_FILE = ".env"
SCHEMA_PATH = ".env.schema.json"
REQUIRED_KEYS = ["API_KEY", "SECRET_KEY", "BROKER", "MODE", "DB_URI"]

def sanitize(value):
    return str(value).strip().replace('"', '').replace("'", "")

def backup_existing_env():
    if os.path.exists(ENV_FILE):
        shutil.copy(ENV_FILE, ENV_FILE + ".bak")

def validate_env(data):
    schema = json.load(open(SCHEMA_PATH))
    v = Validator(schema)
    if not v.validate(data):
        raise Exception(f"[SCHEMA INVALID] {v.errors}")

def run_env_init():
    user_values = {k: os.environ.get(k, "") for k in REQUIRED_KEYS}
    if any(not v for v in user_values.values()):
        raise Exception("Missing environment variables.")
    validate_env(user_values)
    backup_existing_env()
    with open(ENV_FILE, "w") as f:
        for k, v in user_values.items():
            f.write(f"{sanitize(k)}={sanitize(v)}\n")