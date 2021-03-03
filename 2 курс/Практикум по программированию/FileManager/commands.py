import os
import shutil


def create_dir(cur_path, name):
    full_path = cur_path + '\\' + name
    try:
        os.mkdir(full_path)
    except OSError:
        print(f'Creation of the directory {full_path} failed')
    else:
        print(f'Successfully created the directory {full_path}')


def remove_dir(cur_path, name):
    full_path = cur_path + '\\' + name
    try:
        os.rmdir(full_path)
    except OSError:
        print(f'Deletion of the directory {full_path} failed')
    else:
        print(f'Successfully deleted the directory {full_path}')


def change_dir(destination):
    try:
        os.chdir(destination)
    except Exception as e:
        print(f'Unable to change directory: {e}')
    else:
        print(f'Current working direction: {os.getcwd()}')
    return os.getcwd()


def create_file(cur_path, name):
    full_path = cur_path + '\\' + name
    try:
        open(full_path, "x")
    except FileExistsError:
        print(f'File exists: {full_path}')
    else:
        print(f'Successfully created the file {full_path}')


def write_to_file(cur_path, name, text, mode='w'):
    full_path = cur_path + '\\' + name
    try:
        with open(full_path, mode) as f:
            f.write(text)
    except FileNotFoundError:
        print(f'File does not exist: {full_path}')
    else:
        print(f'Successfully written to the file {full_path}')


def read_file(cur_path, name):
    full_path = cur_path + '\\' + name
    try:
        with open(full_path, "r") as f:
            print(f.read())
    except FileNotFoundError:
        print(f'File does not exist: {full_path}')


def remove_file(cur_path, name):
    full_path = cur_path + '\\' + name
    try:
        os.remove(full_path)
    except FileNotFoundError:
        print(f'File does not exist: {full_path}')
    else:
        print(f'Successfully removed the file {full_path}')


def copy_file(cur_path, name, destination):
    source_path = cur_path + '\\' + name
    destination_path = destination + '\\' + name
    try:
        shutil.copyfile(source_path, destination_path)
    except IOError as e:
        print('Unable to copy file.', e)
    else:
        print(f'Successfully copied the file {source_path} to {destination_path}')


def move_file(cur_path, name, destination):
    source_path = cur_path + '\\' + name
    destination_path = destination + '\\' + name
    try:
        shutil.copyfile(source_path, destination_path)
    except IOError as e:
        print('Unable to copy file.', e)
    else:
        print(f'Successfully copied the file {source_path} to {destination_path}')


def rename_file(cur_path, old_name, new_name):
    source_path = cur_path + '\\' + old_name
    destination_path = cur_path + '\\' + new_name
    try:
        os.rename(source_path, destination_path)
    except Exception as e:
        print('Unable to rename file.', e)
    else:
        print(f'Successfully renamed the file {source_path} to {destination_path}')


def list_dir(cur_path):
    for item in os.listdir(cur_path):
        print(item)
