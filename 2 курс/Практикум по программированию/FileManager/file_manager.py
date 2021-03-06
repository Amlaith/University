import cmd
import os
from commands import *


class FileManager(cmd.Cmd):
    def __init__(self):
        super().__init__()
        self.path = os.getcwd()

    def call_command(self, command, arg = ''):
        command(self.path, *arg.split())

    intro = 'Welcome to Fima file manager.   Type help or ? to list commands.\n'
    prompt = '(Fima) '

    def do_lsd(self, arg):
        'List of all files and directories in current direction: lsd'
        self.call_command(list_dir)

    def do_chd(self, destination):
        'Change working directory: chd myDir'
        self.path = change_dir(destination)

    def do_crd(self, name):
        'Create a new directory: crd myDir'
        self.call_command(create_dir, name)

    def do_rmd(self, name):
        'Remove a directory: rmd myDir'
        self.call_command(remove_dir, name)

    def do_crf(self, name):
        'Create a new file: crf myFile'
        self.call_command(create_file, name)

    def do_rmf(self, name):
        'Remove a file: rmf myFile'
        self.call_command(remove_file, name)

    def do_wtf(self, arg):
        'Prompt for a text to write to file: wtf myFile'
        self.call_command(write_to_file, arg)

    def do_EOF(self, arg):
        return True

    def do_rdf(self, arg):
        'Read a file: rdf myFile'
        self.call_command(read_file, arg)

    def do_exit(self, arg):
        'Exit file manager: exit'
        print('Thank you for using Fima')
        return True
