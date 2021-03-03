# import cmd
import os
import shutil


def create_dir(name, cur_path):
    full_path = cur_path + '\\' + name
    try:
        os.mkdir(full_path)
    except OSError:
        print(f'Creation of the directory {full_path} failed')
    else:
        print(f'Successfully created the directory {full_path}')


def remove_dir(name, cur_path):
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


def create_file(name, cur_path):
    full_path = cur_path + '\\' + name
    try:
        open(full_path, "x")
    except FileExistsError:
        print(f'File exists: {full_path}')
    else:
        print(f'Successfully created the file {full_path}')


def write_to_file(text, name, mode, cur_path):
    full_path = cur_path + '\\' + name
    try:
        with open(full_path, mode) as f:
            f.write(text)
    except FileNotFoundError:
        print(f'File does not exist: {full_path}')
    else:
        print(f'Successfully written to the file {full_path}')


def read_file(name, cur_path):
    full_path = cur_path + '\\' + name
    try:
        with open(full_path, "r") as f:
            print(f.read())

    except FileNotFoundError:
        print(f'File does not exist: {full_path}')


def remove_file(name, cur_path):
    full_path = cur_path + '\\' + name
    try:
        os.remove(full_path)
    except FileNotFoundError:
        print(f'File does not exist: {full_path}')
    else:
        print(f'Successfully removed the file {full_path}')


def copy_file(name, destination, cur_path):
    source_path = cur_path + '\\' + name
    destination_path = destination + '\\' + name
    try:
        shutil.copyfile(source_path, destination_path)
    except IOError as e:
        print('Unable to copy file.', e)
    else:
        print(f'Successfully copied the file {source_path} to {destination_path}')


def move_file(name, destination, cur_path):
    source_path = cur_path + '\\' + name
    destination_path = destination + '\\' + name
    try:
        shutil.copyfile(source_path, destination_path)
    except IOError as e:
        print('Unable to copy file.', e)
    else:
        print(f'Successfully copied the file {source_path} to {destination_path}')


def rename_file(old_name, new_name, cur_path):
    source_path = cur_path + '\\' + old_name
    destination_path = cur_path + '\\' + new_name
    try:
        os.rename(source_path, destination_path)
    except Exception as e:
        print('Unable to rename file.', e)
    else:
        print(f'Successfully renamed the file {source_path} to {destination_path}')


if __name__ == '__main__':
    path = os.getcwd()
    print('cwd: ', path)
    #
    # create_dir('newDir1', path)
    #
    # remove_dir('newDir1', path)

    create_file('newFile', path)

    write_to_file('hi', 'newFile', 'w', path)

    create_dir('newDir', path)

    copy_file('newFile', path + '\\newDir', path)

    read_file('newFile', path)

    remove_file('newFile', path)

    path = change_dir(path + '\\newDir')

    rename_file('newFile', 'renamedFile', path)
