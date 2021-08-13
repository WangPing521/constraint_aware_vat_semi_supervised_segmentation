from pathlib import Path

DATA_PATH = str(Path(__file__).parents[1] / ".data")
Path(DATA_PATH).mkdir(parents=True, exist_ok=True)
