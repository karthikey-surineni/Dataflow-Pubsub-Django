_SCHEMA_FOLDER = './common/schema'

import os
import json

from .file_loader import FileLoader

class SchemaLoader:
    def __init__(self, dest_table):
        self._dest_dataset = dest_table.split(".")[-2]
        self._dest_table = dest_table.split(".")[-1]
        self._file_loader = FileLoader()

    def load(self):
        schema = {}
        folder = f'{os.getcwd()}/{_SCHEMA_FOLDER}'
        for r, d, f in os.walk(folder):
            for file in f:
                print(file)
                if file.startswith(self._dest_table):
                    schema = json.loads(self._file_loader.load(f'{folder}/{file}'))
        return schema