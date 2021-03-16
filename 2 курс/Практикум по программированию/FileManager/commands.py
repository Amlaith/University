import os
import shutil


def create_dir(path):
    try:
        os.mkdir(path)
    except OSError:
        return f'Creation of the directory {path} failed'
    else:
        return f'Successfully created the directory {path}'


def remove_dir(path):
    try:
        os.rmdir(path)
    except OSError:
        return f'Deletion of the directory {path} failed'
    else:
        return f'Successfully deleted the directory {path}'


def change_dir(destination):
    try:
        os.chdir(destination)
    except Exception as e:
        return f'Unable to change directory: {e}'
    else:
        return f'Current working directory: {os.getcwd()}'
    # return os.getcwd()


def create_file(path):
    try:
        open(path, "x")
    except FileExistsError:
        return f'File exists: {path}'
    except FileNotFoundError:
        dir_path = "\\".join(path.split("\\")[:-1])
        return f'No such directory: {dir_path}'
    else:
        return f'Successfully created the file {path}'


def read_file(path):
    try:
        with open(path, "r") as f:
            return f.read()
    except FileNotFoundError:
        return f'File does not exist: {path}'


def remove_file(path):
    try:
        os.remove(path)
    except FileNotFoundError:
        return f'File does not exist: {path}'
    except PermissionError as e:
        return f'Unable to remove:\n{e}'
    else:
        return f'Successfully removed the file {path}'


def copy_file(source_path, destination_path):
    try:
        shutil.copyfile(source_path, destination_path)
    except IOError as e:
        return f'Unable to copy:\n{e}'
    else:
        return f'Successfully copied the file {source_path} to {destination_path}'


def move_file(source_path, destination_path):
    try:
        shutil.copyfile(source_path, destination_path)
    except IOError as e:
        return f'Unable to move:\n{e}'
    else:
        return f'Successfully copied the file {source_path} to {destination_path}'


def rename_file(source_path, destination_path):
    try:
        os.rename(source_path, destination_path)
    except Exception as e:
        return f'Unable to rename file\n{e}'
    else:
        return f'Successfully renamed the file {source_path} to {destination_path}'


def list_dir(path):
    return os.listdir(path)
