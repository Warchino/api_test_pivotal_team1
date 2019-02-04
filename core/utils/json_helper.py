"""Prettier json helper"""
import json


class JsonHelper(object):
    """Class of Json helper"""

    def __init__(self):
        """Utility class"""

    @staticmethod
    def print_pretty_json(data):
        """
        Print pretty of json data
        :param data: Input data.
        """
        print(json.dumps(data, sort_keys=False, indent=4, separators=(',', ': ')))
