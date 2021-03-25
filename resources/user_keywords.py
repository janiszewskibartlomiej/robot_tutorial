import os

path = "/Users/bartlomiejjaniszewski/test_robot"


def create_folder():
    os.mkdir(path=path)


def create_sub_folder(folder_name):
    os.chdir(path)
    os.mkdir(folder_name)


def create_sub_folder_and_return_name(folder_name):
    create_sub_folder(folder_name)
    return folder_name
