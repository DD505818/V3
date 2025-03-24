#!/usr/bin/env python3
import os

print("=== Vivi AI Environment Setup Wizard ===")

env_vars = {
    "EXCHANGE_API_KEY": "Your crypto exchange API key",
    "EXCHANGE_API_SECRET": "Your crypto exchange API secret",
    "ENV": "Environment mode (e.g., production, development)",
    "DATABASE_URL": "Optional: full database URL (press enter to skip)",
    "LOG_LEVEL": "Log level (e.g., INFO, DEBUG, ERROR)"
}

env_path = ".env"
with open(env_path, "w") as f:
    for key, desc in env_vars.items():
        user_input = input(f"{desc} [{key}]: ")
        if user_input.strip():
            f.write(f"{key}={user_input.strip()}
")

print(f"✅ Configuration complete. Environment saved to {env_path}")
