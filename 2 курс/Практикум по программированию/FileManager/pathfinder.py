import os


class Pathfinder:
    def __init__(self, root):
        self.root = root
        self.working_directory = root

    def make_path(self, ending, beginning=None):
        path = (beginning or self.working_directory) + '\\' + ending
        if self.root not in path:
            return False
        return path

    def change_wd(self, directory):
        try:
            os.chdir(directory)
        except Exception as e:
            print(f'Unable to change directory: {e}')
        else:
            self.working_directory = directory
            print(f'Current working directory: {os.getcwd()}')

    def _set_root(self, root):
        self.root = root
