
class FileLoader:
    def load(self, file_path):
        f = open(file_path, 'r')
        content = f.read()
        f.close()
        return content